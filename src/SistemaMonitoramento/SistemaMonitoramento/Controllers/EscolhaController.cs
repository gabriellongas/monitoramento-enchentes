using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SistemaMonitoramento.Controllers
{
    public class EscolhaController : PadraoController<PadraoViewModel>
    {
        public EscolhaController()
        {
            ExigeAutenticacao = true;
        }
        
        public IActionResult Form(int idRegiao)
        {
            int idUsuario = Convert.ToInt32(HelperControllers.GetUsuarioID(HttpContext.Session));
            //UsuarioDAO dao = new UsuarioDAO();
            //UsuarioViewModel model = dao.Consulta(idUsuario);
            UsuarioRegiaoDAO dao = new UsuarioRegiaoDAO();
            UsuarioRegiaoViewModel model = dao.ConsultaPorUsuarioRegiao(idUsuario, idRegiao);
            ListaRegioesParaView();
            return View(model);
        }

        public IActionResult Dashboard()
        {
            int idUsuario = Convert.ToInt32(HelperControllers.GetUsuarioID(HttpContext.Session));
            ListaRegioesParaUsuario();
            return View();
        }

        public void ListaRegioesParaView()
        {
            RegiaoDAO dao = new RegiaoDAO();
            List<RegiaoViewModel> listaRegioes = dao.Listagem();

            if (listaRegioes.Count > 0)
                ViewBag.Regioes = listaRegioes;
        }

        public void ListaRegioesParaUsuario()
        {
            UsuarioRegiaoDAO dao = new UsuarioRegiaoDAO();

            //List<UsuarioRegiaoViewModel> listaRegioesUser = HelperDAO.ExecutaProcSelect(NomeSpListagem, p)

            //if (listaRegioes.Count > 0)
            //    ViewBag.UsuarioRegioes = listaRegioes;
        }

        public IActionResult InsereRegiao(UsuarioRegiaoViewModel model)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("idUsuario", model.idUsuario);
            parametros[1] = new SqlParameter("idRegiao", model.idRegiao);
            parametros[2] = new SqlParameter("Nome", model.Nome);

            HelperDAO.ExecutaProcSelect("spInsert_UsuarioRegiao", parametros);

            return View("Dashboard", model);
        }
    }
}
