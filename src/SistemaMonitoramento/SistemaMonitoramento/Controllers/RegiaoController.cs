using Microsoft.AspNetCore.Mvc;
using SistemaMonitoramento.DAO;
using SistemaMonitoramento.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

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

        public IActionResult DashboardEnchente(int id)
        {
            CarregaViewBagHistoricoRegiao(200, id);
            CarregaViewBagNiveis(200, id);      
           
            return View("dashboard-enchente", DAO.Consulta(id));
        }

        private void CarregaViewBagNiveis(int range, int id)
        {
            ViewBag.Niveis = TrazRegistrosNiveis(range, id);
        }

        private void CarregaViewBagHistoricoRegiao(int range, int id)
        {
            ViewBag.HistoricoRegiao = TrazRegistrosHistoricos(range, id);
        }

        public override IActionResult Delete(int id)
        {
            base.Delete(id);
            return RedirectToAction("MenuPrincipal", "Menu");
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
                        DAO.Update(model);
                    }
                       

                    if (HelperControllers.VerificaUserLogado(HttpContext.Session) == false)
                        return RedirectToAction("Index", "Login");

                    return RedirectToAction("MenuPrincipal", "Menu");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }

        }

        public List<string[]> TrazRegistrosHistoricos(int dias, int idRegiao)
        {
            DataTable tabela = HelperDAO.ExecutaProcSelect("sp_historico", CriaParametrosHistorico(dias, idRegiao));

            List<string[]> lista = new List<string[]>();

            RegiaoDAO dao = new RegiaoDAO();

            foreach (DataRow registro in tabela.Rows)
            {
                RegiaoViewModel regiao = dao.Consulta(idRegiao);
                if (regiao != null)
                {
                    string[] vetor = new string[2];
                    vetor[0] = registro["Nivel"].ToString();
                    vetor[1] = registro["DataHora"].ToString();

                    lista.Add(vetor);
                }
            }

            return lista;

        }

        protected SqlParameter[] CriaParametrosHistorico(int range, int idRegiao)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("Range", range);
            parametros[1] = new SqlParameter("idRegiao", idRegiao);

            return parametros;
        }

        public List<string[]> TrazRegistrosNiveis(int range, int idRegiao)
        {
            DataTable tabela = HelperDAO.ExecutaProcSelect("sp_niveis", CriaParametrosNiveis(range, idRegiao));

            List<string[]> lista = new List<string[]>();

            RegiaoDAO dao = new RegiaoDAO();

            foreach (DataRow registro in tabela.Rows)
            {
                string[] vetor = new string[2];
                vetor[0] = registro["Nivel"].ToString();
                vetor[1] = registro["qtd_dados"].ToString();

                lista.Add(vetor);
                
            }

            return lista;

        }

        private SqlParameter[] CriaParametrosNiveis(int range, int idRegiao)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("Range", range);
            parametros[1] = new SqlParameter("idRegiao", idRegiao);

            return parametros;
        }

        public override IActionResult Edit(int id)
        {
            try
            {
                ViewBag.Operacao = "A";
                RegiaoViewModel model = DAO.Consulta(id);
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

        public IActionResult ExibeConsultaAvancada()
        {
            try
            {
                return View("ConsultaAvancada");
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.Message));
            }
        }



    }
}
