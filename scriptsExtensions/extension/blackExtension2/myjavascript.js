var sites = ["youtube"]; // -sites 

window.onload = gray();

function gray()
{

    var lightGray = "black";
    var black = "black";
    var darkColor = "#252830";
    var textColor = "#cfd2da";

    var find = window.location.href;

    for (var i = 0; i < sites.length; i++) {    
        if ( find.indexOf(sites[i]) >= 0) {       
            return;
        }
    };

    //alert(dmtUrl);
    document.body.style.backgroundColor = darkColor;
    document.body.style.color = "lightGray";

    var divs = document.getElementsByTagName("div");


    for (var i = 0; i < divs.length; i++) {
        divs[i].style.backgroundColor = darkColor;
        divs[i].style.color = "lightgray";
    }

    var allP = document.getElementsByTagName("p");
    for (var i = 0; i < allP.length; i++) {
        allP[i].style.color = "lightgray";
    }

    // var articles = document.getElementsByTagName("article");
    // for (var i = 0; i < articles.length; i++) {
    //     articles[i].style.backgroundColor = darkColor;
    // }

}
