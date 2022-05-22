using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System.Collections.Generic;

namespace SistemaMonitoramento.Controllers
{
    public class MenuController : Controller
    {
        protected bool ExigeAutenticacao { get; set; } = true;

        public IActionResult Index()
        {
            ViewBag.Logado = HelperControllers.VerificaUserLogado(HttpContext.Session);

            RegiaoDAO dao = new RegiaoDAO();

            return View("Menu-principal", dao.Listagem());
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (ExigeAutenticacao && !HelperControllers.VerificaUserLogado(HttpContext.Session))
                context.Result = RedirectToAction("Index", "Login");
            else
            {
                ViewBag.Logado = true;
                base.OnActionExecuting(context);
            }
        }

        public IActionResult Sobre()
        {
            return View("Sobre");
        }

    }

}
