// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

<script src="~/lib/jquery/dist/jquery.min.js"></script>

function aplicaFiltroConsultaAvancada() {
    var vNome = document.getElementById('nome').value;
    var vCidade = document.getElementById('cidade').value;
    var vEstado = document.getElementById('estado').value;
    $.ajax({
        url: "/Regiao/ObtemDadosConsultaAvancada",
        data: { nome: vNome, cidade: vCidade, estado: vEstado },
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