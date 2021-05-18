using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TaskWebUI.DataContext;
using TaskWebUI.Models.Entity;
using TaskWebUI.Models.Entity.Membership;
using TaskWebUI.Models.ViewModel;

namespace TaskWebUI.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {
        readonly SignInManager<MUser> signInManager;
        readonly UserManager<MUser> userManager;
       


        readonly TaskDbContext db;
        public HomeController(TaskDbContext db, SignInManager<MUser> signInManager, UserManager<MUser> userManager) 
        {
            this.db = db;
            this.signInManager = signInManager;
            this.userManager = userManager;
            
        }
        public IActionResult Index()
        {
            var resume = db.News.OrderByDescending(r=>r.CreatedDate).Include(r=>r.Category).Include(r=>r.Likes).Include(r=>r.DisLikes).ToList();
            
            return View(resume);
        }
        public IActionResult Getnews(int? catid)
        {

            IQueryable<News> query = db.News.Include(m => m.Category);
                    

            if (catid != 0)
            {
                query = query.Where(m => m.CategoryId == catid);

            }

            return Ok(query.ToList());


        }
        public IActionResult Search(string text)
        {

            IQueryable<News> query = db.News.Include(m => m.Category);

            if (!string.IsNullOrEmpty(text))
            {
                query = query.Where(m => m.Title.Contains(text));
            }

            return Ok(query.AsNoTracking().ToList());
        }
        public async Task<IActionResult> Details(int? id)
        {
            var model = new DetailsViewModel();
            model.News = db.News.Include(n=>n.Likes).Include(n=>n.DisLikes).FirstOrDefault(r => r.Id == id);
            return View(model);
        }
        public IActionResult About()
        {
            var resume = db.Abouts.FirstOrDefault();
            return View(resume);
        }


        [HttpPost]
        public async Task<IActionResult> Like(NewsLike like)
        {
            if (ModelState.IsValid)
            {
                like.UserId = "1";

                if (!db.NewsLikes.AsNoTracking().Any(p => p.UserId == like.UserId && p.NewsId == like.NewsId))
                    {
 
                        db.NewsLikes.Add(like);

                        await db.SaveChangesAsync();
                    }
                
              

                return Json(new
                {
                    error = false,
                    likeCount = db.NewsLikes.Count(c => c.NewsId == like.NewsId)
                });
            }

            return Json(new
            {
                error = true,
                message = ""
            });
        }

        [HttpPost]
        public async Task<IActionResult>DisLike(DisLike dislike)
        {
            if (ModelState.IsValid)
            {
                dislike.UserId = "1";


                if (!db.DisLikes.AsNoTracking().Any(p => p.UserId == dislike.UserId && p.NewsId == dislike.NewsId) )
                {

                    db.DisLikes.Add(dislike);

                    await db.SaveChangesAsync();
                }



                return Json(new
                {
                    error = false,
                    dislikeCount = db.DisLikes.Count(c => c.NewsId == dislike.NewsId)
                });
            }

            return Json(new
            {
                error = true,
                message = ""
            });
        }


    }
}
