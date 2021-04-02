var sites = ["myline-eon.ro","mangafox","mangareader","play.google.com","127.0.0.1","twitter.com","moqups","imdb","localhost","http://css3please.com/","www.pinterest.com","github.com/raizul8","www.youtube.com","http://www.pornhub.com/","://codepen.io/","https://docs.google.com","http://codepen.io/","http://192.168.1.1/","drive.google.com","flipboard.com","dartpad.dartlang.org","http://www.gorillatoolkit.org/","http://hentaihaven.org/","lnmtl","http://code.runnable.com/","www.draw.io","emag.ro/history"]; // -sites 

window.onload = gray();

function gray()
{
// "rgb(160,160,160)"

    // var lightGray = "rgb(170,170,170)";
    var lightGray = "rgb(180,180,180)";
    var darkGray = "rgb(70,70,70)";
    var black = "black";
    var green = "#3a8a3a";

    var find = window.location.href;

    if (find.indexOf("https://www.youtube.com/") != -1) {
       
        setTimeout(function(){
            // var spanList = document.getElementsByTagName("span");
            // for (var i = 0; i < spanList.length; i++) {
            //     spanList[i].style.color = lightGray;
            // }

            var container = document.getElementById("container");
            container.style.backgroundColor = darkGray;

            var ytd_watch = document.getElementsByTagName("ytd-watch");
            ytd_watch[0].style.backgroundColor = darkGray;
            // for (var i = 0; i < ytd_watch.length; i++) {
            //     alert("k");
            //     ytd_watch[i].style.backgroundColor = darkGray;
            // }

            // var alist = document.getElementsByTagName("a");
            // for (var i = 0; i < alist.length; i++) {
            //     alist[i].style.color = lightGray;
            // }


            // var h3list = document.getElementsByTagName("h3");
            // for (var i = 0; i < h3list.length; i++) {
            //     h3list[i].style.color = lightGray;
            // }

            // var h1list = document.getElementsByTagName("h1");
            // for (var i = 0; i < h1list.length; i++) {
            //     h1list[i].style.color = lightGray;
            // }

            // alert("This is on youtube");

            return
        }, 3500);

        
    }

    for (var i = 0; i < sites.length; i++) {    
        if ( find.indexOf(sites[i]) >= 0) {       
            return;
        }
    };



    if (find.indexOf("https://github.com") != -1) {
        setTimeout(function(){

            var span_plc = document.getElementsByClassName("pl-c");

            for (var i = 0; i < span_plc.length; i++) {
                span_plc[i].style.color = green;
            }

            var preList = document.getElementsByTagName("pre");
            
            for (var i = 0; i < preList.length; i++) {
                preList[i].style.backgroundColor = "rgb(190,190,190)"
            }
            


        }, 2000);

    }

    if (find.indexOf("gobyexample.com") != -1) {
        var td = document.getElementsByTagName("td");

        for (var i = 0; i < td.length; i++) {
            td[i].style.backgroundColor = lightGray;
        }
        
    }

    allDark()

}

function allDark() {
    var lightGray = "rgb(180,180,180)";
    var black = "black";
    var green = "#3a8a3a";

    // alert(dmtUrl);
    document.body.style.backgroundColor = lightGray;
    document.body.style.color = "black";

    htmlElement = document.querySelector("html");
    htmlElement.backgroundColor = lightGray;
    // alert(htmlElement)

    var divs = document.getElementsByTagName("div");
    for (var i = 0; i < divs.length; i++) {
        divs[i].style.backgroundColor = lightGray;
        divs[i].style.color = "black";
    }

    var allP = document.getElementsByTagName("p");
    for (var i = 0; i < allP.length; i++) {
        allP[i].style.color = "black";
    }

    var allT = document.getElementsByTagName("table");
    for (var i = 0; i < allT.length; i++) {
        allT[i].style.backgroundColor = lightGray;
    }

    var articles = document.getElementsByTagName("article");
    for (var i = 0; i < articles.length; i++) {
        articles[i].style.backgroundColor = lightGray;
    }

    var sect = document.getElementsByTagName("section");
    for (var i = 0; i < sect.length; i++) {
        sect[i].style.backgroundColor = lightGray;
        sect[i].style.color = "black";
    }

    // var alist = document.getElementsByTagName("a");
    // for (var i = 0; i < alist.length; i++) {
    //     alist[i].style.color = "darkSlateBlue";
    // }

    var spanList = document.getElementsByTagName("span");
    for (var i = 0; i < spanList.length; i++) {
        // spanList[i].style.backgroundColor = lightGray;
        spanList[i].style.color = "black";
        // spanList[i].style.textShadow = "0px 0px 0px black";
    }

    var html = document.documentElement;
    html.style.backgroundColor = lightGray;

    var preList = document.getElementsByTagName("pre");
    
    for (var i = 0; i < preList.length; i++) {
        preList[i].style.backgroundColor = lightGray;
    }


}

