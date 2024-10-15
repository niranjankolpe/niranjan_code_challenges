using System.Data.SqlClient;

namespace PetAdoption.Util
{
    public class DBConnUtil
    {
        public static SqlConnection GetSqlConnection()
        {
            string connectionString = DBPropertyUtil.GetConnectionString();
            SqlConnection connection = new SqlConnection(connectionString);
            return connection;
        }
    }
}
