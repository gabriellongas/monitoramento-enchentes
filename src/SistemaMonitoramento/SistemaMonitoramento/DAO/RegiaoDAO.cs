using SistemaMonitoramento.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class RegiaoDAO : PadraoDAO<RegiaoViewModel>
    {
        protected override SqlParameter[] CriaParametros(RegiaoViewModel model)
        {
            throw new System.NotImplementedException();
        }

        protected override RegiaoViewModel MontaModel(DataRow registro)
        {
            throw new System.NotImplementedException();
        }

        protected override void SetTabela()
        {
            throw new System.NotImplementedException();
        }
    }
}
