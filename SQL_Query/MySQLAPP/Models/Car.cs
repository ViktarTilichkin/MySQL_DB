using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQLAPP.Models
{
    public class Car
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public DateTime DateCreate { get; } = DateTime.Now;
        public string Type { get; set; }
        public double Mileage { get; set; } = 0;
        public override string ToString()
        {
            return $" Id: {ID}  Name: {Name} ";
        }
    }
}
