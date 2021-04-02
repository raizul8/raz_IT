var sites = ["myline-eon.ro","mangafox","mangareader","play.google.com","127.0.0.1","twitter.com","moqups","imdb","localhost","http://css3please.com/","www.pinterest.com","github.com/raizul8","www.youtube.com","http://www.pornhub.com/","http://codepen.io/","https://docs.google.com","http://codepen.io/","http://192.168.1.1/","drive.google.com","flipboard.com","dartpad.dartlang.org","http://www.gorillatoolkit.org/","http://hentaihaven.org/","lnmtl","http://code.runnable.com/","www.draw.io"]; // -sites 

window.onload = gray();

function gray()
{
// "rgb(160,160,160)"

    // var lightGray = "rgb(170,170,170)";
    var darkBlue = "#252830";
    var gray = "rgb(170,170,170)";

    var find = window.location.href;


    for (var i = 0; i < sites.length; i++) {    
        if ( find.indexOf(sites[i]) >= 0) {       
            return;
        }
    };



    //alert(dmtUrl);
    document.body.style.backgroundColor = darkBlue;
    document.body.style.color = gray;
    document.body.style.textShadow = "none";

    htmlElement = document.querySelector("html");
    htmlElement.backgroundColor = darkBlue;
    // alert(htmlElement)

    var divs = document.getElementsByTagName("div");
    for (var i = 0; i < divs.length; i++) {
        divs[i].style.backgroundColor = darkBlue;
        divs[i].style.color = gray;
        divs[i].style.textShadow = "none";
    }

    var allP = document.getElementsByTagName("p");
    for (var i = 0; i < allP.length; i++) {
        allP[i].style.color = gray;
        allP[i].style.textShadow = "none";
    }

    var allT = document.getElementsByTagName("table");
    for (var i = 0; i < allT.length; i++) {
        allT[i].style.backgroundColor = darkBlue;
    }

    var articles = document.getElementsByTagName("article");
    for (var i = 0; i < articles.length; i++) {
        articles[i].style.backgroundColor = darkBlue;
        articles[i].style.textShadow = "none";
    }

    var sect = document.getElementsByTagName("section");
    for (var i = 0; i < sect.length; i++) {
        sect[i].style.backgroundColor = darkBlue;
        sect[i].style.color = gray;
        sect[i].style.textShadow = "none";
    }

}
