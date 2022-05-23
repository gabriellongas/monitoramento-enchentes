using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class ConexaoBD
    {
        public static SqlConnection getConnection()
        {
            string strConexao = "data source=DESKTOP-PEUQII0\\SQLEXPRESS;database=db_sme;Trusted_COnnection = true";
            SqlConnection sqlConnection = new SqlConnection(strConexao);
            sqlConnection.Open();
            return sqlConnection;
        }
    }
}
