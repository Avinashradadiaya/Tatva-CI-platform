// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var x = document.getElementById("mission-grid-view");
var y = document.getElementById("mission-list-view");


const gridView = () => {


    if (x.style.display == "block") {
        x.style.display = "none";
    }
    else {
        x.style.display = "block";
        y.style.display = "none";
    }
}
const listView = () => {


    if (y.style.display == "block") {
        y.style.display = "none";
    }
    else {
        y.style.display = "block";
        x.style.display = "none";
    }
}