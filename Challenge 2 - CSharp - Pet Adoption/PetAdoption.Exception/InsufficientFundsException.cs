using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetAdoption.Exception
{
    public class InsufficientFundsException : System.Exception
    {
        public override string Message
        {
            get
            {
                return "Funds are insufficient!";
            }
        }
        public InsufficientFundsException() : base()
        {

        }
        public InsufficientFundsException(string message) : base(message)
        {

        }

        public InsufficientFundsException(string message, System.Exception innerException)
            : base(message, innerException)
        {

        }
    }
}
