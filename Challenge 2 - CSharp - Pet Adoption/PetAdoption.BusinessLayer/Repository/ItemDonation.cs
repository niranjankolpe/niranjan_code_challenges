using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.BusinessLayer.Repository
{
    public class ItemDonation : Donation
    {
        string donorName;
        decimal amount;
        string itemType;

        public ItemDonation() : base()
        {
            this.donorName = string.Empty;
            this.amount = 0;
            this.itemType = string.Empty;
        }

        public void RecordDonation(string donorName, decimal amount, string ItemType)
        {
            this.donorName = donorName;
            this.amount = amount;
            this.itemType = ItemType;
        }

        public override void RecordDonation(string donorName, decimal amount)
        {
            throw new NotImplementedException();
        }
    }
}
