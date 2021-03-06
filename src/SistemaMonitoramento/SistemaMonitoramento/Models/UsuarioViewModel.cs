using Microsoft.AspNetCore.Http;
using System;

namespace SistemaMonitoramento.Models
{
    public class UsuarioViewModel : PadraoViewModel
    {
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public int TipoUsuario { get; set; }
        public string ConfirmaSenha { get; set; }
        public DateTime DataCriacao { get; set; }

        public IFormFile Imagem { get; set; }
        public byte[] ImagemEmByte { get; set; }

        public string ImagemEmBase64
        {
            get
            {   
                if (ImagemEmByte != null)
                    return Convert.ToBase64String(ImagemEmByte);
                else
                    return string.Empty;
            }
        }


        public int getDiferencaDias()
        {
            return DateTime.Now.Subtract((DateTime)DataCriacao).Days;
        }

        public string getTipoUsuarioString()
        {
            return TipoUsuario == 1 ? "Admin" : "Usuário";
        }
    }
}
