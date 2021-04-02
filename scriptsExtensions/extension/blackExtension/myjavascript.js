var sites = ["myline-eon.ro","mangafox","mangareader","play.google.com","127.0.0.1","twitter.com","moqups","imdb","localhost","http://css3please.com/","www.pinterest.com","github.com/raizul8","www.youtube.com","http://www.pornhub.com/","http://codepen.io/","https://docs.google.com","http://www.youporn.com/","books.google","http://codepen.io/","http://192.168.1.1/","drive.google.com","http://www.madthumbs.com/","www.evernote.com","flipboard.com","dartpad.dartlang.org","http://www.dailymotion.com/","http://www.gorillatoolkit.org/","http://hentaihaven.org/","http://lnmtl.com"]; // -sites 

window.onload = gray();

function gray()
{

    var lightGray = "black";
    var black = "black";

    var find = window.location.href;

    for (var i = 0; i < sites.length; i++) {    
        if ( find.indexOf(sites[i]) >= 0) {       
            return;
        }
    };

    //alert(dmtUrl);
    document.body.style.backgroundColor = lightGray;
    document.body.style.color = "black";

    var divs = document.getElementsByTagName("div");


    for (var i = 0; i < divs.length; i++) {
        divs[i].style.backgroundColor = lightGray;
        divs[i].style.color = "black";
    }

    var allP = document.getElementsByTagName("p");
    for (var i = 0; i < allP.length; i++) {
        allP[i].style.color = "black";
    }

    var articles = document.getElementsByTagName("article");
    for (var i = 0; i < articles.length; i++) {
        articles[i].style.backgroundColor = lightGray;
    }

}
