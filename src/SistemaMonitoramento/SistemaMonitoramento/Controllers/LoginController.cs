using Microsoft.AspNetCore.Mvc;
using System;
using SistemaMonitoramento.Models;
using SistemaMonitoramento.DAO;
using Microsoft.AspNetCore.Http;


namespace SistemaMonitoramento.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Logado = HelperControllers.VerificaUserLogado(HttpContext.Session);
            return View("Login");
        }

        public IActionResult FazLogin(string email, string senha)
        {
            try
            {
                UsuarioDAO dao = new UsuarioDAO();
                UsuarioViewModel model = dao.ConsultaPorUsuario(email);

                if (model == null)
                    ViewBag.Erro = "Usuário/Senha inválido";
                else if (model.Senha != senha)
                    ViewBag.Erro = "Usuário/Senha inválido";
                else
                {
                    HttpContext.Session.SetString("Logado", "true");
                    return RedirectToAction("Index", "Menu");
                }
                
                return View("Login");
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

    }
}
