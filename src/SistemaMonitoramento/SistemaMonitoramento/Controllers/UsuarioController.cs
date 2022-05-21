using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System;
using System.Collections.Generic;
using System.IO;

namespace SistemaMonitoramento.Controllers
{
    public class UsuarioController : PadraoController<UsuarioViewModel>
    {
        public UsuarioController()
        {
            DAO = new UsuarioDAO();
        }
        
        protected override void ValidaDados(UsuarioViewModel model, string operacao)
        {
            base.ValidaDados(model, operacao);

            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Preencha o nome!");

            if (string.IsNullOrEmpty(model.Email))
                ModelState.AddModelError("Email", "Preencha o E-mail!");
            else if (model.Email.IndexOf("@") == -1 || model.Email.IndexOf(".") == -1)
                ModelState.AddModelError("Email", "E-mail incorreto, falta uso do @ ou .");

            if (((UsuarioDAO)DAO).ConsultaPorUsuario(model.Email) != null)
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
                    UsuarioViewModel u = DAO.Consulta(model.Id);
                    model.ImagemEmByte = u.ImagemEmByte;
                }
                else                
                    model.ImagemEmByte = ConvertImageToByte(model.Imagem);                
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

        public IActionResult Form()
        {
            try
            {
                ViewBag.Operacao = "I";
                UsuarioViewModel model = new UsuarioViewModel();
                PreencheDadosParaView("I", model);
                return View(NomeViewForm, model);
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

        public IActionResult Relacao()
        {
            return View(DAO.Listagem());
        }
    }
}
