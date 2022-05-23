using Microsoft.AspNetCore.Http;
using SistemaMonitoramento.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace SistemaMonitoramento.DAO
{
    public class UsuarioDAO : PadraoDAO<UsuarioViewModel>
    {
        protected override SqlParameter[] CriaParametros(UsuarioViewModel model)
        {
            object imgByte = model.ImagemEmByte;
            if (imgByte == null)
                imgByte = DBNull.Value;

            SqlParameter[] parametros = new SqlParameter[6];
            parametros[0] = new SqlParameter("Id", model.Id);
            parametros[1] = new SqlParameter("Nome", model.Nome);
            parametros[2] = new SqlParameter("Email", model.Email);
            parametros[3] = new SqlParameter("Senha", model.Senha);
            parametros[4] = new SqlParameter("TipoUsuario", model.TipoUsuario);
            parametros[5] = new SqlParameter("Imagem", imgByte);
            

            return parametros;
        }

        protected override UsuarioViewModel MontaModel(DataRow registro)
        {
            UsuarioViewModel u = new UsuarioViewModel();

            u.Id = Convert.ToInt32(registro["Id"]);
            u.Nome = registro["Nome"].ToString();
            u.Email = registro["Email"].ToString();
            u.Senha = registro["Senha"].ToString();
            u.TipoUsuario = Convert.ToInt32(registro["TipoUsuario"]);
            u.DataCriacao = Convert.ToDateTime(registro["DataCriacao"]);

            if (registro["imagem"] != DBNull.Value)
                u.ImagemEmByte = registro["imagem"] as byte[];

            return u;
        }

        protected override void SetTabela()
        {
            Tabela = "Usuarios";
        }

        public UsuarioViewModel ConsultaPorUsuario(string email)
        {
            var u = new SqlParameter[]
            {
                new SqlParameter("Email", email),
            };
            var tabela = HelperDAO.ExecutaProcSelect("spConsulta_PorEmail", u);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
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

        public override void Insert(UsuarioViewModel model)
        {
            base.Insert(model);
            UsuarioViewModel u = ConsultaPorUsuario(model.Email);

            byte[] bytes = Convert.FromBase64String(model.ImagemEmBase64);
            string str = Convert.ToBase64String(bytes);
 
            string path = "IMG/usuarioimagem" + u.Id + ".txt";

            // Creating some string array to
            // write into the file
            string createText = str;

            // Calling WriteAllLines() function to write
            // the specified string array into the file
            File.WriteAllText(path, createText, Encoding.UTF8);

            // Reading the file contents
            string[] readText = File.ReadAllLines(path, Encoding.UTF8);
        }

        public string getImagemString(UsuarioViewModel model)
        {
            string imagemEmString = "";

            foreach (Byte bite in model.ImagemEmByte)
            {
                imagemEmString += bite.ToString();
            }

            return imagemEmString;
        }
    }
}
