// DARTSDK = /usr/lib/dart
// DARTPATH = /usr/lib/dart/bin:/home/raz2/.pub-cache/bin
// export PATH=...:$PATH:$DARTPATH
// export DARTPATH = /usr/lib/dart/bin:/home/raz2/.pub-cache/bin

// inside project ex directory structure: bin test web pubspec.yaml
// --web-compiler=<compiler>  Possible values are "dart2js", "dartdevc", and "none" (no generated JavaScript). Default "dart2js"
// no --output the results are put in build folder
pub build --output=webBuild --mode=release web

ln -s file1 link1

// stageHand
console-full - A command-line application sample.
package-simple - A starting point for Dart libraries or applications.
server-shelf - A web server built using the shelf package.
web-angular - A web app with material design components.
web-simple - A web app that uses only core Dart libraries.
web-stagexl - A starting point for 2D animation and games.

> mkdir fancy_project
> cd fancy_project
> stagehand web-simple
> stagehand package-simple

And to list all of the project templates:
> stagehand

// test with content content_shell
// for testing test folder must be in web folder
content_shell --dump-render-tree test_web1.html

<!-- language-all: lang-dart -->

// run Pub Build again; script_inliner processes HTML files and inlines JavaScripts marked as data-pub-inline.
transformers:
- $dart2js:
minify: true
- script_inliner

// Using > /dev/null redirects all stdout to /dev/null (discarding all output), 2>&1 redirects
// stderr to stdout, and finally, & runs the process in the background.
nohup dart bin/server.dart > /dev/null 2>&1 &

// no symlinks
pub get --no-package-symlinks

pub build

// serve in web
pub serve web

// dynamic is a type underlying all Dart objects. You shouldn't need to explicitly use it in most cases. Dynamic turns of static checking in editor, you are responsible to know what you are doing with dynamic. Dynamic

// Type dynamic has methods for every possible identifier and arity, with every possible combination of named parameters. These methods all have dynamic as their return type, and their formal parameters all have type dynamic. Type dynamic has properties for every possible identifier. These properties all have type dynamic.

// var is a keyword, meaning "I don't care to notate what the type is here.", dart editor may infer the type (if option is on) else its dynamic

// before invoking constructor set instance variables 
class B {
  String Name;
  int Age;
  B(this.Name);
  B.Mp(Map p) : Name = p['name'], Age = p['age'] {
    print("$Name $Age");
  }
} 

// Get stacktrace
  try {
    throw ("Lalala");
    
  } catch (e, stack) {
    print(stack);
  }

// https://www.dartlang.org/dart-tips/dart-tips-ep-9.html
// catch specific exception first
try {
  room.openDoor();
  room.enter(person);
} on StateError catch(e) {
  doubleCheckDoor();
} on ArgumentError catch(e) {
  reloadPerson();
} catch(e) {
  print(e);
} finally {
  room.reset();
}  

// throw specific error or exception
throw new RangeError("out of range");

// Operator
as Typecast
is True if the object has the specified type
is! False if the object has the specified type

// Constant constructor
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y);
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

// if building lots of strings use StringBuffer
  var sb = new StringBuffer();
  sb.write('Use a StringBuffer ');
  sb.writeAll(['for ', 'efficient ', 'string ', 'creation ']);
  sb..write('if you are ')..write('building lots of strings.');

  var fullString = sb.toString();
  print(fullString);
// use StringBuffer instead of + concatenation
// use new hotness: StringBuffer, good
buildWithStringBuffer() {
  var sb = new StringBuffer();

  for (var i = 9999; i > 0; i--) {
    sb.write(i.toString());
    sb.write(" beers on the wall\n");
  }

  var finalString = sb.toString();
}

// use old school + for string concatenation, bad
buildWithConcat() {
  var s = '';

  for (var i = 9999; i > 0; i--) {
    s += i.toString();
    s += " beers on the wall\n";
  }

  var finalString = s;
}

// generate a list
  List<String> l1 = new List<String>.generate(10, (int i) => 'lala $i');

// The Iterable.join method uses a StringBuffer internaly:

// match any character including new Line
// Which means ‘don’t match no characters’, a double negative that can re-read as ‘match any character’.
[^]+

// use of RegExp
  var numbers = new RegExp(r'\d+');// numbers
  var words = new RegExp(r'\w+'); // words
  
  String s = "Lankadosa 88 89 jhjh 11 145";
  String s1 = "88";
  
  print(numbers.hasMatch(s));
  
  List<String> l = [];
  for (Match match in numbers.allMatches(s)) {
    print(match.group(0)); // 88, then 89 11 145
    l.add(match.group(0));
  }
  
  l.forEach((e) => print(e));

// RegExp example
  RegExp post = new RegExp(r'/post/(\d+)/?');
  String ps = "http://www.hahahl.com/post/80";
  
  post.allMatches(ps).forEach((match) {
    print(match.group(0));
  });

// RegExp example
  String path = '/dir1/dir2/file.txt/file1.txt';
  RegExp name = new RegExp(r'\w+\.\w+');
  
  name.allMatches(path).forEach((m) {
    print('found: ${m.group(0)}');
  });

  Iterable<Match> it = name.allMatches(path);
  print(it.elementAt(0).group(0));

// ternary operator
  void set maxRating(String value) {
    var count = value == null
        ? DEFAULT_MAX
        : int.parse(value, onError: (_) => DEFAULT_MAX);
    stars = new List.generate(count, (i) => i + 1);
  }
// 
nr % 2 == 0 
  ? p1.text = 'This is Sparta.' 
  : p1.text = "This is Rome";

// use UTF8
import 'dart:convert';
UTF8.decoder

// Ensure the types in list
var l = <int>[];
List l = <int>[];

// ensure the types in map
Map|var m =  <String,Map<A,String>>{};
// or
Map|var stuff = new Map<String, int>();
// or
Map<String,int> m = <String, int>{
  'nr1' : 1,
  'nr2' : 2
};

// Get all the values from Map
  Map<String,List<String>> hawaiianBeaches = {
  'oahu' : ['waikiki', 'kailua', 'waimanalo'],
  'big island' : ['wailea bay', 'pololu beach'],
  'kauai' : ['hanalei', 'poipu']
  };
  
  Iterable<List<String>> x = hawaiianBeaches.values;
  
  x.forEach((List<String> e) { 
    e.forEach((String v) => print("$v")); 
    print("-----");
  });

// NOTE: Do not depend on iteration order.
hawaiianBeaches.forEach((k,v) {
  print('I want to visit $k and swim at $v');
  // I want to visit oahu and swim at [waikiki, kailua, waimanalo], etc.
});

// read only values from map or keys
for (var m in cm.declarations.values)
for (var m in cm.declarations.keys)

// redirect
    var redirectPage = Uri.parse('http://127.0.0.1:8080/home/home.html');

    res.redirect(redirectPage);

// send post to Rest Service
void sendCustomer(String name, int age) {
  String url = "http://localhost:64580/person/customer";
  String jsonData = 'customer={"Name": "$name", "Age": $age}';//F# REST needs customer= because values = List<(string,string)> 

  
  HttpRequest request = new HttpRequest();
  
  request.onReadyStateChange.listen((_) {
    if (request.readyState == HttpRequest.DONE &&
        (request.status == 200 || request.status == 0)) {
      // data saved OK.
      print(request.responseText); // output the response from the server
    }
  });
  
  request.open("POST", url, async: false);  

  request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  try {
    request.send(jsonData);
  } catch (e) {
    print(e);
  }

}

// expando is like a Map<Obj, Obj>
// in this example We have an expando of InfoObj 
class Animal {
  String name;
  Animal(this.name);
}

class Cls {
  String s;
  Cls(this.s);
}

class InfoObj {
  String info;
  InfoObj(this.info);
}

final Expando<InfoObj> infosExp = new Expando<InfoObj>();

void main() {
  List<Animal> animals = 
      [ new Animal("Animal1"),
        new Animal("Animal2"),
        new Animal("Animal3"),
      ];
  
  List<InfoObj> infos = 
      [ new InfoObj("This is Sparta"),
        new InfoObj("This is an information for animals"),
        new InfoObj("Lalalalala info"),
      ];
  
  List<Cls> cls = 
      [ new Cls("Cls1"),
        new Cls("Cls2"),
        new Cls("Cls3"),
       ];
  
  infosExp[animals[0]] = infos[0];
  infosExp[cls[2]] = infos[1];
  
  print(infosExp[animals[0]].info);
  print("This is cls 2 : ${infosExp[cls[2]].info}");
}

// use of typedef
// type for function
// here I say that that sumType are functions that look like (int,int) => int
int sum(int a, int b) {
  return a + b;
}

typedef int sumType(int a, int b);

main() {
  sumType s = sum;

}

  
// expando
typedef CustomFunction(int foo, String bar);

Expando<CustomFunction> domFunctionExpando = new Expando<CustomFunction>();

main(){
   // Assumes dart:html is imported
   final myElement = new DivElement();

   // Use the expando on our DOM element.
   domFunctionExpando[myElement] = someFunc;

   // Now that we've "attached" the function to our object, we can call it like so:
   domFunctionExpando[myElement](42, 'expandos are cool');
}

void someFunc(int foo, String bar){
  print('Hello. $foo $bar');
}

// write to file, if file not exists then make one
// mode is WRITE by default so if exists contents will be deleted
new File('file.txt').writeAsStringSync( "_This is Spartaaaaaaaa", mode: FileMode.APPEND );


// create file and all directories from path if they don't exist
  // Get the system temp directory.
  var systemTempDir = Directory.systemTemp;

  // Creates dir/, dir/subdir/, and dir/subdir/file.txt in the system
  // temp directory.
  new File('${systemTempDir.path}/dir/subdir/file.txt').create(recursive: true)
    // The created file is returned as a Future.
    .then((file) {
      print(file.path);
  });
//--

// Loop over values of stream
// Every time an element is added to the stream, the loop body is run. After each iteration, the function enclosing the loop suspends until the next element is available or the stream is done. Just like await expressions, await-for loops can only appear inside asynchronous functions.
  await for (td.Uint8List l in myRes.openRead()) {
    print(l);
  }

// read file with stream
  final file = new File('file.txt');
  Stream<List<int>> inputStream = file.openRead();

  inputStream
    // Decode to UTF8.
    .transform(UTF8.decoder)
    // Convert stream to individual lines. You can choose not to linesplit.
    .transform(new LineSplitter())
    // Process results.
    .listen((String line) {
        print('$line: ${line.length} bytes');
      },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });

// You can also use the Future.delayed factory to complete a future after a delay. 
//Here is an example of two functions that return a string asynchronously after a delay:

import 'dart:async';

Future sleep1() {
  return new Future.delayed(const Duration(seconds: 1), () => "1");
}

Future sleep2() {
  return new Future.delayed(const Duration(seconds: 2), () => "2");
}

// return Future value
new Future.value(_recipesCache[id]);

// using Futures, completer 
void main() {
  var x = readGasFile();
  x.then((v)  => print(v));
}

Future<JsonObject> readGasFile()
{
  var completer = new Completer();
  JsonObject data;
  Future<String> finishedReading = file.readAsString();
  finishedReading.then((text) { 
    data = new JsonObject.fromJsonString(text);
    print(data);
    //data.forEach((e) => print("Date: ${e.date}  Meters: ${e.cMeters}"));
    completer.complete(data);
  });
  return completer.future;
}

// second use of Future and Complete 

Future<List<Base>> GetItemList(){
  var completer = new Completer();

  aFuture.then((a) {
    // At some time you need to complete the future:
    completer.complete(a);
  });

  return completer.future;
}

// A good use of a Completer.

  Future doStuff() {
    Completer completer = new Completer();
    runDatabaseQuery(sql, (results) {
      completer.complete(results);
    });
    return completer.future;
  }

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

// then returns a future 
Future<List<String>> readCommaSeperatedList(file){
  return file.readAsString().then((text) => text.split(','));
}

// Wait for all futures to complete then use the List of results
Future.wait([f2("a"), f2("b"), f3("c"), f3("d")], eagerError: true)
      .then((List<String> l) {
        l.forEach((e) => print(e));
      })
      .catchError((e) { print("error on main future:\n$e"); });

// List all files and folders from directory
  var systemTempDir = Directory.systemTemp;

  // List directory contents, recursing into sub-directories, but not following
  // symbolic links.
  systemTempDir.list(recursive: true, followLinks: false)
    .listen((FileSystemEntity entity) {
      print(entity.path);
    });


// Reads all files and folders from dir
  var dir = new Directory('.');
  List<FileSystemEntity> contents = dir.listSync();
  
  var textFiles = contents.where((f) => f.path.endsWith('.json'));
  
  for(FileSystemEntity e in contents ) {
    print("${e.path}");
  }

  print("$textFiles");


// uri --------------
Encoding and Decoding URI Components

To encode and decode all of a string’s characters that have special meaning in a URI, including (but not limited to) /, &, and :, use the encodeComponent() and decodeComponent() methods.

main() {
  var uri = 'http://example.org/api?foo=some message';
  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);
}

// Notice how every special character is encoded. For example, / is encoded to %2F.

// Parsing URIs

// If you have a Uri object or a URI string, you can get its parts using Uri fields such 
// as path. To create a Uri from a string, use the parse() static method:

main() {
  var uri = Uri.parse('http://example.org:8080/foo/bar#frag');

  assert(uri.scheme   == 'http');
  assert(uri.host     == 'example.org');
  assert(uri.path     == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin   == 'http://example.org:8080');
}
See the Uri API docs for more URI components that you can get.

Building URIs

You can build up a URI from individual parts using the Uri() constructor:

main() {
  var uri = new Uri(scheme: 'http', host: 'example.org', 
                    path: '/foo/bar', fragment: 'frag');
  assert(uri.toString() == 'http://example.org/foo/bar#frag');
}

// Decode List<int> buffer
    var txt =  UTF8.decoder.convert(buffer);
    var decodedText = (Uri.decodeFull(txt)).split("&");// Decodes the form encoding and splits it
    print(decodedText);

// dart:io get pid
pid

// find folder of script
import 'package:path/path.dart';

// directory of current script
dirname(Platform.script.toFilePath())

// List all files from Directory async
  Directory dir = new Directory("./");

  dir.list(recursive: true, followLinks: false)
    .listen((FileSystemEntity entity) {
      String path = entity.path;
      
      if(path.endsWith('.html')) {
        htmlFiles.add(path.replaceFirst("web/", ""));
      }
    });

  // List all files from Directory syncronous
  dir
    .listSync(recursive: true, followLinks: false)
    .forEach((FileSystemEntity entity) {
      String path = entity.path;
      
      if(path.endsWith('.html')) {
        htmlFiles.add(path.replaceFirst("web/", ""));
      }
    });    

// Server side HttpRequest
// Multiple requests to the same server, keep a persistent connection open to the server
  import 'package:http/http.dart' as http;
  
  String url = 'http://127.0.0.1:8080/';
  String url2 = 'http://127.0.0.1:8080/htmlFiles';
  var client = new http.Client();
  client.get(url)
      .then((response) {
        print(response.body);
        return client.get(url2);
      })
      .then((response) {
        print(response.body);
      })
      .whenComplete(client.close);


// Listing directory contents
// Use the http Pub package, and create a VirtualDirectory to serve the request. Set the VirtualDirectory allowDirectoryListing field to true. Requests to the default directory (‘/’) display the contents of that directory.

library simple_http_server;

import 'dart:io';
import 'package:http_server/http_server.dart' show VirtualDirectory;

final MY_HTTP_ROOT_PATH = Platform.script.resolve('web').toFilePath();

void main() {
  var virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH);
  virDir.allowDirectoryListing = true;

  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    server.listen((request) {
      virDir.serveRequest(request);
    });
  });

/*
"static", "final", and "const" mean entirely distinct things in Dart:

"static" means a member is available on the class itself instead of on instances of the 
class. That's all it means, and it isn't used for anything else. static modifies *members*.

"final" means single-assignment: a final variable or field *must* have an initializer. Once 
assigned a value, a final variable's value cannot be changed. final modifies *variables*.


"const" has a meaning that's a bit more complex and subtle in Dart. const modifies *values*.
You can use it when creating collections, like const [1, 2, 3], and when constructing objects (instead of new) like const Point(2, 3). Here, const means that the object's entire deep state can be determined entirely at compile time and that the object will be frozen and completely immutable.

Const objects have a couple of interesting properties and restrictions:
They must be created from data that can be calculated at compile time. A const object does 
not have access to anything you would need to calculate at runtime. 1 + 2 is a valid const 
expression, but new DateTime.now() is not. 
They are deeply, transitively immutable. If you have a final field containing a collection, that collection can still be mutable. If you have a const collection, everything in it must also be const, recursively. 
They are *canonicalized*. This is sort of like string interning: for any given const value, a single const object will be created and re-used no matter how many times the const expression(s) are evaluated. In other words: 
*/
getConst() => const [1, 2]; 
main() { 
  var a = getConst(); 
  var b = getConst(); 
  print(a === b); // true 
} 

I think Dart does a pretty good job of keeping the semantics and the keywords nicely clear 
and distinct. (There was a time where const was used both for const and final. It was 
  confusing.) The only downside is that when you want to indicate a member that is 
single-assignment and on the class itself, you have to use both keywords: static final.

// get set setter getter
class Car {
  Engine engine;
  
  bool get isEngineRunning => engine.isRunning;
  
  void set isEngineRunning(bool isRunning) {
    engine.isRunning = isRunning;
  }
}

// final const
// Final and Const
// If you never intend to change a variable, use final or const, either instead of var or in 
// addition to a type. A final variable can be set only once; a const variable is a 
// compile-time constant.

// A local, top-level, or class variable that’s declared as final is initialized the first 
// time it’s used:

final name = 'Bob';   // Or: final String name = 'Bob';
// name = 'Alice';    // Uncommenting this results in an error
Note

// Lazy initialization of final variables helps apps start up faster.

// Use const for variables that you want to be compile-time constants. If the const variable is at the class level, mark it static const. (Instance variables can’t be const.) Where you declare the variable, set the value to a compile-time constant such as a literal, a const variable, or the result of an arithmetic operation on constant numbers:

// optional parameters
// Optional parameters can be either positional or named, but not both.

// Both kinds of optional parameter can have default values. The default values 
// must be compile-time constants such as literals. If no default value is provided, the value is null.

--> Optional named parameters

// When calling a function, you can specify named parameters using paramName: value. For example:

enableFlags(bold: true, hidden: false);
When defining a function, use {param1, param2, …} to specify named parameters:

/// Sets the [bold] and [hidden] flags to the values you specify.
enableFlags({bool bold, bool hidden}) {
  // ...
}
Use a colon (:) to specify default values:

/**
 * Sets the [bold] and [hidden] flags to the values you specify,
 * defaulting to false.
 */
enableFlags({bool bold: false, bool hidden: false}) {
  // ...
}

enableFlags(bold: true); // bold will be true; hidden will be false.

// --
//--> Optional positional parameters

Wrapping a set of function parameters in [] marks them as optional positional parameters:

String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
// Here’s an example of calling this function without the optional parameter:

assert(say('Bob', 'Howdy') == 'Bob says Howdy');
And here’s an example of calling this function with the third parameter:

assert(say('Bob', 'Howdy', 'smoke signal') ==
  'Bob says Howdy with a smoke signal');
Use = to specify default values:

String say(String from, String msg, [String device='carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');


// libraries
Implementing Libraries
Use library to name a library, and part to specify additional files in the library.

Note

You don’t have to use library in an app (a file that has a top-level main() function), but 
doing so lets you implement the app in multiple files.

Declaring a library

Use library identifier to specify the name of the current library:

library ballgame;   // Declare that this is a library named ballgame.

import 'dart:html'; // This app uses the HTML library.
// ...Code goes here...
Associating a file with a library

To add an implementation file, put part fileUri in the file that has the library statement, 
where fileUri is the path to the implementation file. Then in the implementation file, put 
part of identifier, where identifier is the name of the library. The following example uses 
part and part of to implement a library in three files.

The first file, ballgame.dart, declares the ballgame library, imports other libraries it 
needs, and specifies that ball.dart and util.dart are parts of this library:

library ballgame;

import 'dart:html';
// ...Other imports go here...

part 'ball.dart';
part 'util.dart';

// ...Code might go here...
The second file, ball.dart, implements part of the ballgame library:

part of ballgame;

// ...Code goes here...
The third file, util.dart, implements the rest of the ballgame library:

part of ballgame;

// ...Code goes here...
Re-exporting libraries

You can combine or repackage libraries by re-exporting part or all of them. For example, you might have a huge library that you implement as a set of smaller libraries. Or you might create a library that provides a subset of methods from another library.

// In french.dart:
library french;
hello() => print('Bonjour!');
goodbye() => print('Au Revoir!');

// In togo.dart:
library togo;
import 'french.dart';
export 'french.dart' show hello;

// In another .dart file:
import 'togo.dart';

void main() {
  hello();   //print bonjour
  goodbye(); //FAIL
}


// Factory constructors
There are a couple of design patterns floating around related to factories. They come into 
play when you need an instance of some class, but you want to be a little more flexible 
than just hard-coding a call to a constructor for some concrete type. Maybe you want to 
return a previously cached instance if you have one, or maybe you want to return an object 
of a different type.

Dart supports that without requiring you to change what it looks like when you create the 
object. Instead, you can define a factory constructor. When you call it, it looks like a 
regular constructor. But the implementation is free to do anything it wants. For example:

class Symbol {
  final String name;
  static Map<String, Symbol> _cache;

  factory Symbol(String name) {
    if (_cache == null) {
      _cache = {};
    }

    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final symbol = new Symbol._internal(name);
      _cache[name] = symbol;
      return symbol;
    }
  }

  Symbol._internal(this.name);
}

// Here we have a class that defines symbols. A symbol is like a string but we guarantee that 
// there will only be one symbol with a given name in existence at any point in time. This 
// lets you safely compare two symbols for equality just by testing that they’re the same 
// object.

// The default (unnamed) constructor here is prefixed with factory. That tells Dart that this 
// is a factory constructor. When it’s invoked, it will not create a new object. (There is 
//   no this inside a factory constructor.) Instead, you are expected to create an instance 
// and explicitly return it. Here, we look for a previously cached symbol with the given name 
// and reuse it if we found it.

// What’s cool is that the caller never sees this. They just do:

var a = new Symbol('something');
var b = new Symbol('something');

assert(identical(a, b)); // true!
// The second call to new will return the previously cached object. This is nice because it 
// means that if we don’t need a factory constructor at first, but later realize we do, we 
// won’t have to change all of our existing code that’s calling new to instead call some 
static method.

// json convert examples
  Map jsn = 
    {
      "name": "Alexia",
      "address": "Krakozia Street Smart nr 19",
      "list": ["one", "two", "three", "four"]
    };
  
  List<String> jsnL = ["Lala", "Kara", "Kana"];
  
  String jsnEnc = JSON.encode(jsnL);
  
  print(jsnEnc);
  
  List<String> jsnDec = JSON.decode(jsnEnc);
  jsnDec.forEach((e) => print(e));


// JSON.decode("String");
  String jsnEnc1 = 
  '''{
    "name": "Laenokus",
    "map": { 
      "one": 1,
      "two": 2,
      "three": 3
    }   
  }''';
  
  Map jsnDecM2 = JSON.decode(jsnEnc1);
  print(jsnDecM2['map']['one']);


// obj to json
import "dart:convert";

class Address {
  String street;
  String city;
  Address(this.street, this.city);
  
  // need toJson for JSON.encode to work
  Map toJson() {
    return { 
      "street": street,
      "city": city
    };
  }
}

void main() {
  var address = new Address('N 34th', 'LA');

  String jsn = JSON.encode(address);// need toJson
  var o = JSON.decode(jsn);
  print(o['street']);// N 34th
}

// use json_object package insted of dart:convert
import 'package:json_object/json_object.dart';

class Address {
  String street;
  String city;
  Address(this.street, this.city);
  
  // need toJson for JSON.encode to work
  Map toJson() {
    return { 
      "street": street,
      "city": city
    };
  }
}

void main() {
  var address = new Address('N 34th', 'LA');
  var o2 = new JsonObject.fromMap(address.toJson());

  print(o2.street);
}

// json example with both packages
import 'package:json_object/json_object.dart';
import 'dart:convert';

class Address {
  String street;
  String city;
  Address(this.street, this.city);
  
  // need toJson for JSON.encode to work
  Map toJsonString() {
    return { 
      "street": street,
      "city": city
    };
  }
}


void main() {
  var address = new Address('N 34th', 'LA');
  
  String addressEncoded = JSON.encode(address.toJsonString());
  print(addressEncoded);
  var addressDecoded = JSON.decode(addressEncoded);
  print(addressDecoded['street']);
  
  // Decode
  var o2 = new JsonObject.fromMap(address.toJsonString());
  print(o2.street);
  var o2encoded = JSON.encode(o2);
  print(o2encoded);
}

//--- JSON.decode, JsonObject and Angular Http
  void _loadData2() {

    HttpRequest.getString('recipes2.json')
      .then((String rcp) {
        List<Recipe> recipes2 = [];
        
        // JSON.decode aproach
        List x = JSON.decode(rcp);
//        Map x = JSON.decode(rcp);
        x.forEach((e) {
          recipes2.add(new Recipe.fromJsonMap(e));
        });
        print(recipes2[0].name);
        
        // JsonObject uses map
        JsonObject o = new JsonObject.fromJsonString(rcp);
        o.forEach((e) {
          recipes2.add(new Recipe.fromJsonMap(e));
        });
        
        print(recipes2[0].name);
        
      })
      .catchError((e) {
        print("$e");
      });

    // Angular Http
    _http.get("categories2.json")
      .then((HttpResponse res) {
        for(String category in res.data) {
          print(category);
        }
      });    
    
    _http.get('recipes.json')
      .then((HttpResponse response) {
        List<Recipe> recipes2 = [];
        print("-----This is response.data2: \n${response.data}");
        for (Map recipe in response.data) {
          recipes2.add(new Recipe.fromJsonMap(recipe));
        }
        print(recipes2);
      })
      .catchError((e) {
        print(e);
      });

// fromJsonMap factory

class gasSnap {
  String date;
  int cMeters;
  int consumed;
  double price;
  
  gasSnap(this.date, this.cMeters, this.consumed, this.price);
  
  factory gasSnap.fromJsonMap(Map json) {
    return new gasSnap(json['date'], json['cMeters'], json['consumed'], json['price']);     
  }
  
  Map toJson() {
    return {
                "date" : date,
                "cMeters" : cMeters,
                "consumed" : consumed,
                "price" : price
    };

  }
  
}
// dson package
 List<GasSnap>snaps1 = dson.deserializeList(jsonList, GasSnap);
 
// Stream subscription access single stream more than once
  List<int> l = [0, 1, 2, 3, 4, 5];
  Stream<int> stream1 = new Stream.fromIterable(l);

  // StreamSubscription from stream1.listen(null)
  StreamSubscription subs1 = stream1.listen(null);
  subs1.onData((int v) {
    print('First value $v');
    subs1.onData((int v) {
      print('second value $v');
      subs1.onData(f2);
    });
  });

// transform stream working example
import 'dart:async';

void main() {
  List<int> data = [0, 1, 2, 3, 4, 5, 6];
  Stream<int> stream1 = new Stream.fromIterable(data);
  Stream<int> broadcastStream = stream1.asBroadcastStream();
  
  broadcastStream
    .transform(new StreamTransformer.fromHandlers(
      handleData: (int value, EventSink<int> sink) {
        sink.add(value+1000);
        sink.add(value+2000);
      }))
    .listen((value) => print("This is Sparta $value"));
  
  
  
  List<String> data2 = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"];
  Stream<String> stream2 = new Stream.fromIterable(data2);
  Stream<String> broadcastStream2 = stream2.asBroadcastStream();
  
  broadcastStream2
    .transform(new StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
        sink.add("Head $value");
        sink.add("Body $value");  // Duplicate the incoming events.
      }))
    .listen((value) => print("listen: $value"));
}

// Mixin example
class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

// Mixin
abstract class Ascendent {
  bool hardToKill = true;
  void shout() {
    print("Ascendent created with Mixin");
  }
}

// mixin keyword with
class Employee extends Person with Ascendent  {
  
  String Department;
  Employee(String name, int age, this.Department) : super(name, age);
}

void main() {
  Employee e = new Employee("Condoriano", 45, "Pirating and destroying");
  print("${e.name} ${e.age} ${e.Department} ${e.hardToKill}");
  e.shout();
}

// Casting cast
  Human h = new Human(2,"Lakatul");
  var h1 = h;
  
  Human h2 = (h1 as Human);

// If you only want to catch some exceptions, but not real errors, you can do:
.catchError((e, st) { exceptionhandling }, test: (e) => e is! Error)

// zones

// catch error from async Time that would normally kill the program
  runZoned(() {
    Timer.run(() { throw 'Would normally kill the program'; });
  }, onError: (error, stackTrace) {
    print('Uncaught error: $error');
  });

// absolute path from relative path
io.Platform.script.resolve('../bin').path
// bin directory
Directory binD = new Directory(Platform.script.resolve('../bin').path);

// print location of dart script
  import 'dart:io' show Platform;

  var uri = Platform.script;
  print(uri); // Prints something like '/Users/shailentuli/workspace/...'.

  // Convert the URI to a path.
  var path = uri.toFilePath();
  print(path); // Prints something like 'file:///Users/shailentuli/workspace/...'.
}

// In order to avoid the use of the mirrors package, make sure that you compile your 
// library with dart2js -DMIRRORS=false

// File
A reference to a file on the file system.

A File instance is an object that holds a path on which operations can be performed. You can get the parent directory of the file using the getter parent, a property inherited from FileSystemEntity.

Create a new File object with a pathname to access the specified file on the file system from your program.

var myFile = new File('file.txt');
The File class contains methods for manipulating files and their contents. Using methods in this class, you can open and close files, read to and write from them, create and delete them, and check for their existence.

When reading or writing a file, you can use streams (with openRead), random access operations (with open), or convenience methods such as readAsString,

Most methods in this class occur in synchronous and asynchronous pairs, for example, readAsString and readAsStringSync. Unless you have a specific reason for using the synchronous version of a method, prefer the asynchronous version to avoid blocking your program.

If path is a link
If path is a symbolic link, rather than a file, then the methods of File operate on the ultimate target of the link, except for delete and deleteSync, which operate on the link.

Read from a file
The following code sample reads the entire contents from a file as a string using the asynchronous readAsString method:

import 'dart:async';
import 'dart:io';

void main() {
  new File('file.txt').readAsString().then((String contents) {
    print(contents);
  });
}
A more flexible and useful way to read a file is with a Stream. Open the file with openRead, which returns a stream that provides the data in the file as chunks of bytes. Listen to the stream for data and process as needed. You can use various transformers in succession to manipulate the data into the required format or to prepare it for output.

You might want to use a stream to read large files, to manipulate the data with tranformers, or for compatibility with another API, such as WebSockets.

import 'dart:io';
import 'dart:convert';
import 'dart:async';

main() {
  final file = new File('file.txt');
  Stream<List<int>> inputStream = file.openRead();

  inputStream
    .transform(UTF8.decoder)       // Decode bytes to UTF8.
    .transform(new LineSplitter()) // Convert stream to individual lines.
    .listen((String line) {        // Process results.
        print('$line: ${line.length} bytes');
      },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });
}
Write to a file
To write a string to a file, use the writeAsString method:

import 'dart:io';

void main() {
  final filename = 'file.txt';
  new File(filename).writeAsString('some content')
    .then((File file) {
      // Do something with the file.
    });
}
You can also write to a file using a Stream. Open the file with openWrite, which returns a stream to which you can write data. Be sure to close the file with the close method.

import 'dart:io';

void main() {
  var file = new File('file.txt');
  var sink = file.openWrite();
  sink.write('FILE ACCESSED ${new DateTime.now()}\n');

  // Close the IOSink to free system resources.
  sink.close();
}
The use of Futures
To avoid unintentional blocking of the program, several methods use a Future to return a value. For example, the length method, which gets the length of a file, returns a Future. Use then to register a callback function, which is called when the value is ready.

import 'dart:io';

main() {
  final file = new File('file.txt');

  file.length().then((len) {
    print(len);
  });
}
// --end File

// find how long it takes for something in your code to finish
// stopwatch
Stopwatch stopwatch = new Stopwatch()..start();
stopwatch.stop();
print(stopwatch.elapsed);

// print own source code
// print the location of running script
import 'dart:io';

  print(Platform.script.toFilePath());
  print(Platform.script.path);

// create directory
  new Directory('dir/subdir').create(recursive: true)
    // The created directory is returned as a Future.
    .then((Directory directory) {
      print(directory.path);
      print("Success !");
  });

// read line from console
print(stdin.readLineSync());

// timer
 new Timer(new Duration(seconds:1), () => print('timer'));

// Start a Future chain imediatly
  new Future((){ })
  .then((_) => checkTime())
  .then((_) => checkTime());


// test testing
// the callback needs to be called 2 times, hence 2 Timers
test('Double callback', () {
  var callback = expectAsync0((){ print("This is a callback"); }, count: 2);
  new Timer(new Duration(milliseconds:100), callback);
  new Timer(new Duration(milliseconds:100), callback);
});

// type annotation example metadata
import "dart:mirrors";

void main() {
  var object = new Class1();
  var classMirror = reflectClass(object.runtimeType);
  // Retrieve 'HelloMetadata' for 'object'
  HelloMetadata hello = getAnnotation(classMirror, HelloMetadata);
  print("'HelloMetadata' for object: $hello");

  // HelloMetadata for object.method
  var methodMirror1 = (reflect(object.method1) as ClosureMirror).function;
  HelloMetadata h = getAnnotation(methodMirror1, HelloMetadata);
  print("'HelloMetadata' for object.method1: $h");
  
  //
  var methodMirror2 = (reflect(object.method2) as ClosureMirror).function;
  var secondMethod = getAnnotations(methodMirror2);
  print("Metadata For method2: ${secondMethod}");
  
  // Retrieve 'Goodbye' for 'object.method'
  var methodMirror = (reflect(object.method1) as ClosureMirror).function;
  Goodbye goodbye = getAnnotation(methodMirror, Goodbye);
  print("'Goodbye' for object.method1: $goodbye");

  // Retrieve all 'Goodbye' for 'object.method'
  List<Goodbye> goodbyes = getAnnotations(methodMirror, Goodbye);
  print("'Goodbye's for object.method1': $goodbyes");

  // Retrieve all metadata for 'object.method'
  List all = getAnnotations(methodMirror);
  print("'All Metadata for method1 of object': $all");
  
  // these last 2 examples are simpler
  // Retrieve exterior metadata from the class
  var class1Mirror = reflectClass(Class1);
  List<InstanceMirror> class1Meta = class1Mirror.metadata;
  print('--> len: ${class1Meta.length} ${class1Meta[0].reflectee.text}');
  
// Retrieve metadata from declarations(inside the class)
  for(var k in class1Mirror.declarations.keys) {
    if(class1Mirror.declarations[k].metadata.length == 0) continue;
    List<InstanceMirror> _m = class1Mirror.declarations[k].metadata;
    _m.forEach((e) => print('-> ${e.reflectee}'));
  }
    
}

Object getAnnotation(DeclarationMirror declaration, Type annotation) {
  for (var instance in declaration.metadata) {
    if (instance.hasReflectee) {
      var reflectee = instance.reflectee;
      if (reflectee.runtimeType == annotation) {
        return reflectee;
      }
    }
  }

  return null;
}

List getAnnotations(DeclarationMirror declaration, [Type annotation]) {
  var result = [];
  for (var instance in declaration.metadata) {
    if (instance.hasReflectee) {
      var reflectee = instance.reflectee;
      if (annotation == null) {
        result.add(reflectee);
      } else if (reflectee.runtimeType == annotation) {
        result.add(reflectee);
      }
    }
  }

  return result;
}

class HelloMetadata {
  final String text;
  const HelloMetadata(this.text);
  String toString() => "Hello '$text'";
}

class Goodbye {
  final String text;
  const Goodbye(this.text);
  String toString() => "Goodbye '$text'";
}

@HelloMetadata("Class1")
class Class1 {
  @HelloMetadata("method1")
  @Goodbye("method_1")
  @Goodbye("Class1")
  void method1() {
  }
  
  @Goodbye('this is nrClass1')
  int nrClass1;
  
  @HelloMetadata("this is method2")
  void method2() { 
  }
  
}


// patch and external
// The patch mechanism is used internally (and is only available internally, not to 
// end users) to provide different implementations of core library functionality.

// For the math library that you have below, the platform independent library source 
// n lib/math declare these methods as 'external'. 'external' methods get their 
// implementation from a patch file. There is a patch file in the VM in 
// runtime/lib/math_patch.dart which supplies the implementation for the 
// VM and there is a patch file in the dart2js compiler in 
// lib/compiler/implementation/lib/math_patch.dart which supplies 
// the dart2js implementation.

// The 'external' keyword is understood by the analyzer and doing it this way allows 
// only the shared part to be in the SDK and be understood by the tools.
 // That means that the SDK can have lib/math instead of have lib/math/runtime and 
 // lib/math/dart2js which makes the SDK cleaner and easier to understand.

// supply arguments to main function
void main(List<String> arguments) {
  String path;
  print(arguments);
}

// What is Syntax ?
Very simply, syntax in programming means a structure to order commands, arguments, 
and everything else that is required to program an application to perform a procedure 
(i.e. a function / collection of instructions).

These structures are based on rules, clearly and explicitly defined, and they are 
to be followed by the programmer to interface with whichever computer application 
(e.g. interpreters, daemons etc.) uses or expects them. If a script 
(i.e. a file containing series of tasks to be performed) is not correctly 
structured (i.e. wrong syntax), the computer program will not be able to parse it. 

Parsing roughly can be understood as going over an input with the end goal of 
understanding what is meant.

// get filename
import 'dart:io';
import 'package:path/path.dart';

main() {
  File file = new File("/dev/dart/work/hello/app.dart");
  String filename = basename(file.path);
}

// get environment variables
import 'dart:io';

void main() {
  Map<String, String> envVars = Platform.environment;
    print(envVars['PATH']);
}

// example completer postgresql
import 'dart:async';
 
import 'package:postgresql/postgresql.dart';
 
void main() {
  var username = "TheRightMan";
  var password = "WithTheRightSecret";
  var DBname = "AtTheRightPlace";  
  var uri = 'postgres://$username:$password@localhost:5432/$DBname';
  
  //Opens a connection.
  connect(uri).then((Connection connection) {
    
    //Insert a new person
    insertPerson(connection, "Thomas", "Pedersen", new DateTime(1990, 01, 1), 1.92).then((_) {
      
      //Print out the table.
      printEntireTable(connection).then((_) {
        connection.close();
      });
    });
  });
}
 
Future insertPerson(Connection connection, 
                    String firstname, String lastname, 
                    DateTime dateOfBirth, double height) {
  Completer _completer = new Completer();
  
  final String query = 
      "INSERT INTO person (firstname, lastname, dateofbirth, height) VALUES" + 
      "('$firstname', '$lastname', '$dateOfBirth', $height);";
  connection.execute(query).then((rowsAffected) {
    print("Rows Affected: $rowsAffected");
    _completer.complete();
  }).catchError((error) => _completer.completeError(error));
  
  return _completer.future;
}
 
Future printEntireTable(Connection connection) {
  Completer _completer = new Completer();
  
  final String query = "SELECT id, firstname, lastname, dateofbirth, height FROM person";
  connection.query(query).toList().then((rows) {
    for(var row in rows) {
      var age = ((new DateTime.now()).difference(row.dateofbirth).inDays/365.2425).floor();
      print("(${row.id}) ${row.firstname} ${row.lastname} - $age years old - ${row.height}m");
    }
    _completer.complete();
  }).catchError((error) => _completer.completeError(error));
  
  return _completer.future;
}

// pipe result 
import 'dart:io';

void main() {
    Process.start('grep', ['main', 'flaf.dart']).then((p1) {
      Process.start('grep', ['void']).then((p2) {
         p1.stdout.pipe(p2.stdin);
         p2.stdout.pipe(stdout);
      });
    });

  Process.start("echo", ['lala']).then((Process p1) {
    Process.start('./enterUserName.sh', []).then((p2) {
      p1.stdout.pipe(p2.stdin);
      p2.stdout.pipe(stdout);
    });
  });
}

// sh script expects 3 user inputs this is how you supply them
  Process.start('./userName.sh', []).then((Process p) {  
    String s = 'RAz user\npasswordSecret\nThis is not sparta\n';
  
    p.stdin
      ..write(s)
      ..close();
      
    p.stdout.pipe(stdout);
  });

// Execute sudo command
  Process.start('/bin/bash', ["-c", "sudo -S ls"]).then((p) {
    p.stdin..write("razvan88\n")..close();
    p.stdout.pipe(stdout);
    p.exitCode.then((exit) => print(exit));
  })
  .then((_) => print("Done"));

// Get the element that you just clicked on
// Then find it's parent
  Element btn = e.target as Element;
  DivElement pDiv = btn.parent;

// interacting with process, run a process, get result from process

  // List all files in the current directory in UNIX-like operating systems.
  Process.run('ls', ['-l']).then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('/home/raizul2/IdeaProjects/hello1/bin/hello1', []).then((ProcessResult results) {
    print(results.stdout);
  });
    
  Process.run('ls', ['-l', '-a']).then((ProcessResult results) {
    print(results.stdout);
  });


// Declare an enumerated type using the enum keyword:

enum Color {
  red,
  green,
  blue
}

// Each value in an enum has an index getter, which returns the zero-based position of the value in the enum declaration. For example, the first value has index 0, and the second value has index 1.

assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);

// To get a list of all of the values in the enum, use the enum’s values constant.

List<Color> colors = Color.values;
assert(colors[2] == Color.blue);

// You can use enums in switch statements. If the e in switch (e) is explicitly typed as an enum, then you’re warned if you don’t handle all of the enum’s values:

enum Color {
  red,
  green,
  blue
}
// ...
Color aColor = Color.blue;
switch (aColor) {
  case Color.red:
    print('Red as roses!');
    break;
  case Color.green:
    print('Green as grass!');
    break;
  default: // Without this, you see a WARNING.
    print(aColor);  // 'Color.blue'
}

// break label out
  out:
  for (var nr in l) {
    if (nr == 4) {
      break out;
    }
    print('nr: ${nr+100}');
  }

// part don’t use part
Library:

library my_lib;

import 'something.dart';

part 'a.dart';

class MyLib {
  //...
}

a.dart:

//part has access to any files that my_lib imports
part of my_lib;

class A {
  //...
}

// Since a.dart is part of my_lib it will have access to any files that my_lib imports.

// async await
Future<String> f1() async => "This is Sparta.";
// not sure if main() should be async
void main() async {
  
  // with await you get returnType String
  // without await you get returnType Future<String>
  print( await f1());
  
}

// isolate isolates example
import 'dart:async';
import 'dart:isolate';

void sendReceive(SendPort port) {
  
  port.send("End of Calculation.");
  
}

void main() {
  var response = new ReceivePort();
  
  Future<Isolate> remote = Isolate.spawn(sendReceive, response.sendPort);
  
  response.listen((r) => print('result is: $r'));
}

// mirrors

class MyClass {
  int i, j;
  int sum() => i + j;
  int f(int nr) => 100 + nr;

  MyClass(this.i, this.j);

  static int noise() => 42;

  static var s;
}

InstanceMirror myCIM = reflect(new MyClass(3,4));
// noise is static method, invoke on type not on InstanceMirror
InstanceMirror sum = myCIM.type.invoke(#noise, []);
print(sum.reflectee);

// dartfmt
dartfmt -w <file or directory>
dartfmt -w cl2_main.dart
// whole directory
dartfmt -w .


// Dart's dartfmt tool is a really neat utility to automatically format your code. Use the dartfmt tool in your workflow to ensure your code complies with the Dart style guide.

// Of course, you don't want to manually run dartfmt. Instead, you want to automate it. Use git's pre-commit hook to ensure your code is formatted, before it is committed.

// Add the following code to your .git/hooks/pre-commit script for your local repo, and make sure the script is executable.

#!/bin/bash

DARTFMT_OUTPUT=`dartfmt -w . | grep Formatted`

if [ -n "$DARTFMT_OUTPUT" ]; then
  echo $DARTFMT_OUTPUT
  echo "Re-attempt commit."
  exit 1
else
  echo "All Dart files formatted correctly. Yay!"
  exit 0

fi

// If your code needs formatting, it will be formatted and written to disk. The commit will fail, so you have a chance to inspect the changes.


// Function within a function
void main() {
  print('This is a cool editor.');

  void f1(int nr) {
    print('This is nr: $nr');
  }

  f1(10);

}


// reduce and fold examples

  String v = l.reduce((a, b) => '$a$b');
  // output:  onetwothreefourfive

  String v1 = l.fold('---', (a, b) => '$a$b' );
  // output: ---onetwothreefourfive


// With echo $?, which is a standard Unix command to return the status code for the previous command,
// we see that it returned 1 because one of the tests failed or threw an error. If all tests passed, the return
// code would be 0 (values 0 and 1 are standard for success and error states, respectively, in Unixbased
// systems).

// The Resource class performs a very special role: allow Dart code to, at runtime, identify and load a resource identified by a package: URI.
// No more fiddling to get the path of the running dart file
  var myResource = new Resource('package:resourcetest/myresource.txt');
  var resourceContents = await myResource.readAsString();
  print(resourceContents);

// --
  Resource myRes = new Resource('package:untitled3/text1.txt');

  var lines = myRes
    .openRead()
    .transform(UTF8.decoder)
    .transform(const LineSplitter());

  await for (var line in lines) {
    print(line);
  }

// print reasonable stack trace errors
 st.Chain.capture(() {...}, onError: (e, chain) {
  print(chain.terse);
 });
