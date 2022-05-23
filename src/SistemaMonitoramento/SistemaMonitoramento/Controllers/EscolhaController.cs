using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System.Collections.Generic;

namespace SistemaMonitoramento.Controllers
{
    public class EscolhaController : PadraoController<PadraoViewModel>
    {
        public EscolhaController()
        {
            ExigeAutenticacao = true;
        }
        
        public IActionResult Form()
        {
            ListaRegioesParaView();
            return View();
        }

        public IActionResult Dashboard()
        {
            return View();
        }

        public void ListaRegioesParaView()
        {
            RegiaoDAO dao = new RegiaoDAO();
            List<RegiaoViewModel> listaRegioes = dao.Listagem();

            if (listaRegioes.Count > 0)
                ViewBag.Regioes = listaRegioes;
        }


    }
}
