npm init --y
// npm install --save pkgName
npm install --save-dev typescript
tsc --init

// run
tsc main.ts | node main.js

npm install --save-dev ts-loader
sudo npm install -g ts-loader

// this is where nvm installs packages globally ex: npm install -g express
~/.nvm/versions/node/node_version/lib/node_modules/express
// Installing the module globally will let you run commands from the command line, but you'll have to link the package into your local sphere to require it from within a program:
npm link express

// ex install package
// npm i dev @types/react-dom@16.0.1

// Add types to file
/// <reference path=”../../typings/index.d.ts” />

// Find the .d.ts file for a library by name in the Typings registry.
npm search @types/xxxxx

// global modules on
/usr/lib/node_modules/

// package.json
// "start": "node_modules/.bin/webpack --config webpack.config.js"
npm install --save-dev webpack

// $wbin = ./node_modules/.bin
$wbin/webpack --display-error-details

$wbin/webpack --watch
./node_modules/.bin/webpack --progress --colors --watch
// server better
./node_modules/.bin/webpack-dev-server --progress --colors --watch

sudo npm install webpack-dev-server -g
webpack-dev-server --progress --colors  --output-filename=./src/main/main.js

package.json > "scripts"
	"build": "webpack-dev-server --entry ./src/main/main.ts --output-filename ./dist/bundle.js"
	"buid:prod": "webpack src/main/main.ts dist/bundle.js -p"

//webpack no longer operates in-memory
 write-file-webpack-plugin

// http://localhost:8080/webpack-dev-server
// http://localhost:8080/webpack-dev-server/src/main/index.html

tslint create initial json setting file
tslint --init

google-chrome --remote-debugging-port=9222
google-chrome --remote-deg-port=9222 http://localhost:8080/index.html

tsc *.ts --watch
tsc *.ts --watch --sourceMap true
tsc *.ts --watch --outDir "../dist" --sourceMap true
tsc *.ts --watch --outDir "../dist" --sourceMap false
// tsc ./src/*.ts --watch --sourceMap true

http-server [directory] -p 8080 -a localhost
sudo npm install -g live-server
live-server --port=9000

lite-server | lite-server --baseDir="dist" | lite-server --port=9000

import * as custom from './custom'

install types

// This package contains t definitions for lodash
npm install --save @types/lodash

// We can actually obtain the type definitions for the require command so it becomes TypeScript compatible.
// Install the following type definitions to use the require command:
// This package contains type definitions for Node.js 
npm install --save-dev @types/node

///<----- Expose functions from typeScript
// 1) Output using library option. This will write the exports of the entry file to a namespace variable in global scope of your choosing

myEntryFile.ts

import {Example} from './example'
import {doSomething} from './example2'

export {
  Example,
  doSomething
}
webpack.config.js

output: {
  //... your normal output config her
  library: 'MyExposedNamespace'
}
// This will now be available at window.MyExposedNamespace or MyExposedNamespace
// Expose functions from typeScript -------------->


// debugging extension
// launch chrome
google-chrome --remote-debugging-port=9222
// launch.json attach
        {
            "name": "Attach /dist/index",
            "type": "chrome",
            "request": "attach",
            "port": 9222,
            "url": "http://localhost:8080/dist/index.html",
            "webRoot": "${workspaceFolder}/dist"
        },


// import examples
import * as myLib from './myLib/myLib'
import ApolloClient, { createNetworkInterface } from 'apollo-client'
import gql from 'graphql-tag'

So to check if a variable is defined or not at a global level you normally use typeof:
if (typeof someglobal !== 'undefined') {
  // someglobal is now safe to use
  console.log(someglobal);
}

// --strict enables 
--strictNullChecks
--noImplicitAny
--noImplicitThis
--alwaysStrict

 Always enable --noImplicitAny and --strictNullChecks
 
// enable
--noImplicitThis

// Now TypeScript knows that createCardPicker expects to be called on a Deck object. That means that this is of type Deck now, not any, so --noImplicitThis will not cause any errors.
interface Card {
    suit: string;
    card: number;
}
interface Deck {
    suits: string[];
    cards: number[];
    createCardPicker(this: Deck): () => Card;
}
let deck: Deck = {
    suits: ["hearts", "spades", "clubs", "diamonds"],
    cards: Array(52),
    // NOTE: The function now explicitly specifies that its callee must be of type Deck
    createCardPicker: function(this: Deck) {
        return () => {
            let pickedCard = Math.floor(Math.random() * 52);
            let pickedSuit = Math.floor(pickedCard / 13);

            return {suit: this.suits[pickedSuit], card: pickedCard % 13};
        }
    }
}

let cardPicker = deck.createCardPicker();
let pickedCard = cardPicker();

alert("card: " + pickedCard.card + " of " + pickedCard.suit);

// for in | of
let list = [4, 5, 6];

for (let i in list) {
   console.log(i); // "0", "1", "2",
}

for (let i of list) {
   console.log(i); // "4", "5", "6"
}

// Another distinction is that for..in operates on any object; it serves as a way to inspect properties on this object. for..of on the other hand, is mainly interested in values of iterable objects. Built-in objects like Map and Set implement Symbol.iterator property allowing access to stored values.

let pets = new Set(["Cat", "Dog", "Hamster"]);
pets["species"] = "mammals";

for (let pet in pets) {
   console.log(pet); // "species"
}

for (let pet of pets) {
    console.log(pet); // "Cat", "Dog", "Hamster"
}


// interesting example func programming style
type Shape =
    { kind: "circle", radius: number } |
    { kind: "rectangle", w: number, h: number } |
    { kind: "square", size: number };

function assertNever(obj: never) {
    throw new Error('Unexpected object')
}

function getArea(shape: Shape) {
    switch (shape.kind) {
        case 'circle':
            return Math.PI * shape.radius ** 2;
        case 'rectangle':
            return shape.w * shape.h;
        case 'square':
            return shape.size ** 2;

    }
    assertNever(shape);
}


// start curry example

const filterByGenre = R.curry((genre,album) => {
	return album.genre === genre;
});

// create similar fc wihout duplicate code
const onlyHipHop = filterByGenre('hip-hop');
const onlyIndie = filterByGenre('indie');
const onlyRock = filterByGenre('rock');

const hopHop = albums.filter(onlyHipHop);
//end curry example

//<-- another curry example
// if we have a fc that needs 6 args we can call that fc with one arg
// and every time we call it with another arg it will simply be added to the list of
// args until we reach 6
function addNumber(num1,num2) {
	return num1+num2;
}

const curriedAdd = R.curry(addNumbers);
const add4 = curriedAdd(4);
add4(2); // => 6
add4(7); // => 11

//In the above HTML we are including both JavaScript libraries and the compiled TypeScript file. In the core content area of the HTML file we have a paragraph tag with an id. This tag will be populated with text when we are done. The load method is tied to our TypeScript code.

// Notice that we’re not using import or require commands. We’ve already included the script files, but we need our TypeScript logic to understand what we’ve done.

// By declaring a variable as any we are basically telling TypeScript to ignore what the variable is, but recognize that it is a variable. The name of these variables are important and they must match that of the JavaScript library. Running tsc should succeed in compiling the TypeScript file.

declare var base64: any;
declare var utf8: any;

var load = function() {
    var str = "nicraboy";
    var bytes = utf8.encode(str);
    var encodedStr = base64.encode(bytes);
    document.getElementById("encoded").innerHTML = encodedStr;
}


// A new ! post-fix expression operator may be used to assert that its operand is non-null and non-undefined in contexts where the type checker is unable to conclude that fact. Specifically, the operation x! produces a value of the type of x with null and undefined excluded. Similar to type assertions of the forms x and x as T, the ! non-null assertion operator is simply removed in the emitted JavaScript code.

// In cases where the compiler can’t eliminate null or undefined, you can use the type assertion operator to manually remove them. The syntax is postfix !: identifier! removes null and undefined from the type of identifier:

// The example uses a nested function here because the compiler can’t eliminate nulls inside a nested function (except immediately-invoked function expressions). That’s because it can’t track all calls to the nested function, especially if you return it from the outer function. Without knowing where the function is called, it can’t know what the type of name will be at the time the body executes, so you help the compiler with the post-fix expression operator !.

function fixed(name: string | null): string {
    function postfix(epithet: string) {
        // name will be replaced with Bob in the event of null and compiler won't complain
        return name!.charAt(2) + '.  the ' + epithet; // ok
    }

    name = name || "Bob";
    return postfix("great");
}

fixed(null);

Discriminated Unions
// You can combine singleton types, union types, type guards, and type aliases to build an advanced pattern called discriminated unions, also known as tagged unions or algebraic data types. Discriminated unions are useful in functional programming. Some languages automatically discriminate unions for you; TypeScript instead builds on JavaScript patterns as they exist today. There are three ingredients:

// 1 Types that have a common, singleton type property — the discriminant.
// 2 A type alias that takes the union of those types — the union.
// 3 Type guards on the common property.

interface Square {
    kind: "square";
    size: number;
}
interface Rectangle {
    kind: "rectangle";
    width: number;
    height: number;
}
interface Circle {
    kind: "circle";
    radius: number;
}

// First we declare the interfaces we will union. Each interface has a kind property with a different string literal type. The kind property is called the discriminant or tag. The other properties are specific to each interface. Notice that the interfaces are currently unrelated. Let’s put them into a union:
type Shape = Square | Rectangle | Circle;

// Now let’s use the discriminated union:
// Type guards on the common property.
function area(s: Shape) {
    switch (s.kind) {
        case "square": return s.size * s.size;
        case "rectangle": return s.height * s.width;
        case "circle": return Math.PI * s.radius ** 2;
    }
}

// The never type that the compiler uses to check for exhaustiveness
// Here, assertNever checks that s is of type never — the type that’s left after all other cases have been removed. If you forget a case, then s will have a real type and you will get a type error. This method requires you to define an extra function, but it’s much more obvious when you forget it.
function assertNever(x: never): never {
    throw new Error("Unexpected object: " + x);
}
function area(s: Shape) {
    switch (s.kind) {
        case "square": return s.size * s.size;
        case "rectangle": return s.height * s.width;
        case "circle": return Math.PI * s.radius ** 2;
        default: return assertNever(s); // error here if there are missing cases
    }
}





