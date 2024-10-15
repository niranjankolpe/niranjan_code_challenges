using System.Collections.Generic;
using PetAdoption.BusinessLayer.Repository;
using PetAdoption.Entity;

namespace PetAdoption.BusinessLayer.Service
{
    public class PetAdoptionService : IPetAdoptionService
    {
        PetAdoptionRepository _repository;
        public PetAdoptionService(PetAdoptionRepository repository)
        {
            _repository = repository;
        }
        public List<Pet> DisplayPetListings()
        {
            return _repository.DisplayPetListings();
        }

        public int DonateCash(string donorName, decimal amount)
        {
            return _repository.DonateCash(donorName, amount);
        }

        public void RegisterForEvent(string participantName, string participantType, int eventID)
        {
            _repository.RegisterForEvent(participantName, participantType, eventID);
        }

        public void AdoptAPet(string name, int age, string breed)
        {
            _repository.AdoptAPet(name, age, breed);
        }
    }
}
