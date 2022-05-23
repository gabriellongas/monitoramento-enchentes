using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace SistemaMonitoramento.Controllers
{
    public class MenuController : PadraoController<PadraoViewModel>
    {
        public MenuController()
        {
            ExigeAutenticacao = true;
        }

        public dynamic MenuPrincipal()
        {
            RegiaoDAO dao = new RegiaoDAO();

            List<RegiaoViewModel> listaRegioes = dao.Listagem();

            CarregaViewBagBairroComQtd(50, listaRegioes);
            CarregaViewBagSensoresAtivos();
            
            ViewBag.Regioes = listaRegioes;
            int tipoUsuario;

            string admin = HttpContext.Session.GetString("Admin");
            string id = HttpContext.Session.GetString("Id");

            if (admin.Equals("true"))
                tipoUsuario = 1;
            else
                tipoUsuario = 0;

            return View("Menu-principal", tipoUsuario);
        }

        private void CarregaViewBagSensoresAtivos()
        {
            ViewBag.SensoresAtivos = TrazRegistrosAtivos();
        }

        private void CarregaViewBagBairroComQtd(int range, List<RegiaoViewModel> listaRegioes)
        {
            ViewBag.BairroComQtd = TrazRegistrosTop10(range, listaRegioes);
        }

        public IActionResult Sobre()
        {
            return View("Sobre");
        }

        public List<string[]> TrazRegistrosTop10(int dias, List<RegiaoViewModel> regioes)
        {
            DataTable tabela = HelperDAO.ExecutaProcSelect("sp_top10_enchentes", CriaParametrosTop10(dias));

            List<string[]> lista = new List<string[]>();

            RegiaoDAO dao = new RegiaoDAO();

            foreach (DataRow registro in tabela.Rows)
            {
                string[] vetor = new string[2];
                vetor[0] = registro["bairro"].ToString();
                vetor[1] = registro["qtd_enchentes"].ToString();

                lista.Add(vetor);                    
            }

            return lista;

        }

        protected SqlParameter[] CriaParametrosTop10(int range)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("Range", range);

            return parametros;
        }

        public List<string[]> TrazRegistrosAtivos()
        {
            DataTable tabela = HelperDAO.ExecutaProcSelect("sp_sensores_ativos", null);

            List<string[]> lista = new List<string[]>();

            RegiaoDAO dao = new RegiaoDAO();

            foreach (DataRow registro in tabela.Rows)
            {
                string[] vetor = new string[2];
                vetor[0] = registro["id"].ToString();
                vetor[1] = registro["ativo"].ToString();

                lista.Add(vetor);
            }

            return lista;

        }

    }

}
