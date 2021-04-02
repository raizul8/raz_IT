window.onload = gray();

function gray()
{

    var dmtUrl = document.URL;
    var lightGray = "lightgray";

    if (dmtUrl.search(/w3schools/i) != -1)
    {		
		document.getElementById("leftcolumn").style.backgroundColor = lightGray;
        
		var linksLeftMenu = document.getElementById("leftcolumn").getElementsByTagName("a");
        for (var i = 0; i < linksLeftMenu.length; i++)
		{
            linksLeftMenu[i].style.backgroundColor = lightGray;
        }
		
		var divs = document.getElementsByTagName("div");

        for (var i = 0; i < divs.length; i++)
		{
            divs[i].style.backgroundColor = lightGray;
            divs[i].style.color = "black";
        }

        var allP = document.getElementsByTagName("p");
        for (var i = 0; i < allP.length; i++) 
		{
            allP[i].style.color = "black";
        }
    }

    else
    {
		if ( dmtUrl.search(/jekyllrb/i) != -1 || dmtUrl.search(/leveluptuts/i) != -1 || dmtUrl.search(/myline-eon.ro/i) != -1 || dmtUrl.search(/mangafox/i) != -1 || dmtUrl.search(/play.google.com/i) != -1 || dmtUrl.search(/drakensang/i) != -1 || dmtUrl.search(/127.0.0.1/i) != -1 || dmtUrl.search(/bootply.com/i) != -1 || dmtUrl.search(/codecademy/i) != -1 || dmtUrl.search(/code.org/i) != -1  || dmtUrl.search(/twitter.com/i) != -1 || dmtUrl.search(/api.jquery.com/i) != -1 || dmtUrl.search(/moqups/i) != -1 || dmtUrl.search(/steampowered/i) != -1 || dmtUrl.search(/9dragons/i) != -1 || dmtUrl.search(/websharper.com/i) != -1 || dmtUrl.search(/mangareader.net/i) != -1 || dmtUrl.search(/imdb/i) != -1 || dmtUrl.search(/youtube/i) != -1 || dmtUrl.search(/localhost/i) != -1 ) { return; }
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

    }

}