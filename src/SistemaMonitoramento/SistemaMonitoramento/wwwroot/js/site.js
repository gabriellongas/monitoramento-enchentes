// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

<script src="~/lib/jquery/dist/jquery.min.js"></script>

function aplicaFiltroConsultaAvancada() {
    var vDescricao = document.getElementById('via').value;
    var vNumero = document.getElementById('numero').value;
    var vBairro = document.getElementById('bairro').value;
    var vCep = document.getElementById('cep').value;
    $.ajax({
        url: "/jogo/ObtemDadosConsultaAvancada",
        data: { descricao: vDescricao, numero: vNumero, bairro: vBairro, cep: vCep },
        success: function (dados) {
            if (dados.erro != undefined) {
                alert(dados.msg);
            }
            else {
                document.getElementById('resultadoConsulta').innerHTML = dados;
            }
        },
    });

}