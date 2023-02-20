var x = document.getElementById("mission-grid-view");
var y = document.getElementById("mission-list-view");


const gridView = () =>{
   

    if(x.style.display == "block"){
        x.style.display = "none";
    }
    else{
        x.style.display = "block";
        y.style.display ="none";
    }
}
const listView = () =>{
    var y = document.getElementById("mission-list-view");

    if(y.style.display == "block"){
        y.style.display = "none";
    }
    else{
        y.style.display = "block";
        x.style.display = "none";
    }
}