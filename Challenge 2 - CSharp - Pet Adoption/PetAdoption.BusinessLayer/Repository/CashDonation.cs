using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.BusinessLayer.Repository
{
    public class CashDonation : Donation
    {
        string donorName;
        decimal amount;
        DateTime donationDate;

        public string DonorName { get; set; }
        public decimal Amount { get; set; }

        public DateTime DonationDate { get; set; }

        public CashDonation() : base()
        {
            this.donorName = string.Empty;
            this.amount = 0;
        }

        public override void RecordDonation(string donorName, decimal amount)
        {
            this.donorName = donorName;
            this.amount = amount;
            this.donationDate = DateTime.Now;
        }
    }
}
