using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaskWebUI.Models.Entity.Membership;
using TaskWebUI.Models.ViewModel;

namespace TaskWebUI.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles ="SuperAdmin")]
    public class AdministrationController : Controller
    {
        readonly SignInManager<MUser> signInManager;
        readonly UserManager<MUser> userManager;
        readonly ILogger<AccountController> logger;
        readonly IConfiguration conf;
        private readonly RoleManager<MRole> roleManager;
        public AdministrationController(SignInManager<MUser> signInManager, UserManager<MUser> userManager
            , ILogger<AccountController> logger, IConfiguration conf,RoleManager<MRole> roleManager)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.logger = logger;
            this.conf = conf;
            this.roleManager = roleManager;
        }

        [HttpGet]
        
        public IActionResult Index()
        {
            var roles = roleManager.Roles;
            return View(roles);
        }


        [HttpGet]
       
        public IActionResult CreateRole()
        {
            return View();
        }

        [HttpPost]
        
        public async Task<IActionResult> CreateRole(CreateRoleViewModel model)
        {
            if (ModelState.IsValid)
            {
                MRole mRole = new MRole
                {
                    Name = model.RoleName
                };
                IdentityResult result = await roleManager.CreateAsync(mRole);
                if (result.Succeeded)
                {
                    return RedirectToAction("index", "administration");
                }
                foreach (IdentityError error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }      
            }
            return View(model);
        }
        [HttpGet]
        
        public async Task<IActionResult> EditRole(string Id)
        {
            var role = await roleManager.FindByIdAsync(Id);
            if (role==null)
            {
                return NotFound();
            }
            var model = new EditRoleViewModel
            {
                Id=role.Id.ToString(),
                RoleName = role.Name,
                ConcurrencyStamp=role.ConcurrencyStamp
            };
            foreach (var user in userManager.Users)
            {
                if(await userManager.IsInRoleAsync(user, role.Name))
                {
                    model.Users.Add(user.UserName);
                }
            }
            return View(model);
        }
        [HttpPost]
     
        public async Task<IActionResult> EditRole(EditRoleViewModel model)
        {
            var role = await roleManager.FindByIdAsync(model.Id);
            if (role == null)
            {
                return NotFound();
            }
            else
            {
                role.Name = model.RoleName;
                var result= await roleManager.UpdateAsync(role);

                if (result.Succeeded)
                {
                    return RedirectToAction("index");
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View(model);
            }
        }
        [HttpGet]
        
        public async Task<IActionResult> EditUsersInRole(string roleId)
        {
            ViewBag.roleId = roleId;
            var role = await roleManager.FindByIdAsync(roleId);
            if (role == null)
            {
                return NotFound();
            }

            var model = new List<UserRoleViewModel>();
         
            foreach (var user in userManager.Users)
            {
                var userRoleViewModel = new UserRoleViewModel
                {
                    UserId = user.Id,
                    UserName = user.UserName
                };

                if (await userManager.IsInRoleAsync(user,role.Name))
                {
                    userRoleViewModel.IsSelected = true;
                }
                else
                {
                    userRoleViewModel.IsSelected = false;

                }
                model.Add(userRoleViewModel);
            }
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> EditUsersInRole(List<UserRoleViewModel> model,string roleId)
        {
            var role = await roleManager.FindByIdAsync(roleId);
            if (role == null)
            {
                return NotFound();
            }
            for (int i = 0; i < model.Count; i++)
            {
              var user = await userManager.FindByIdAsync(model[i].UserId.ToString());
                IdentityResult result = null;
                if (model[i].IsSelected && !(await userManager.IsInRoleAsync(user,role.Name)))
                {
                  result= await userManager.AddToRoleAsync(user, role.Name);
                }
                else if (!model[i].IsSelected && await userManager.IsInRoleAsync(user, role.Name))
                {
                    result = await userManager.RemoveFromRoleAsync(user, role.Name);
                }
                else
                {
                    continue;
                }
                if (result.Succeeded)
                {
                    if (i<(model.Count-1))
                    {
                        continue;
                    }
                    else
                    {
                        return RedirectToAction("EditRole", new { Id = roleId });
                    }
                }
            }
            return RedirectToAction("EditRole", new { Id = roleId });
            
        }


       
    }
}
