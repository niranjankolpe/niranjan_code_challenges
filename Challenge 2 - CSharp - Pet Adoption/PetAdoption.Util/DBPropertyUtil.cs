using System.Configuration;

namespace PetAdoption.Util
{
    public class DBPropertyUtil
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }
    }
}
