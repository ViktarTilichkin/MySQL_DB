using MySQLAPP.DAOs;
using MySQLAPP.Models;
using System.ComponentModel;
using System.Xml.Linq;

namespace MySQLAPP
{
    internal class Program
    {
        static void Main(string[] args)
        {

            AnimalsDAO query = new AnimalsDAO();
            //Animal animal = new Animal() { Name = "orel", Type = "bird" };
            //Console.WriteLine(query.Add(animal));
            //Console.ReadKey();
            //List<Animal> list = new List<Animal>
            //{
            //    //new Animal() { Name = "воробей", Type = "bird" },
            //    new Animal() { Name = "синица", Type = "bird" },
            //    new Animal() { Name = "латсочка", Type = "bird" },
            //    new Animal() { Name = "хомочек", Type = "млекопетающие" },
            //    new Animal() { Name = "дятел", Type = "bird" }
            //};
            //query.AddRange(list);
            //foreach(var item in query.GetAll())
            //{
            //    Console.WriteLine(item);    
            //}
            //Console.WriteLine(query.GetByName("дятел"));
            //foreach (var item in query.GetByType("млекопетающие"))
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine(query.DeleteByName("дятел"));
            //Console.WriteLine(query.DeleteByName("дятел"));
            Console.WriteLine(query.UpdateById(10, "нетядел", "птица"));
            Console.ReadKey();
        }
    }
}