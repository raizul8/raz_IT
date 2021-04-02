import 'package:redstone/server.dart' as app;
import 'package:shelf_static/shelf_static.dart';
//import 'package:shelf/shelf.dart' as shelf;

@app.Route("/home")
home() => ["This is home1!", "This is home2!"];

@app.Route('/user/:id')
getUser(int id) {
  if (id <= 10) return new app.ErrorResponse(404, '<root><node>invalid id</node></root>');
    //return new shelf.Response.internalServerError(body: 'id incorrect');
  return 'user id = $id';
}

// example url
//http://127.0.0.2:8080/query_args?arg1=lala1&arg2=80
@app.Route("/query_args")
queryArgs(@app.QueryParam("arg1") String arg1, 
          @app.QueryParam("arg2") int arg2, 
          [@app.QueryParam() double arg3, 
           @app.QueryParam("arg4") String arg4, 
           @app.QueryParam("arg5") String arg5 = "arg5",
           String arg6, String arg7 = "arg7"]) =>
    {"arg1": arg1, "arg2": arg2, "arg3": arg3, "arg4": arg4, "arg5": arg5, "arg6": arg6, "arg7": arg7};


main() {
  app.setShelfHandler(createStaticHandler("../web", 
                                           defaultDocument: "index.html", 
                                           serveFilesOutsidePath: true));
  app.setupConsoleLog();
  app.start(address: "0.0.0.0", port: 8080);
}

// testing
// you can import '../bin/redstone1.dart'; the main server file if routes are in there or the file where the routes are. You need app.setUp() -> all available routes or app.setUp([#routes1])) -> all routes in lib routes1
main() {

  //load handlers in 'services' library
  setUp(() => app.setUp([#routes1])); 
  // load handlers in current program
  setUp(() => app.setUp());
  //remove all loaded handlers
  tearDown(() => app.tearDown());

  runZoned(() {  
    test('another user', () {
      var req = new MockRequest('/user/raz', session: new MockHttpSession("session_id", values: {"user": "username"}));
      return app.dispatch(req).then((resp) {
        expect(resp.statusCode, HttpStatus.OK);
        expect(resp.mockContent, equals('hello, raz'));
      });
    });
    
  }, onError: (e) => print(e));
  
}

