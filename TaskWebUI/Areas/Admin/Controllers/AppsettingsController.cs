using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TaskWebUI.DataContext;
using TaskWebUI.Models.Entity;

namespace TaskWebUI.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AppsettingsController : Controller
    {
        private readonly TaskDbContext _context;

        public AppsettingsController(TaskDbContext context)
        {
            _context = context;
        }

        // GET: Admin/Appsettings
        public async Task<IActionResult> Index()
        {
            return View(await _context.Appsettings.ToListAsync());
        }

        // GET: Admin/Appsettings/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appsetting = await _context.Appsettings
                .FirstOrDefaultAsync(m => m.Id == id);
            if (appsetting == null)
            {
                return NotFound();
            }

            return View(appsetting);
        }

        // GET: Admin/Appsettings/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Appsettings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,WebTitle,WebLogo,WebFooter")] Appsetting appsetting)
        {
            if (ModelState.IsValid)
            {
                _context.Add(appsetting);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(appsetting);
        }

        // GET: Admin/Appsettings/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appsetting = await _context.Appsettings.FindAsync(id);
            if (appsetting == null)
            {
                return NotFound();
            }
            return View(appsetting);
        }

        // POST: Admin/Appsettings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,WebTitle,WebLogo,WebLogoPath,WebFooter")] Appsetting appsetting, IFormFile movieImage)
        {
            if (id != appsetting.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string path = _context.Appsettings.AsNoTracking().FirstOrDefault(p => p.Id == id)?.WebLogo;
                    if (movieImage != null)
                    {
                        string ext = Path.GetExtension(movieImage.FileName);
                        string purePath = $"app-{Guid.NewGuid()}{ext}";
                        string fileName = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", purePath);
                        using (var fs = new FileStream(fileName, FileMode.CreateNew, FileAccess.Write))
                        {
                            movieImage.CopyTo(fs);

                        }
                        appsetting.WebLogo = purePath;


                    }
                    else if (!string.IsNullOrWhiteSpace(appsetting.WebLogoPath))
                    {
                        appsetting.WebLogo = appsetting.WebLogoPath;
                    }
                    _context.Update(appsetting);
                    await _context.SaveChangesAsync();

                    if (!string.IsNullOrWhiteSpace(path) && string.IsNullOrWhiteSpace(appsetting.WebLogoPath))
                    {
                        System.IO.File.Delete(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", path));
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AppsettingExists(appsetting.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(appsetting);
        }

        // GET: Admin/Appsettings/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appsetting = await _context.Appsettings
                .FirstOrDefaultAsync(m => m.Id == id);
            if (appsetting == null)
            {
                return NotFound();
            }

            return View(appsetting);
        }

        // POST: Admin/Appsettings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var appsetting = await _context.Appsettings.FindAsync(id);
            _context.Appsettings.Remove(appsetting);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AppsettingExists(int id)
        {
            return _context.Appsettings.Any(e => e.Id == id);
        }
    }
}
