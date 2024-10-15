using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PetAdoption.Entity;

namespace PetAdoption.BusinessLayer.Service
{
    public interface IPetAdoptionService
    {
        List<Pet> DisplayPetListings();

        int DonateCash(string donorName, decimal amount);

        void RegisterForEvent(string participantName, string participantType, int eventID);

        void AdoptAPet(string name, int age, string breed);
    }
}
