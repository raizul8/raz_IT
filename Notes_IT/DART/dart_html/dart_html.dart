// tip: You can make an object and add event handlers to Elements in the constructor

// Example send form data including files from HTML form
// From redstone server file
// Full example: keepProjects/learnExamplesDart/send_form_data
@app.Route('/post1',methods: const [app.POST], allowMultipartRequest: true)
specificPost(@app.Body(app.FORM) Map form) {
  var specificField = form['specificField'];
  var f = form['my_file'];
  print('specificField: $specificField \n file: \n ${f.content}');
}

// You need CORS sometimes OPTIONS is also required
// Some req methods send OPTIONS first to check the availability of the resource
@app.Interceptor(r'/.*')
interceptor1() {
  if (app.request.method == 'OPTIONS') {
    app.response = app.response.change(headers: CORS);
    app.chain.interrupt();
  } else {
    app.chain.next(() {
      return app.response = app.response.change(headers: CORS );
    });
  }
}

Map CORS = {
  "Access-Control-Allow-Origin" : "*, ",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
  "Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept, Content-Disposition"
};

// important HTML snippets to send form data

// from this input element you get the files
InputElement _fileInput;

_fileInput = 
        document.querySelector('#file')
        ..onChange.listen(_onFileInputChange);

// get only one file
 _onFileInputChange(_) {
    file = _fileInput.files[0];
  }

  // Send the whole form
  void sendForm(_) {
    if(file == null) 
      return;
    
    FormData fd = new FormData(_readForm);
    
    HttpRequest req = new HttpRequest();
    req.onReadyStateChange.listen((_) {
     if (req.readyState == HttpRequest.DONE) {
       print('status: ${req.status}');
     }
    });
    req.open("POST", 'http://127.0.0.1:8081/post');
    req.send(fd);
  }

  void sendFileAndField(_) {
    if(file == null) 
      return;
    
    FormData fd = new FormData();
    fd.append('specificField', 'Lalala');
    fd.appendBlob('my_file', file);
    
    HttpRequest req = new HttpRequest();
    req.open("POST",'http://127.0.0.1:8081/post1');
    req.send(fd);
  }
  
}


// create, read file, write to file in browser sandbox FileSystem sandbox
createFile1() async {
  FileSystem fs = await window.requestFileSystem(1024*1024);
  
  fs.root
    .createFile('t3.txt')
    .catchError(handleError);
  
  FileEntry t1_FileEntry = await fs.root.getFile('t3.txt')
                                        .catchError(handleError);

  if (t1_FileEntry is! FileEntry) {
    return 'we have a FileError';
  } 
  
  File t1_file = await t1_FileEntry.file();
  
  FileWriter t1_fileWriter = await t1_FileEntry.createWriter();
  t1_fileWriter.write(new Blob(['This is,\n','my file t3.txt .\n\n'], 'text/plain;charset=UTF-8', 'native'));
  
  FileReader fileRdr = new FileReader();
  fileRdr.readAsText(t1_file);
  
  fileRdr.onLoadEnd.listen((_) {
    print(fileRdr.result.toString());
  });
 
}


// Make file then make a link to it so you can download it.
import 'dart:html';
void main() {
  // Our imaginary dynamically generated data
  List body = [ 'This list is the text\n',
                'which our final output\n',
                'file will contain.\n\n',
                "It's really nothing\n",
                'special in any way.\n',
                'Normally this stuff would\n',
                'be dynamically generated\n',
                'in some way.\n\n'];
  
  // Create a new blob from the data.
  Blob blob = new Blob(body, 'text/plain', 'native');
  // Create a data:url which points to that data.
  String url = Url.createObjectUrlFromBlob(blob);
  // Create a link to navigate to that data and download it.
  AnchorElement link = new AnchorElement()
      ..href = url
      ..download = 'random_file.txt'
      ..text = 'Download Now!';
  
  // Insert the link into the DOM.
  var p = querySelector('#text');
  p.append(link);
}

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  </head>
 
  <body>   
    <p id="text"></p>
    <script type="application/dart" src="test.dart"></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>


// select all links and buttons
void main() {
  for (Element e in querySelectorAll('a, button')) {
    e.onClick.listen((e) => handleClick(e.target));
  }
}

void handleClick(var element) {
  print('[${element.text.trim()}]');
}

// Cast the event target to InputElement
nameInput.onKeyUp.listen((Event e) {
String name = (e.target as InputElement).value;

// Use DocumentFragment to minimize reflows, anything that works with position or size
// This code has the same functionality as the previous but this time, we create DocumentFragment , which is a DOM tree itself but is not placed in the document. We add multiple elements to it and then append its entire content to the <ul> element
  var frag = new DocumentFragment();
  UListElement cont = querySelector('#ul1');

  ['Uno', 'Dos', 'Tres'].forEach((String key) {
    LIElement li = new LIElement();
    li.text = key;
    frag.append(li);
  });

  frag.append(new LIElement()
    ..text = 'li1'
    ..id = 'li1'
    ..style.color = 'red');

  frag.querySelector('#li1')..text = 'Four';

  UlistElement cont = querySelector('#hello-ul');
  cont.children.clear();
  cont.append(frag.clone(true));

// If you change for ex the width of an elem and then acces that elem size like elem.clientWidth you will trigger a reflow
// Change elems multiple times then acces it's size
innerElement.style.width = '100px';
innerElement.style.height = '200px';
print(cont.clientWidth);
print(cont.clientHeight);



// this is an JsObject called callback that is assigned a function( a fc is a JsObject)
js.context['callback'] = (js.JsObject json) {

// call a js fc from dart with apply
js.JsFunction jf = js.context['jf'];
int res = jf.apply([10, 20]);

// test indexed_db support
import 'dart:indexed_db' as idb;
if (!idb.IdbFactory.supported) {
  return;
}

// There used to be some nasty workarounds, but browser vendors decided to remove this delay for
// mobile-friendly (or mobile-optimized) websites. This means that pages that use this header aren't
// affected by tap delay:
<meta name="viewport" content="width=device-width">

















