using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PetAdoption.Entity;
namespace PetAdoption.BusinessLayer.Repository
{
    public class PetShelter
    {
        List<Pet> availablePets;

        public PetShelter()
        {
            availablePets = new List<Pet>();
        }

        public void AddPet(Pet pet)
        {
            availablePets.Add(pet);
        }

        public void RemovePet(Pet pet)
        {
            availablePets.Remove(pet);
        }

        public List<Pet> ListAvailablePets()
        {
            return availablePets;
        }
    }
}
