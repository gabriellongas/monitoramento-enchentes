// Progress bar chart
var heightNumber = document.getElementById("height_number").innerHTML;

level_set(heightNumber);
function level_set(heightNumber) {    
    var currentSituation = document.getElementById("current_situation");
    var levelLabel = document.getElementById("level_label");

    if (heightNumber == '+- 25cm') {
        currentSituation.setAttribute('class', 'progress-bar bg-info')
        currentSituation.setAttribute('style', 'height: 25%;')
        levelLabel.outerHTML = "Baixo";
    }
    else if (heightNumber == '+- 40cm') {
        currentSituation.setAttribute('class', 'progress-bar bg-warning')
        currentSituation.setAttribute('style', 'height: 50%;')
        levelLabel.outerHTML = "M&eacute;dio";
    }
    else if (heightNumber == '+- 55cm') {
        currentSituation.setAttribute('class', 'progress-bar bg-danger')
        currentSituation.setAttribute('style', 'height: 100%;')
        levelLabel.outerHTML = "Alto";
    }
    else {
        currentSituation.setAttribute('class', 'progress-bar')
        currentSituation.setAttribute('style', 'height: 0%;')
        levelLabel.outerHTML = "N/A";
        document.getElementById("height_number").outerHTML = "0";
    }
   
}