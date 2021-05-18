using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.Entity
{
    public class News
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public string Image { get; set; }
        [NotMapped]
        public string ImagePathTemp { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public DateTime CreatedDate { get; set; }
        public int CategoryId { get; set; }
        public int? LikeCount { get; set; }
        public int? DisLikeCount { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<NewsLike> Likes { get; set; }
        public virtual ICollection<DisLike> DisLikes { get; set; }
    }
}
