chart_pie_enchente_set(2)

function open_chart_pie_enchente() {
    if (document.getElementById('dropdown_pie_enchente').getAttribute('class') == 'dropdown-menu animated--fade-in') {
        document.getElementById('dropdown_pie_enchente').setAttribute('class', 'dropdown-menu animated--fade-in show')

    } else {
        document.getElementById('dropdown_pie_enchente').setAttribute('class', 'dropdown-menu animated--fade-in')
    }
}


function chart_pie_enchente_set(valor) {
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    if (valor == 1) {
        datab = parseInt(document.getElementById('datas_chart_pie_enchente_baixo').getAttribute('data-value') / 3);
        datam = parseInt(document.getElementById('datas_chart_pie_enchente_medio').getAttribute('data-value') / 2);
        dataa = parseInt(document.getElementById('datas_chart_pie_enchente_alto').getAttribute('data-value') / 4);
    } else {
        datab = document.getElementById('datas_chart_pie_enchente_baixo').getAttribute('data-value');
        datam = document.getElementById('datas_chart_pie_enchente_medio').getAttribute('data-value');
        dataa = document.getElementById('datas_chart_pie_enchente_alto').getAttribute('data-value');
    }


    // Pie Chart Example
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Alto", "Medio", "Baixo"],
            datasets: [{
                data: [dataa, datam, datab],
                backgroundColor: ['#e74a3b', '#f6c23e', '#1cc88a'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
        },
    });
}