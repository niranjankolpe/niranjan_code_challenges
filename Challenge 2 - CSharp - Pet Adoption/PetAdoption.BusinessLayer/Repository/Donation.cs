using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.BusinessLayer.Repository
{
    public abstract class Donation
    {
        string donorName;
        decimal amount;

        public Donation()
        {
            this.donorName = string.Empty;
            this.amount = 0;
        }

        public abstract void RecordDonation(string donorName, decimal amount);
    }
}
