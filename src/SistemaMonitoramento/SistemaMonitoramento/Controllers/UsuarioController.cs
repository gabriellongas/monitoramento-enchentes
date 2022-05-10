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
        protected override void ValidaDados(UsuarioViewModel model, string operacao)
        {
            base.ValidaDados(model, operacao);

            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Preencha o nome!");

            if (string.IsNullOrEmpty(model.Email))
                ModelState.AddModelError("Email", "Preencha o E-mail!");

            if (model.Email.IndexOf("@") == -1)
                ModelState.AddModelError("Email", "E-mail incorreto!");

            if (string.IsNullOrEmpty(model.Senha))
                ModelState.AddModelError("Senha", "Preencha a senha!");

            if (model.ImagemEmByte == null && operacao == "I")
                ModelState.AddModelError("ImagemEmByte", "Escolha uma foto de perfil.");

            if (model.ImagemEmByte != null && model.ImagemEmByte.Length / 1024 / 1024 >= 5)
                ModelState.AddModelError("ImagemEmByte", "Foto de perfil limitado a 5 mb.");

            if (ModelState.IsValid)
            {
                //na alteração, se não foi informada a imagem, iremos manter a que já estava salva.
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
                UsuarioViewModel model = Activator.CreateInstance(typeof(UsuarioViewModel)) as UsuarioViewModel;
                PreencheDadosParaView("I", model);
                ListaTipoUsersParaView();
                return View(NomeViewForm, model);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public override IActionResult Create()
        {
            try
            {
                ViewBag.Operacao = "I";
                UsuarioViewModel model = new UsuarioViewModel();
                base.PreencheDadosParaView("I", model);
                ListaTipoUsersParaView();

                return View(NomeViewForm, model);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public override IActionResult Edit(int id)
        {
            try
            {
                ViewBag.Operacao = "A";
                var model = DAO.Consulta(id);
                ListaTipoUsersParaView();
                if (model == null)
                    return RedirectToAction(NomeViewIndex);
                else
                {
                    PreencheDadosParaView("A", model);
                    return View(NomeViewForm, model);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
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

    }
}
