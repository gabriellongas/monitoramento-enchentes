function open_chart_niveis() {
    if (document.getElementById('dropdown_niveis').getAttribute('class') == 'dropdown-menu animated--fade-in') {
        document.getElementById('dropdown_niveis').setAttribute('class', 'dropdown-menu animated--fade-in show')

    } else {
        document.getElementById('dropdown_niveis').setAttribute('class', 'dropdown-menu animated--fade-in')
    }
}
