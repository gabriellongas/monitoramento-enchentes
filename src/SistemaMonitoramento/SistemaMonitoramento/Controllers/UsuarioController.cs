using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace SistemaMonitoramento.Controllers
{
    public class UsuarioController : PadraoController<UsuarioViewModel>
    {

        public UsuarioController()
        {
            GeraProximoId = false;
            NomeViewIndex = "Relacao";
            DAO = new UsuarioDAO();
        }

        public IActionResult Relacao()
        {
            CarregaViewBagHistorico(60);            
            ViewBag.Usuarios = DAO.Listagem();
            ViewBag.NomeUsuario = HelperControllers.GetString(HttpContext.Session, "NomeUsuario");
            ViewBag.Imagem = HelperControllers.GetString(HttpContext.Session, "Imagem");
            ViewBag.Id = HelperControllers.GetString(HttpContext.Session, "Id");

            return View();
        }

        private void CarregaViewBagHistorico(int range)
        {
            ViewBag.Historico = TrazRegistrosHistoricos(range);
        }

        public IActionResult Perfil(int id)
        {            
            return View("Perfil", DAO.Consulta(id));
        }

        public List<string[]> TrazRegistrosHistoricos(int range)
        {
            DataTable tabela = HelperDAO.ExecutaProcSelect("sp_qtd_usuarios", CriaParametrosHistorico(range));

            List<string[]> lista = new List<string[]>();

            RegiaoDAO dao = new RegiaoDAO();

            foreach (DataRow registro in tabela.Rows)
            {
                string[] vetor = new string[2];
                vetor[0] = registro["DataCriacao"].ToString();
                vetor[1] = registro["qtd_Usuarios"].ToString();

                lista.Add(vetor);
            }

            return lista;

        }

        protected SqlParameter[] CriaParametrosHistorico(int range)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("Range", range);

            return parametros;
        }

        public override IActionResult Edit(int id)
        {
            if(HttpContext.Session.GetString("Admin").Equals("true"))
            {
                UsuarioViewModel u = DAO.Consulta(id);
                ListaTipoUsersParaView();
                ViewBag.Operacao = "A";

                return View("Form", u);
            }                

            return RedirectToAction("Relacao");
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
            ViewBag.TipoUsersEdit = listaTipoUsers;
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

            if (dao.ConsultaPorUsuario(model.Email) != null && operacao.Equals("I"))
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
                    if (Operacao == "I")
                        DAO.Insert(model);
                    else
                    {
                        UsuarioViewModel u = ((UsuarioDAO)DAO).ConsultaPorUsuario(model.Email);
                        model.Id = u.Id;
                        ((UsuarioDAO)DAO).UpdateAdmin(model);
                    }                        

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





    }
}
