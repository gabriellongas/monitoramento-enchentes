using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;

namespace SistemaMonitoramento.Controllers
{
    public static class HelperControllers
    {
        public static Boolean VerificaUserLogado(ISession session)
        {
            string logado = session.GetString("Logado");
            if (logado == null)
                return false;
            else
                return true;
        }

        public static Boolean VerificaStatusAdminLogado(ISession session)
        {
            string StatusAdmin = session.GetString("Admin");
            if (StatusAdmin == "true")
                return true;
            else
                return false;
        }

        public static string GetString(ISession session, string stringProcurada)
        {
            return session.GetString(stringProcurada);
        }

    }
}
