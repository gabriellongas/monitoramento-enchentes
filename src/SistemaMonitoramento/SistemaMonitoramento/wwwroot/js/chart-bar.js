chart_bar_set()

function open_chart_bar() {
    if (document.getElementById('dropdown_bar_principal').getAttribute('class') == 'dropdown-menu animated--fade-in') {
        document.getElementById('dropdown_bar_principal').setAttribute('class', 'dropdown-menu animated--fade-in show')
    } else {
        document.getElementById('dropdown_bar_principal').setAttribute('class', 'dropdown-menu animated--fade-in')
    }
}

function chart_bar_set() {
    const data = document.getElementById('datas_chart_bar').getAttribute('data-value');
    console.log(data);
}