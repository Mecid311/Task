using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.Entity.Membership
{
    [Table(name: "UserLogins", Schema = "Membership")]
    public class MUserLogin : IdentityUserLogin<int>
    {
    }
}
