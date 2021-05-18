using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaskWebUI.Models.Entity;
using TaskWebUI.Models.Entity.Membership;

namespace TaskWebUI.DataContext
{
    public class TaskDbContext : IdentityDbContext<MUser, MRole, int, MUserClaim, MUserRole, MUserLogin, MRoleClaim, MUserToken>
    {
        public TaskDbContext(DbContextOptions options)
          : base(options)
        {

        }

        public DbSet<About> Abouts { get; set; }
        public DbSet<Appsetting> Appsettings { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<Social> Socials { get; set; }
        public DbSet<NewsLike> NewsLikes { get; set; }
        public DbSet<DisLike> DisLikes { get; set; }

        #region Membership
        public DbSet<MUser> Users { get; set; }
        public DbSet<MRole> Roles { get; set; }
        public DbSet<MUserClaim> UserClaims { get; set; }
        public DbSet<MRoleClaim> RoleClaims { get; set; }
        public DbSet<MUserToken> UserTokens { get; set; }
        public DbSet<MUserLogin> UserLogins { get; set; }
        public DbSet<MUserRole> UserRoles { get; set; }
        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<News>(e =>
            {
                e.Property(p => p.CreatedDate)
                .HasDefaultValueSql("dateadd(Hour, 4, getutcdate())");

            });
            modelBuilder.Entity<MUser>(e =>
            {
                e.ToTable("Users", "Membership");
            });

            modelBuilder.Entity<MRole>(e =>
            {
                e.ToTable("Roles", "Membership");
            });

            modelBuilder.Entity<MRoleClaim>(e =>
            {
                e.ToTable("RoleClaims", "Membership");
            });

            modelBuilder.Entity<MUserClaim>(e =>
            {
                e.ToTable("UserClaims", "Membership");
            });

            modelBuilder.Entity<MUserToken>(e =>
            {
                e.ToTable("UserTokens", "Membership");
            });

            modelBuilder.Entity<MUserLogin>(e =>
            {
                e.ToTable("UserLogins", "Membership");
            });

            modelBuilder.Entity<MUserRole>(e =>
            {
                e.ToTable("UserRoles", "Membership");
            });

        }
    }
}
