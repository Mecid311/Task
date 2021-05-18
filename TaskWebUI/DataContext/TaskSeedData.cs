using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaskWebUI.Models.Entity.Membership;

namespace TaskWebUI.DataContext
{
  static public class TaskSeedData
    {
        static public IApplicationBuilder Seed(this IApplicationBuilder app)
        {
            using (var scope = app.ApplicationServices.CreateScope())
            {
                var db = scope.ServiceProvider.GetRequiredService<TaskDbContext>();


                var userManager = scope.ServiceProvider
                   .GetRequiredService<UserManager<MUser>>();
                var roleManager = scope.ServiceProvider
                     .GetRequiredService<RoleManager<MRole>>();

                if (roleManager.FindByNameAsync("SuperAdmin").Result == null)
                {
                    var superAdminRole = roleManager.CreateAsync(new MRole
                    {
                        Name = "SuperAdmin"
                    }).Result;

                    if (superAdminRole.Succeeded)
                    {
                        if (userManager.FindByEmailAsync("majidan@code.edu.az").Result == null)
                        {
                            var mecid = new MUser
                            {
                                UserName = "mecid",
                                Email = "majidan@code.edu.az"
                            };

                            var u1Result = userManager.CreateAsync(mecid, "123").Result;

                            var emin = new MUser
                            {
                                UserName = "emin",
                                Email = "necefovmecid@gmail.com"
                            };

                            var u2Result = userManager.CreateAsync(emin, "123").Result;
                          
                        }
                    }
                }


            }

            return app;
        }
    }
}
