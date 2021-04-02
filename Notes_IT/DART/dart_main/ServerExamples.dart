//http status in dart:io
HttpStatus.BAD_GATEWAY
HttpHeaders.CONTENT_TYPE
// contentType
ContentType.JSON;

// Virtual dir example 1
library simple_http_server;

import 'dart:io';
import 'package:http_server/http_server.dart' show VirtualDirectory;

final MY_HTTP_ROOT_PATH = Platform.script.resolve('web').toFilePath();

void main() {
  var virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH);
  virDir.allowDirectoryListing = true;
    // The following are needed in dev mode to be able to access
    // Dart packages in the cache.
    virDir
    ..followLinks = true
    ..jailRoot = false;

  HttpServer.bind('127.0.0.1', 8080).then((server) {
    print(InternetAddress.LOOPBACK_IP_V4);
    server.listen((request) {
      print(request.uri.path);
      virDir.serveRequest(request);
    });
  });
}

// Server example 3
import 'dart:io';
import 'dart:convert';
import 'package:http_server/http_server.dart' show VirtualDirectory;


// Provides CORS headers, so can be accessed from any other page


final HOST = "0.0.0.0"; // eg: localhost 
final PORT = 8080; 
final Directory dir = new Directory('../web');
VirtualDirectory virDir = new VirtualDirectory('../web');

void main() {
  virDir.allowDirectoryListing = true;

    virDir
    ..followLinks = true
    ..jailRoot = false;
  
  HttpServer.bind(HOST, PORT).then((server) {
    server.listen((HttpRequest request) {
      switch (request.method) {
        case "GET": 
          handleGet(request);
          break;
        case "POST": 
          handlePost(request);
          break;
        case "OPTIONS":
          handleOptions(request);
          break;
        default: defaultHandler(request);
      }
    });
    
    print("Listening for GET and POST on http://$HOST:$PORT");
  }).catchError((e) => print(e));
}

/**
 * Handle GET requests by reading the contents of data.json
 * and returning it to the client
 */
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  print("method ${req.method}: path: ${req.uri.path}");
  addCorsHeaders(res);
  String path = req.uri.path;
  
  switch(path) {
    case "/":
      virDir.serveFile(new File('../web/index.html'), req);
      break; 
    case "/home":
      virDir.serveFile(new File('../web/home.html'), req);
      break; 
    case '/htmlFiles':
      List<String> listFiles = findAllFiles(dir);
      res.headers.add(HttpHeaders.CONTENT_TYPE, 'application/json');
      res.write(JSON.encode(listFiles));
      res.close();
      break;
      
    default:
      virDir.serveRequest(req);
  }
  
}


/**
 * Handle POST requests by overwriting the contents of data.json
 * Return the same set of data back to the client.
 */
void handlePost(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  String path = req.uri.path;
  addCorsHeaders(res);
  
  req.listen((List<int> buffer) {
    res.write(UTF8.decode(buffer));
    res.close();
  });
  
}

/**
 * Add Cross-site headers to enable accessing this server from pages
 * not served by this server
 * 
 * See: http://www.html5rocks.com/en/tutorials/cors/ 
 * and http://enable-cors.org/server.html
 */
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*, ");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

void handleOptions(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  // print("${req.method}: ${req.uri.path}");
  res.statusCode = HttpStatus.NO_CONTENT;
  res.close();
}

void defaultHandler(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.statusCode = HttpStatus.NOT_FOUND;
  res.write("Not found: ${req.method}, ${req.uri.path}");
  res.close();
}

void printError(error) => print(error);

List<String> findAllFiles(Directory dir) {
  List<String> htmlFiles = [];
  
  dir
    .listSync(recursive: true, followLinks: false)
    .forEach((FileSystemEntity entity) {
      String path = entity.path;
      
      if(path.endsWith('.html')) {
        htmlFiles.add(path.replaceFirst("web/", ""));
      }
    });
  
  return htmlFiles;
}


// Server router example 2
// routeServer project

import 'dart:io';
import 'package:http_server/http_server.dart' show VirtualDirectory;

import 'package:route/server.dart';
import 'package:route/url_pattern.dart';

// Pattern for all posts (plural).
final postsUrl = new UrlPattern(r'/posts\/?');

// Pattern for a single post('/post/24', for example).
final postUrl = new UrlPattern(r'/post/(\d+)\/?');


// Callback for all posts (plural).
servePosts(req) {
  req.response.write("All blog posts");
  req.response.close();
}

// Callback for a single post('/post/24', for example).
servePost(HttpRequest req) {
  var postId = postUrl.parse(req.uri.path)[0];
  req.response.write('Blog post $postId');
  req.response.close();
}

// Callback to handle illegal urls.
serveNotFound(HttpRequest req) {
  req.response.statusCode = HttpStatus.NOT_FOUND;
  req.response.write('Not found');
  req.response.close();
}

void handlePost(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  
  req.listen((List<int> buffer) {
    
    //return the same results back to the client
    res.add(buffer);
//    res.write("Succes");
    
    res.close();
  },
  onError: printError);
}

void printError(error) => print(error);

void handleGet(HttpRequest request) {
  HttpResponse res = request.response;

  switch(request.uri.path) {
    case '/':
      res.headers.add(HttpHeaders.CONTENT_TYPE, 'text/plain');
      res.write("This is home");
      res.close();
      break;
    default:
      virDir.serveRequest(request);

  }

}

void defaultHandler(HttpRequest req) {
  HttpResponse res = req.response;
  res.statusCode = HttpStatus.NOT_FOUND;
  res.write("Not found: ${req.method}, ${req.uri.path}");
  res.close();
}

final String HOST = "127.0.0.1";
final int PORT = 8080;
VirtualDirectory virDir = new VirtualDirectory('web');

void main() {
  virDir.allowDirectoryListing = true;
  virDir.jailRoot = false;
  
  HttpServer.bind(HOST, PORT).then((server) {
    var router = new Router(server)
      // Associate callbacks with URLs.
      ..serve(postsUrl, method: 'GET').listen(servePosts)
      ..serve(postUrl, method: 'GET').listen(servePost)
      ..defaultStream.listen((HttpRequest req) {
      switch(req.method) {
        case "GET":
          handleGet(req);
          break;
        case "POST":
          handlePost(req);
          break;
        default: defaultHandler(req);
      }
    });
    
    print("Listening for GET and POST on http://$HOST:$PORT");
    
  }, onError: (e) => print("Server Error:\n $e") );  
}


// catch error from async Time that would normally kill the program
  runZoned(() {
    Timer.run(() { throw 'Would normally kill the program'; });
  }, onError: (error, stackTrace) {
    print('Uncaught error: $error');
  });

// Future error handling if function returns syncronous error then it's returned as a future 

Future<int> parseAndRead(data) {
  return new Future.sync(() {
    var filename = obtainFileName(data);         // Could throw.
    File file = new File(filename);
    return file.readAsString().then((contents) {
      return parseFileData(contents);            // Could throw.
    });
  });
}

// Url pattern
import 'dart:io';
import 'dart:async';

import 'package:route/server.dart';
import 'package:route/url_pattern.dart';

// Pattern for all posts (plural).
final postsUrl = new UrlPattern(r'/posts/?');

// Pattern for a single post('/post/24', for example).
final postUrl = new UrlPattern(r'/post/(\d+)/?');


// Callback for all posts (plural).
servePosts(req) {
  
  req.response.write("All blog posts");
  req.response.close();
}

// Callback for a single post('/post/24', for example).
servePost(req) {
  var postId = postUrl.parse(req.uri.path)[0];
  req.response.write('Blog post $postId');
  req.response.close();
}

// Callback to handle illegal urls.
serveNotFound(req) {
  req.response.statusCode = HttpStatus.NOT_FOUND;
  req.response.write('Not found');
  req.response.close();
}

void main() {
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    var router = new Router(server)
      // Associate callbacks with URLs.
      ..serve(postsUrl, method: 'GET').listen(servePosts)
      ..serve(postUrl, method: 'GET').listen(servePost)
      ..defaultStream.listen(serveNotFound);
  });
}

// Simplifying types
class Ctype {
  ContentType dart = new ContentType("application", "dart");
  ContentType html = new ContentType("text","html");
  ContentType css  = new ContentType("text","css");
  ContentType json = new ContentType("application","json");
  ContentType icon = new ContentType("image","x-icon");
  ContentType text = new ContentType("text","plain");
}

Ctype ctype = new Ctype();

// usage
res.headers.contentType = ctype.html;

// Server example 1
import 'dart:io';
import 'dart:convert';

/* A simple web server that responds to **ALL** GET requests by returning
 * the contents of data.json file, and responds to ALL **POST** requests
 * by overwriting the contents of the data.json file
 * 
 * Browse to it using http://localhost:8080  
 * 
 * Provides CORS headers, so can be accessed from any other page
 */

final HOST = "127.0.0.1"; // eg: localhost 
final PORT = 8080; 
final DATA_FILE = "web/data/data.json";
final Directory dir = new Directory('web');

void main() {

  HttpServer.bind(HOST, PORT).then((server) {
    server.listen((HttpRequest request) {
      switch (request.method) {
        case "GET": 
          handleGet(request);
          break;
        case "POST": 
          handlePost(request);
          break;
        case "OPTIONS": 
          handleOptions(request);
          break;
        default: defaultHandler(request);
      }
    }, 
    onError: printError);
    
    print("Listening for GET and POST on http://$HOST:$PORT");
  },
  onError: printError);
}


/**
 * Handle GET requests by reading the contents of data.json
 * and returning it to the client
 */
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  print("method ${req.method}: path: ${req.uri.path}");
  addCorsHeaders(res);
  
  String path = req.uri.path;
  
  var file = null; 
  
  switch(path) {
    case "/":
      file = new File("web/home/home.html");
      //file = new File("web/data/data.json");
      break;
      
    case "/htmlFiles":
      List<String> listFiles = findAllFiles(dir);
      String filesString = "";
      
      listFiles.forEach((e) {
          filesString += "<a href='$e'>$e</a><br />";
      });
          
      res.headers.add(HttpHeaders.CONTENT_TYPE, "text/plain");  
      res.write(filesString);
      res.close();
      break;
      
    default:
      file = new File("web/${req.uri.path}"); // use htt VirtualDirectory
  }
    
    
  if (file != null && file.existsSync()) {
    if(path.endsWith(".html")) 
      res.headers.add(HttpHeaders.CONTENT_TYPE, "text/html");
    else if(path.endsWith(".css"))
      res.headers.add(HttpHeaders.CONTENT_TYPE, "text/css");
    else if(path.endsWith(".dart"))
      res.headers.add(HttpHeaders.CONTENT_TYPE, "application/dart");
    else if(path.endsWith(".json"))
      res.headers.add(HttpHeaders.CONTENT_TYPE, "application/json");
    else if(path.endsWith(".ico"))
      res.headers.add(HttpHeaders.CONTENT_TYPE, "image/x-icon");
    
    //file.readAsBytes().asStream().pipe(res); // automatically close output stream
    file.openRead().pipe(res);
  }
  else if(file != null) {
    var err = "Could not find file: ${path}";
    res.write(err);
    res.close();  
  }
  
}

/**
 * Handle POST requests by overwriting the contents of data.json
 * Return the same set of data back to the client.
 */
void handlePost(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  
  addCorsHeaders(res);
  // gets the contentType
  //var ctype = req.headers.contentType.toString();

  
  req.listen((List<int> buffer) {
    var file = new File(DATA_FILE);
    
//    file.writeAsStringSync(txt, mode: WRITE, encoding: UTF8);
    var ioSink =  file.openWrite(mode: WRITE, encoding: UTF8);  // save the data to the file

    ioSink.add(buffer);
    ioSink.close();
    
    //return the same results back to the client
    //res.add(buffer);
    res.write("Succes");
    
    res.close();
  },
  onError: printError);
}

/**
 * Add Cross-site headers to enable accessing this server from pages
 * not served by this server
 * 
 * See: http://www.html5rocks.com/en/tutorials/cors/ 
 * and http://enable-cors.org/server.html
 */
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*, ");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

void handleOptions(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.statusCode = HttpStatus.NO_CONTENT;
  res.close();
}

void defaultHandler(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.statusCode = HttpStatus.NOT_FOUND;
  res.write("Not found: ${req.method}, ${req.uri.path}");
  res.close();
}

void printError(error) => print(error);

List<String> findAllFiles(Directory dir)
{
    List<FileSystemEntity> contents = dir.listSync(recursive: true);
    //RegExp ex = new RegExp(r"\\");

    contents = contents.where((e) { 
      
      // contents will only be html files
      if(e.toString().contains("File:") && e.toString().endsWith(".html'")) {
        return true;
    }
      else {
        return false;
      }      
    }).toList();
    
    return contents.map((e) { 
      e = 
          e.path
            .replaceAll("\\", "/")
            .replaceFirst("web/", "");
            
      return e;
      //print(e);
      
    }).toList();
}
// -- end server example 1





