using Microsoft.AspNetCore.Mvc;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;

namespace SistemaMonitoramento.Controllers
{
    public class RegiaoController : PadraoController<RegiaoViewModel>
    {
        public IActionResult Form()
        {
            return View();
        }

        public RegiaoController ()
        {
            DAO = new RegiaoDAO();
            ExigeAutenticacao = true;
        }
    }
}
