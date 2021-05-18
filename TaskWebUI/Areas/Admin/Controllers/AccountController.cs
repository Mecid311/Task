
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using TaskWebUI.Models.Entity.Membership;
using TaskWebUI.Models.FormModel;
using TaskWebUI.Models.ViewModel;


namespace TaskWebUI.Areas.Admin.Controllers
{
    [Area("Admin")]
    
    public class AccountController : Controller
    {
        readonly SignInManager<MUser> signInManager;
        readonly UserManager<MUser> userManager;
        readonly ILogger<AccountController> logger;
        readonly IConfiguration conf;
        public AccountController(SignInManager<MUser> signInManager, UserManager<MUser> userManager
            , ILogger<AccountController> logger, IConfiguration conf)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.logger = logger;
            this.conf = conf;
        }

        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(LoginFormModel model)
        {
            if (ModelState.IsValid)
            {
                var foundedUser = await userManager.FindByEmailAsync(model.Username);

                if (foundedUser == null)
                {
                    TempData["Message"] = "Istifadeci tapilmadi";
                    return View(model);
                }

                var signinResult = await signInManager
                    .PasswordSignInAsync(foundedUser, model.Password, true, true);

                if (!signinResult.Succeeded)
                {
                    TempData["Message"] = "Istifadeci adi ve ya sifresi sehvdir";
                    return View(model);
                }
            }
            return RedirectToAction("Index", "Categories");
        }


        [HttpGet]
        public IActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.GetUserAsync(User);
                if (user == null)
                {
                    return RedirectToAction("Login");
                }
                var result = await userManager.ChangePasswordAsync(user, model.CurrentPassword, model.NewPassword);
                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return View();
                }
                await signInManager.RefreshSignInAsync(user);
                return View("ChangePasswordConfirmation");
            }
            return View(model);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult ResetPassword(string token, string email)
        {
            if (token == null || email == null)
            {
                ModelState.AddModelError("", "Invalid password reset token");
            }
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByEmailAsync(model.Email);
                if (user != null)
                {
                    var result = await userManager.ResetPasswordAsync(user, HttpUtility.UrlDecode(model.Token), model.Password);
                    if (result.Succeeded)
                    {
                        return View("ResetPasswordConfirmation");
                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                    return View(model);
                }
                return View("ResetPasswordConfirmation");
            }

            return View(model);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult ForgotPassword()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByEmailAsync(model.Email);
                if (user != null && await userManager.IsEmailConfirmedAsync(user))
                {
                    var token = await userManager.GeneratePasswordResetTokenAsync(user);
                    var passwordResetLink = Url.Action("ResetPassword", "Account", new
                    {
                        email = model.Email,
                        token = HttpUtility.UrlEncode(token)
                    }, Request.Scheme);
                    logger.Log(LogLevel.Warning, passwordResetLink);

                    var host = conf.GetValue<string>("emailAccount:smtpServer");
                    var port = conf.GetValue<int>("emailAccount:smtpPort");
                    var userName = conf.GetValue<string>("emailAccount:UserName");
                    var password = conf.GetValue<string>("emailAccount:password");
                    var cc = conf.GetValue<string>("emailAccount:cc").
                        Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);


                    SmtpClient client = new SmtpClient(host, port);
                    client.Credentials = new NetworkCredential(userName, password);
                    client.EnableSsl = true;

                    MailMessage message = new MailMessage(userName, model.Email);


                    foreach (var mailAddress in cc)
                    {
                        message.CC.Add(mailAddress);
                    }
                    message.Subject = "TaskWebUI";
                    message.Body = passwordResetLink;
                    message.IsBodyHtml = true;

                    client.Send(message);

                    return View("ForgotPasswordConfirmation");
                }
            }

            return View(model);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();

            return RedirectToAction("login", "account");
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult Accesdenied()
        {
            return View();
        }

    }
}
