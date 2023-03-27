using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using MySQLAPP.Models;
using Mysqlx.Crud;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace MySQLAPP.DAOs
{
    public class AnimalsDAO
    {
        private string? _connectionString;
        public string ConnectionString
        {
            get
            {
                //if (_connectionString is null)
                //{
                //    _connectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json", optional: true, reloadOnChange: true).Build().GetConnectionString("MyDatabase");
                //}
                //_connectionString = _connectionString is null ? 
                //    new ConfigurationBuilder()
                //    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                //    .Build().GetConnectionString("MyDatabase") 
                //    : _connectionString;
                //_connectionString ??= new ConfigurationBuilder()
                //    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                //    .Build().GetConnectionString("MyDatabase");
                //return _connectionString;
                return _connectionString ??= new ConfigurationBuilder()
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .Build().GetConnectionString("MyDatabase");
            }
        }
        private readonly string SQL_insertItem = "insert into animals(`name`, `type`) values (@name, @type);";
        private const string SQL_selectItems = "select id, `name`, `type` from animals";
        // private readonly string SQL_selectOneItem = "SELECT * FROM animals where {0};";
        private readonly string SQL_selectOneItem = $"{SQL_selectItems} where {{0}} = {{1}};";
        private readonly string SQL_deleteItem = "delete from animals where {0};";
        private readonly string SQL_updateItem = "update animals set name = '{1}' , type = '{2}' where id = {0};";
        public int Add(Animal animal)
        {

            if (animal == null) throw new ArgumentNullException(nameof(animal));
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                MySqlCommand command = new MySqlCommand(SQL_insertItem, connection);
                command.Parameters.AddWithValue("@name", animal.Name);
                command.Parameters.AddWithValue("@type", animal.Type);
                command.ExecuteNonQuery();
                return (int)command.LastInsertedId;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public void AddRange(List<Animal> animals)
        {
            if (animals == null) throw new ArgumentNullException(nameof(animals));
            if (animals.Count == 0) return;
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                string[] insert = new string[animals.Count];
                for (int i = 0; i < animals.Count; i++)
                {
                    insert[i] = $"(@name{i}, @type{i})";
                }
                MySqlCommand command = new MySqlCommand(string.Format(SQL_insertItem, string.Join(",", insert)), connection);
                for (int i = 0; i < animals.Count; i++)
                {
                    var animal = animals[i];
                    command.Parameters.AddWithValue($"@name{i}", animal.Name);
                    command.Parameters.AddWithValue($"@type{i}", animal.Type);
                }
                command.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);     
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public List<Animal> GetAll()
        {
            List<Animal> animals = new List<Animal>();
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                MySqlCommand command = new MySqlCommand(SQL_selectItems, connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Animal animal = new Animal();
                    animal.ID = reader.GetInt32(0);
                    animal.Name = reader.GetString(1);
                    animal.Type = reader.GetString(2);
                    animals.Add(animal);
                }
                return animals;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public Animal GetByName(string name)
        {
            Animal animal = new Animal();
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                Console.WriteLine(string.Format(SQL_selectOneItem, "name", "@name"));

                MySqlCommand command = new MySqlCommand(string.Format(SQL_selectOneItem, "name", "@name"), connection);
                command.Parameters.AddWithValue($"@name", name);
                MySqlDataReader reader = command.ExecuteReader();
                reader.Read();
                animal.ID = reader.GetInt32(0);
                animal.Name = reader.GetString(1);
                animal.Type = reader.GetString(2);
                return animal;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public List<Animal> GetByType(string type)
        {
            List<Animal> animals = new List<Animal>();
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                MySqlCommand command = new MySqlCommand(string.Format(SQL_selectOneItem, $"type = '{type}'"), connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Animal animal = new Animal();
                    animal.ID = reader.GetInt32(0);
                    animal.Name = reader.GetString(1);
                    animal.Type = reader.GetString(2);
                    animals.Add(animal);
                }
                return animals;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public bool DeleteByName(string name)
        {
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                MySqlCommand command = new MySqlCommand(string.Format(SQL_deleteItem, $"name = '{name}'"), connection);
                MySqlDataReader reader = command.ExecuteReader();
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public bool UpdateById(int id, string name, string type)
        {
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection error");
            try
            {
                MySqlCommand command = new MySqlCommand(string.Format(SQL_updateItem, id, name, type), connection);
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) return true; // как узнать что тру?
                return false;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        private MySqlConnection Connection()
        {
            try
            {
                MySqlConnection connection = new MySqlConnection(ConnectionString);
                connection.Open();
                return connection;
            }
            catch (MySqlException ex)
            {
                return null;
            }
        }

    }
}
