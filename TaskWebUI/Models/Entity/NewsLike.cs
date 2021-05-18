using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.Entity
{
    public class NewsLike
    {
        public int Id { get; set; }
        public int NewsId { get; set; }
        public virtual News News { get; set; }
        public string UserId { get; set; }
    }
}
