using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TaskWebUI.Models.ViewModel
{
    public class UserViewModel
    {
        public UserViewModel()
        {
            Users = new List<string>();
        }
        public int Id { get; set; }
        public string ConcurrencyStamp { get; set; }

        public List<string> Users { get; set; }
    }
}
