using Microsoft.AspNetCore.Mvc;
using System;
using SistemaMonitoramento.Models;
using SistemaMonitoramento.DAO;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.IO;
using System.Text;

namespace SistemaMonitoramento.Controllers
{
    public class LoginController : PadraoController<UsuarioViewModel>
    {
        public LoginController()
        {
            ExigeAutenticacao = false;
        }

        public override IActionResult Index()
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
                    HttpContext.Session.SetString("Id", model.Id.ToString());
                    if (model.TipoUsuario == 1)
                        HttpContext.Session.SetString("Admin", "true");
                    else
                        HttpContext.Session.SetString("Admin", "false");

                    ViewBag.TipoUsuario = model.TipoUsuario;

                    return RedirectToAction("MenuPrincipal", "Menu");
                }
                
                return View("Login");
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public IActionResult FazLogoff()
        {
            HttpContext.Session.Clear();

            return View("Login");
        }

        public override IActionResult Create()
        {
            try
            {
                ViewBag.Operacao = "I";
                UsuarioViewModel model = new UsuarioViewModel();
                PreencheDadosParaView("I", model);
                return View("Form", model);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        protected override void PreencheDadosParaView(string Operacao, UsuarioViewModel model)
        {
            base.PreencheDadosParaView(Operacao, model);
            ListaTipoUsersParaView();
        }

        protected void ListaTipoUsersParaView()
        {
            TipoUserDAO dao = new TipoUserDAO();
            var tipoUsers = dao.Listagem();
            List<SelectListItem> listaTipoUsers = new List<SelectListItem>();

            listaTipoUsers.Add(new SelectListItem("Selecione um tipo de usuário...", "0"));
            foreach (var tipoUser in tipoUsers)
            {
                SelectListItem item = new SelectListItem(tipoUser.Descricao, tipoUser.Id.ToString());
                listaTipoUsers.Add(item);
            }
            ViewBag.TipoUsers = listaTipoUsers;
        }

        protected override void ValidaDados(UsuarioViewModel model, string operacao)
        {

            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Preencha o nome!");

            if (string.IsNullOrEmpty(model.Email))
                ModelState.AddModelError("Email", "Preencha o E-mail!");
            else if (model.Email.IndexOf("@") == -1 || model.Email.IndexOf(".") == -1)
                ModelState.AddModelError("Email", "E-mail incorreto, falta uso do @ ou .");

            UsuarioDAO dao = new UsuarioDAO();

            if (dao.ConsultaPorUsuario(model.Email) != null)
                ModelState.AddModelError("Email", "E-mail já cadastrado!");

            if (string.IsNullOrEmpty(model.Senha))
                ModelState.AddModelError("Senha", "Preencha a senha!");
            else if (string.IsNullOrEmpty(model.ConfirmaSenha))
                ModelState.AddModelError("ConfirmaSenha", "Preencha o confirme a senha!");
            else if (model.Senha != model.ConfirmaSenha)
            {
                ModelState.AddModelError("Senha", "Senhas não conferem");
                ModelState.AddModelError("ConfirmaSenha", "Senhas não conferem");
            }

            if (model.TipoUsuario <= 0)
                ModelState.AddModelError("TipoUsuario", "Selecione o tipo de usuário");

            if (model.Imagem == null && operacao == "I")
                ModelState.AddModelError("Imagem", "Escolha uma imagem.");

            if (model.ImagemEmByte != null && model.ImagemEmByte.Length / 1024 / 1024 >= 5)
                ModelState.AddModelError("ImagemEmByte", "Foto de perfil limitado a 5 mb.");

            if (ModelState.IsValid)
            {
                if (operacao == "A" && model.Imagem == null)
                {
                    UsuarioViewModel u = dao.ConsultaPorUsuario(model.Email);
                    model.ImagemEmByte = u.ImagemEmByte;
                }
                else
                    model.ImagemEmByte = ConvertImageToByte(model.Imagem);
            }

        }

        public override IActionResult Save(UsuarioViewModel model, string Operacao)
        {
            try
            {
                ValidaDados(model, Operacao);
                if (ModelState.IsValid == false)
                {
                    ViewBag.Operacao = Operacao;
                    PreencheDadosParaView(Operacao, model);
                    return View(NomeViewForm, model);
                }
                else
                {
                    UsuarioDAO dao = new UsuarioDAO();
                    if (Operacao == "I")
                        dao.Insert(model);

                    if (HelperControllers.VerificaUserLogado(HttpContext.Session) == false)
                        return RedirectToAction("Index", "Login");

                    return RedirectToAction("Relacao", "Usuario");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public byte[] ConvertImageToByte(IFormFile file)
        {
            if (file != null)
                using (var ms = new MemoryStream())
                {
                    file.CopyTo(ms);
                    return ms.ToArray();
                }
            else
                return null;
        }

        public IActionResult Form(UsuarioViewModel model)
        {
            ViewBag.Operacao = "A";
            return View(model);
        }

    }
}
