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

            CarregaViewBagBairroComQtd(100);
            CarregaViewBagSensoresAtivos();
            
            ViewBag.Regioes = dao.Listagem();
            int tipoUsuario;

            string admin = HttpContext.Session.GetString("Admin");
            string id = HttpContext.Session.GetString("Id");

            UsuarioDAO uDao = new UsuarioDAO();
            UsuarioViewModel model = uDao.Consulta(Convert.ToInt32(id));
            HttpContext.Session.SetString("NomeUsuario", model.Nome);
            HttpContext.Session.SetString("Imagem", model.ImagemEmBase64);

            ViewBag.NomeUsuario = HelperControllers.GetString(HttpContext.Session, "NomeUsuario");
            ViewBag.Imagem = HelperControllers.GetString(HttpContext.Session, "Imagem");
            ViewBag.Id = HelperControllers.GetString(HttpContext.Session, "Id");

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

        private void CarregaViewBagBairroComQtd(int range)
        {
            ViewBag.BairroComQtd = TrazRegistrosTop10(range);
        }

        public IActionResult Sobre()
        {
            return View("Sobre");
        }

        public List<string[]> TrazRegistrosTop10(int dias)
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

        public IActionResult ConsultaAvancada()
        {
            RegiaoDAO dao = new RegiaoDAO();

            ViewBag.Regioes = dao.Listagem();
            return View("ConsultaAvancadaRegiao");
        }

        
        public IActionResult ObtemDadosConsultaAvancada(string via, int numero, string bairro, string cep)
        {
            try
            {
                RegiaoDAO dao = new RegiaoDAO();
                if (string.IsNullOrEmpty(via))
                    via = "";

                if (numero <= 0)
                    numero = 0;

                if (string.IsNullOrEmpty(bairro))
                    bairro = "";

                if (string.IsNullOrEmpty(cep))
                    cep = "";

                var lista = dao.ConsultaAvancadaRegiao(via, numero, bairro, cep);

                return PartialView("pvGridRegioes", lista);
            }
            catch (Exception erro)
            {
                return Json(new { erro = true, msg = erro.Message });
            }
        }
        


    }

}
