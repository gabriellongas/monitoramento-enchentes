using SistemaMonitoramento.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class TipoUserDAO : PadraoDAO<TipoUserViewModel>
    {
        protected override SqlParameter[] CriaParametros(TipoUserViewModel model)
        {
            SqlParameter[] parametros = new SqlParameter[5];
            parametros[0] = new SqlParameter("id_TipoUser", model.Id);
            parametros[1] = new SqlParameter("desc_tipoUser", model.Descricao);

            return parametros;
        }

        protected override TipoUserViewModel MontaModel(DataRow registro)
        {
            TipoUserViewModel tu = new TipoUserViewModel();

            tu.Id = Convert.ToInt32(registro["id_TipoUser"]);
            tu.Descricao = registro["desc_tipoUser"].ToString();
            
            return tu;
        }

        protected override void SetTabela()
        {
            Tabela = "TipoUser";
            }
    }
}
