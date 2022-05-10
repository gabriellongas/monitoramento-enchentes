using SistemaMonitoramento.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class UsuarioDAO : PadraoDAO<UsuarioViewModel>
    {
        protected override SqlParameter[] CriaParametros(UsuarioViewModel model)
        {
            SqlParameter[] parametros = new SqlParameter[5];
            parametros[0] = new SqlParameter("Id", model.Id);
            parametros[1] = new SqlParameter("Nome", model.Nome);
            parametros[2] = new SqlParameter("Email", model.Email);
            parametros[3] = new SqlParameter("Senha", model.Senha);
            parametros[4] = new SqlParameter("DataCadastro", model.DataCadastro);
            parametros[5] = new SqlParameter("TipoUsuario", model.TipoUsuario);
            parametros[6] = new SqlParameter("ImagemEmByte", model.ImagemEmByte);

            return parametros;
        }

        protected override UsuarioViewModel MontaModel(DataRow registro)
        {
            UsuarioViewModel u = new UsuarioViewModel();

            u.Id = Convert.ToInt32(registro["Id"]);
            u.Nome = registro["Nome"].ToString();
            u.Email = registro["Email"].ToString();
            u.Senha = registro["Senha"].ToString();
            u.DataCadastro = Convert.ToDateTime(registro["DataCadastro"]);
            u.TipoUsuario = Convert.ToInt32(registro["TipoUsuario"]);
            u.ImagemEmByte = registro["ImagemEmByte"] as byte[];

            return u;
        }

        protected override void SetTabela()
        {
            Tabela = "Usuarios";
        }

        public UsuarioViewModel ConsultaPorUsuario(string usuarioString)
        {
            var u = new SqlParameter[]
            {
                new SqlParameter("Usuario", usuarioString),
            };
            var tabela = HelperDAO.ExecutaProcSelect("spConsulta_PorUsuario", u);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }
    }
}
