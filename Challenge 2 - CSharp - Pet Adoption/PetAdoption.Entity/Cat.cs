using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.Entity
{
    public class Cat : Pet
    {
        private string _name;
        private int _age;
        private string _breed;
        private string _catColor;

        public Cat() : base()
        {
            this._name = string.Empty;
            this._age = 0;
            this._breed = string.Empty;
            this._catColor = string.Empty;
        }
        public Cat(string name, int age, string breed, string catColor) : base(name, age, breed)
        {
            this._name = name;
            this._age = age;
            this._breed = breed;
            this._catColor = catColor;
        }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Breed { get; set; }
        public string CatColor { get; set; }
    }
}
