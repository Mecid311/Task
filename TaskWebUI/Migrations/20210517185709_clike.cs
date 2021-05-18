using Microsoft.EntityFrameworkCore.Migrations;

namespace TaskWebUI.Migrations
{
    public partial class clike : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "DisLikeCount",
                table: "News",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LikeCount",
                table: "News",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DisLikeCount",
                table: "News");

            migrationBuilder.DropColumn(
                name: "LikeCount",
                table: "News");
        }
    }
}
