 // install elm global
sudo npm install -g elm unsafe-perm=true allow-root

// Project (Local) Installation
npm install save-dev elm

// Then, in .vscode/settings.json, add the following:
"elm.makeCommand": "./node_modules/.bin/elm-make"

// This generates elm-package.json file
elm package install

// Let’s create a package.json using npm init command and then install the webpack and other dependencies.
npm init
npm install save elm-webpack-loader webpack webpack-dev-server
// run dev server
./node_modules/.bin/webpack-dev-server


// install package
elm-package install evancz/elm-html

// Reactor also gives us the boilerplate we would otherwise have to create manually – an HTML file that is the context for running the program. To create this file yourself you can utilize elm-make:

$ elm-make Main.elm output index.html

// The file index.html contains the Elm runtime as well as our custom code plus some extra glue code to setup everything. This way you can upload the file to show your parents that you are now able to program in Elm.


// index.js
'use strict';

// var ElmIndex = require("./index.elm");
// var ElmCounter = require("./counter.elm");``

// import ElmCounter from "./counter.elm"
import ElmIndex from "./index.elm"

// var elmAppDiv = document.getElementById('elm-app');
// var elmIndexDiv = document.getElementById('elm-index');

// The third value on embed are the initial values for incomming ports into Elm
ElmCounter.Main.embed(document.querySelector('#elm-app'));
ElmIndex.Main.embed(document.querySelector('#elm-index1'));

// As explained above every function takes only one argument and returns another function or a result. This means you can call a function like add above with only one argument, e.g. add 2 and get a partially applied function back. This resulting function has a signature Int -> Int.


