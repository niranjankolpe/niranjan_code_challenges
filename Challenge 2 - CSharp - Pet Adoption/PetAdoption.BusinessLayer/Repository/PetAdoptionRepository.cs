using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using PetAdoption.Util;
using PetAdoption.Entity;

namespace PetAdoption.BusinessLayer.Repository
{
    public class PetAdoptionRepository : IPetAdoptionRepository
    {
        static List<Pet> PetList;
        static List<CashDonation> cashDonationList;
        static SqlConnection connection;
        static string sqlQuery;
        static SqlCommand sqlCommand;

        public static void SyncPets()
        {
            connection.Open();
            sqlQuery = "SELECT * FROM Pet";
            sqlCommand = new SqlCommand(sqlQuery, connection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                Pet pet = new Pet();
                pet.Name = sqlDataReader.GetString(1);
                pet.Age = sqlDataReader.GetInt32(2);
                pet.Breed = sqlDataReader.GetString(3);
                PetList.Add(pet);
            }
            sqlDataReader.Close();
            connection.Close();
        }
        public PetAdoptionRepository()
        {
            connection = DBConnUtil.GetSqlConnection();
            PetList = new List<Pet>();
            cashDonationList = new List<CashDonation>();
        }
        public List<Pet> DisplayPetListings()
        {
            return PetList;
        }

        public int DonateCash(string donorName, decimal amount)
        {
            CashDonation cd = new CashDonation();
            cd.DonorName = donorName;
            cd.Amount = amount;
            cd.DonationDate = DateTime.Now;
            connection.Open();
            sqlQuery = $"INSERT INTO Donation VALUES ('{cd.DonorName}', {cd.Amount}, '{cd.DonationDate}'); SELECT SCOPE_IDENTITY();";
            sqlCommand = new SqlCommand(sqlQuery, connection);
            int donationID = Convert.ToInt32(sqlCommand.ExecuteScalar());
            connection.Close();
            return donationID;
        }

        public void RegisterForEvent(string participantName, string participantType, int eventID)
        {
            throw new NotImplementedException();
        }

        public void AdoptAPet(string name, int age, string breed)
        {
            throw new NotImplementedException();
        }
    }
}
