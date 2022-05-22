using Microsoft.AspNetCore.Mvc;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;

namespace SistemaMonitoramento.Controllers
{
    public class RegiaoController : PadraoController<RegiaoViewModel>
    {
        public IActionResult Form()
        {
            NomeViewIndex = "";
            return View();
        }

        public RegiaoController ()
        {
            DAO = new RegiaoDAO();
            ExigeAutenticacao = true;
        }

        public IActionResult DashboardEnchente(int id)
        {            
            return View("dashboard-enchente", DAO.Consulta(id));
        }

        public override IActionResult Delete(int id)
        {
            base.Delete(id);
            return RedirectToAction("Index", "Menu");
        }

        protected override void ValidaDados(RegiaoViewModel model, string operacao)
        {
            base.ValidaDados(model, operacao);

            if (((RegiaoDAO)DAO).ConsultaPorNome(model.Nome) != null)
                ModelState.AddModelError("Nome", "Região já cadastrada!");

            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Preencha o nome!");

            if (model.Numero <= 0)
                ModelState.AddModelError("Numero", "Número inválido!");

            if (string.IsNullOrEmpty(model.Endereco))
                ModelState.AddModelError("Endereco", "Preencha o endereço!");

            if (string.IsNullOrEmpty(model.Cidade))
                ModelState.AddModelError("Cidade", "Preencha a cidade!");

            if (string.IsNullOrEmpty(model.Estado))
                ModelState.AddModelError("Endereco", "Preencha o endereço");

            if (string.IsNullOrEmpty(model.CEP))
                ModelState.AddModelError("Endereco", "Preencha o endereço");
        }

        public override IActionResult Save(RegiaoViewModel model, string Operacao)
        {
            if (ModelState.IsValid == false)
            {
                ViewBag.Operacao = Operacao;
                PreencheDadosParaView(Operacao, model);
                return View(NomeViewForm, model);

            }
            
            else
            {
                base.Save(model, Operacao);
                return RedirectToAction("Index", "Menu");
            }

        }


    }
}
