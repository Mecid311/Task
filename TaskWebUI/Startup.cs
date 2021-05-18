using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaskWebUI.AppCode.Filters;
using TaskWebUI.DataContext;
using TaskWebUI.Models.Entity.Membership;

namespace TaskWebUI
{
    public class Startup
    {
        readonly IConfiguration conf;
        public Startup(IConfiguration conf)
        {
            this.conf = conf;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRazorPages();
            services.AddControllersWithViews(cfg =>
            {

                cfg.Filters.Add<JsonSerializerFilter>();

                var policy = new AuthorizationPolicyBuilder()
                       .RequireAuthenticatedUser()
                       .Build();

                cfg.Filters.Add(new AuthorizeFilter(policy));
            });

            services.AddDbContext<TaskDbContext>(cfg =>
            {
                //cfg.UseInMemoryDatabase(databaseName: "CV");
                cfg.UseSqlServer(conf.GetConnectionString("cString"));
            },ServiceLifetime.Scoped);
            services.AddIdentity<MUser, MRole>()
             .AddEntityFrameworkStores<TaskDbContext>().AddDefaultTokenProviders();

            services.Configure<IdentityOptions>(cfg =>
            {
                cfg.User.RequireUniqueEmail = true;

                cfg.Password.RequireDigit = false;
                cfg.Password.RequireNonAlphanumeric = false;
                cfg.Password.RequiredLength = 3;
                cfg.Password.RequireUppercase = false;
                cfg.Password.RequireLowercase = false;
            });
            services.ConfigureApplicationCookie(cfg =>
            {
                cfg.LoginPath = "/signin.html";
                cfg.AccessDeniedPath = "/Admin/Account/Accesdenied";
                cfg.Cookie.Name = "Cp";
                cfg.ExpireTimeSpan = TimeSpan.FromMinutes(10);
                cfg.SlidingExpiration = true;
            });

            services.AddRouting(opt =>
            {
                opt.LowercaseUrls = true;
                //opt.LowercaseQueryStrings = true;
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.Seed();
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapAreaControllerRoute(
               name: "areaAdmin",
               areaName: "Admin",
               pattern: "Admin/{controller=categories}/{action=index}/{id:int:min(1)?}"
           );
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=home}/{action=index}/{id:int:min(1)?}"
                    );
                endpoints.MapAreaControllerRoute(
                name: "default",
                areaName: "Admin",
                pattern: "signin.html",
                defaults: new
                {
                    controller = "Account",
                    action = "Login",
                    area = "admin"
                });
            });
        }
    }
}
