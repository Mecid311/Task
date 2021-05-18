using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.Entity
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<News> News { get; set; }
    }
}
