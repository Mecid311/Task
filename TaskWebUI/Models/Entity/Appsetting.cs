using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.Entity
{
    public class Appsetting
    {
        public int Id { get; set; }
        public string WebTitle { get; set; }
        public string WebLogo { get; set; }
        [NotMapped]
        public string WebLogoPath { get; set; }
        public string WebFooter { get; set; }
    }
}
