using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQLAPP.Models
{
    public class User
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public DateTime lastLogin { get; set; } = DateTime.Now;
        public double Money { get; set; } = 0;

        public override string ToString()
        {
            return $" Id: {ID}  Name: {Name} ";
        }
    }
}
