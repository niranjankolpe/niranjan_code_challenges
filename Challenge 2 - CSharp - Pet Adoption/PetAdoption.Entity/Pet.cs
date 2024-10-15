using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PetAdoption.Entity
{
    public class Pet
    {
        private string _name;
        private int _age;
        private string _breed;

        public Pet()
        {
            this._name = string.Empty;
            this._age = 0;
            this._breed = string.Empty;
        }

        public Pet(string name, int age, string breed)
        {
            this._name = name;
            this._age = age;
            this._breed = breed;
        }

        public string Name { get; set; }
        public int Age { get; set; }
        public string Breed { get; set; }

        public override string ToString()
        {
            return $"Pet Name: {this._name}, Age: {this._age}, Breed: {this._breed}";
        }
    }
}
