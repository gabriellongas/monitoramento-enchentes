﻿using SistemaMonitoramento.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.DAO
{
    public class RegiaoDAO : PadraoDAO<RegiaoViewModel>
    {
        protected override SqlParameter[] CriaParametros(RegiaoViewModel model)
        {

            SqlParameter[] parametros = new SqlParameter[7];
            parametros[0] = new SqlParameter("Nome", model.Nome);
            parametros[1] = new SqlParameter("Endereco", model.Endereco);
            parametros[2] = new SqlParameter("Numero", model.Numero);
            parametros[3] = new SqlParameter("Bairro", model.Bairro);
            parametros[4] = new SqlParameter("Cidade", model.Cidade);
            parametros[5] = new SqlParameter("Estado", model.Estado);
            parametros[6] = new SqlParameter("CEP", model.CEP);

            return parametros;
        }

        protected override RegiaoViewModel MontaModel(DataRow registro)
        {
            RegiaoViewModel r = new RegiaoViewModel();

            r.Id = Convert.ToInt32(registro["Id"]);
            r.Nome = registro["Nome"].ToString();
            r.Endereco = registro["Endereco"].ToString();
            r.Numero = Convert.ToInt32(registro["Numero"]);
            r.Bairro = registro["Bairro"].ToString();
            r.Cidade = registro["Cidade"].ToString();
            r.Estado = registro["Estado"].ToString();
            r.CEP = registro["CEP"].ToString();

            return r;   
        }

        protected override void SetTabela()
        {
            Tabela = "Regiao";
        }

        public RegiaoViewModel ConsultaPorNome(string nome)
        {
            var u = new SqlParameter[]
            {
                new SqlParameter("Nome", nome),
            };
            var tabela = HelperDAO.ExecutaProcSelect("spConsulta_PorNome", u);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }

        public RegiaoViewModel ConsultaPorBairro(string bairro)
        {
            var u = new SqlParameter[]
            {
                new SqlParameter("Bairro", bairro),
            };
            var tabela = HelperDAO.ExecutaProcSelect("spConsulta_PorBairro", u);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }
    }
}
