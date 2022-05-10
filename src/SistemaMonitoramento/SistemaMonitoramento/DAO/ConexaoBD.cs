using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class ConexaoBD
    {
        public static SqlConnection getConnection()
        {
            string strConexao = "data source=DESKTOP-AUHG4DS\\SQLEXPRESS;database=db_sme;user id=sa;password=123456";
            SqlConnection sqlConnection = new SqlConnection(strConexao);
            sqlConnection.Open();
            return sqlConnection;
        }
    }
}
