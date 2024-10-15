using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.Exception
{
    public class InvalidPetAgeException : System.Exception
    {
        public override string Message
        {
            get
            {
                return "Given Pet Age is invalid!";
            }
        }
        public InvalidPetAgeException() : base()
        {

        }
        public InvalidPetAgeException(string message) : base(message)
        {

        }

        public InvalidPetAgeException(string message, System.Exception innerException)
            : base(message, innerException)
        {

        }
    }
}
