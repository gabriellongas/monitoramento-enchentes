// Progress bar chart
level_set();
function level_set() {
    var levelLabel = document.getElementById("level_label");
    if (levelLabel.innerHTML == 'Low') {
        levelLabel.setAttribute('class', 'nav-link bg-success text-white rounded')
    }
    else if (levelLabel.innerHTML == 'High') {      
        levelLabel.setAttribute('class', 'nav-link bg-danger text-white rounded')        
    }
    else if (levelLabel.innerHTML == 'Medium') { 
        levelLabel.setAttribute('class', 'nav-link bg-warning text-white rounded')
    }
    else { 
        levelLabel.setAttribute('class', 'nav-link bg-secondary text-white rounded')
    }
}


