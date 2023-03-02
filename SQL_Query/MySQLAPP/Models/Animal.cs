using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQLAPP.Models
{
    public class Animal
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }

        public override string ToString()
        {
            return $" Id: {ID}  Name: {Name} Type: {Type}"; 
        }
    }
}
