using SistemaMonitoramento.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class UsuarioRegiaoDAO : PadraoDAO<UsuarioRegiaoViewModel>
    {
        protected override SqlParameter[] CriaParametros(UsuarioRegiaoViewModel model)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("idUsuario", model.idUsuario);
            parametros[1] = new SqlParameter("idRegiao", model.idRegiao);
            parametros[2] = new SqlParameter("Nome", model.Nome);

            return parametros;
        }

        protected override UsuarioRegiaoViewModel MontaModel(DataRow registro)
        {
            UsuarioRegiaoViewModel model = new UsuarioRegiaoViewModel();

            model.Id = Convert.ToInt32(registro["Id"]);
            model.idUsuario = Convert.ToInt32(registro["IdUsuario"]);
            model.idRegiao= Convert.ToInt32(registro["IdRegiao"]);
            model.Nome = registro["Nome"].ToString();

            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Usuario_Regiao";
        }

        public override void Delete(int id)
        {
            var p = new SqlParameter[]
            {
                 new SqlParameter("Id", id),
                 new SqlParameter("Tabela", Tabela)
            };
            HelperDAO.ExecutaProc("spDelete", p);
        }

        public UsuarioRegiaoViewModel ConsultaPorUsuarioRegiao(int idUsuario, int idRegiao)
        {
            var p = new SqlParameter[]
            {
                new SqlParameter("idUsuario", idUsuario),
                new SqlParameter("idRegiao", idRegiao),
            };
            var tabela = HelperDAO.ExecutaProcSelect("spConsulta_UsuarioRegiao", p);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }

    }
}
