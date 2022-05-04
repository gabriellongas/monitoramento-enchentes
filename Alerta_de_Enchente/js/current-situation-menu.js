// Progress bar chart
level_set();
function level_set() {
    var levelLabel = document.getElementById("level_label");
    if (levelLabel.innerHTML == 'Baixo') {
        levelLabel.setAttribute('class', 'nav-link bg-info rounded')
    }
    else if (levelLabel.innerHTML == 'Alto') {      
        levelLabel.setAttribute('class', 'nav-link bg-danger rounded')        
        
    console.log(levelLabel)
    }
    else {
        levelLabel.setAttribute('class', 'nav-link bg-warning rounded')
    }

}


