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

  //==== = = = = = = = = = = = = volunteering mission page = == ==================

const AddComment = () => {

    var c = document.getElementById("exampleFormControlTextarea1").value;

    var x = document.createElement('div')

    x.innerHTML = ` <div id="comment-desc" class="bg-white mb-3">
    <div class="row">
        <div class="col-md-1"><img  class="volunteer-img p-3" src="~/images/volunteer4.png" alt=""></div>
        <div class="col-md-11">
            <h4>Estella Fowles</h4>
            <p id="current-time">${Date()}</p>
            <div id="saw-comment">${c}</div>
        </div>
        
    </div>
    
</div>`

    document.getElementById('comment-container').appendChild(x)
}