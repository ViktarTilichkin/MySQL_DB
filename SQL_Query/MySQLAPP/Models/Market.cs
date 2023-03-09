using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQLAPP.Models
{
    public class Market
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Adress { get; set; }
        public string Phone { get; set; }
        public int CountPlace { get; set; }
        public DateTime TimeFrom { get; set; }
        public DateTime TimeTo { get; set; }
        public override string ToString()
        {
            return $" Id: {ID}  Name: {Name} Type: ";
        }
    }
}
