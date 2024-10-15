using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PetAdoption.Entity;
using PetAdoption.Exception;
using PetAdoption.BusinessLayer.Repository;
using PetAdoption.BusinessLayer.Service;

namespace PetAdoption.UI
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Welcome to Pet Adoption Application!\n");
            PetAdoptionRepository repository = new PetAdoptionRepository();
            PetAdoptionService service = new PetAdoptionService(repository);
            
            bool exit = true;
            string option = string.Empty;
            while (exit)
            {
                Console.WriteLine("Choose a task: 1. Display Pet Listings 2. Donate Cash, 3. Register for Event, 4. Exit");
                option = Console.ReadLine();
                try
                {
                    switch (option)
                    {
                        // Display Pet Listings
                        case "1":
                            List<Pet> petList = service.DisplayPetListings();
                            Console.WriteLine("Pet Name,  Age, Breed");
                            foreach(Pet pet in petList)
                            {
                                Console.WriteLine(pet.Name + " " + pet.Age + " " + pet.Breed);
                            }
                            break;

                        // Cash Donation
                        case "2":
                            Console.Write("Enter your name: ");
                            string donorName = Console.ReadLine();
                            if (donorName == "")
                                throw new PetAdoption.Exception.NullReferenceException();
                            Console.Write("Enter donation amount: ");
                            decimal amount = decimal.Parse(Console.ReadLine());
                            int donationID = service.DonateCash(donorName, amount);
                            Console.WriteLine($"Cash Donation Successful with Donation ID: {donationID}");
                            break;

                        // Register for an event
                        case "3":
                            Console.Write("Enter your name: ");
                            string participantName = Console.ReadLine();
                            if (participantName == "")
                                throw new PetAdoption.Exception.NullReferenceException();
                            Console.Write("Enter your type: ");
                            string participanType = Console.ReadLine();
                            if (participanType == "")
                                throw new PetAdoption.Exception.NullReferenceException();
                            Console.Write("Enter event ID: ");
                            int eventID = int.Parse(Console.ReadLine());
                            service.RegisterForEvent(participantName, participanType, eventID);
                            Console.WriteLine("Event Registration Successful!");
                            break;

                        // Exit Case
                        case "4":
                            exit = false;
                            Console.WriteLine("Exiting...");
                            break;
                        default:
                            break;
                    }
                }
                catch (NotImplementedException ex)
                {
                    Console.WriteLine("Stay tuned, this feature will be added shortly!");
                }
                catch (AdoptionException ex)
                {
                    Console.WriteLine("Seems we got some bug with us, we will get it fixed soon!");
                }
                catch (FileNotFoundException ex)
                {
                    Console.WriteLine("Seems we got some bug with us, we will get it fixed soon!");
                }
                catch (InsufficientFundsException ex)
                {
                    Console.WriteLine("Funds are insufficient dear user!");
                }
                catch (InvalidPetAgeException ex)
                {
                    Console.WriteLine("Pet age is invalid, try again!");
                }
                catch (PetAdoption.Exception.NullReferenceException ex)
                {
                    Console.WriteLine("Null entry not allowed try again!");
                }
                catch (System.Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            Console.WriteLine("\nThanks for using Pet Adoption Application :)");
            // Program End

            // Footer
            Console.WriteLine("\n============================================");
            Console.WriteLine("Process Completed! Press any key to close...");
            Console.ReadKey();
        }
    }
}
