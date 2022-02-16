// No BS TS #30 - Project setup Jack Herrington, also linking without monorepo

// Fixing TypeScript's Blindspot: Runtime Typechecking 
// you could code defensively with optional chaining for ex or use libraries
// libraries used for this: 
    // zod(might be simpler),
    // Yup,
    // Joy
// When should you use these libraries? When to runtime check ?
//      When you have external data coming in, ex: 
    // file system stuff, 
    // requests from the web, 
    // user generated data, 
    // when you export your ts lib to a js consumer

// cool tools
// remix, prisma(for database)
// cloudinary (for pictures)

// disable type checking one line
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore

// disable type checking for entire file
// @ts-nocheck

// Vue file watcher error solution chokidar reached limit number of watchers ...
rm -rf node_modules
rm package-lock.json
npm cache clear --force
npm install


// on npm -D is --save-dev
// example new project
npm init --y
yarn init -y

npm i -D ts-node typescript eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin
yarn add -D ts-node typescript eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin

npx tsc --init
npx eslint --init

npm i -D jest ts-jest @types/jest
yarn add --dev jest ts-jest @types/jest

/// create __tests_ folder

/// Config file
yarn ts-jest config:init

/// running tests
npx jest 
yarn test 
yarn jest
jest

// ts-node
npm install -g ts-node 
// or locally 
yarn add -D ts-node

// copy prettier.rc file

// add Wallaby select configuration
// Automatic configuration
//</ new project>


// npm install --save pkgName
npm install --save-dev typescript
npm i -D typescript

tsc --init

// run
tsc main.ts | node main.js

npm install --save-dev ts-loader
sudo npm install -g ts-loader

// --save-exact
// When using save=true, npm install will automatically add the package into package.json without the need of using npm install --save every time you run the command. save-exact=true will make sure that no sliding versions (with ~ or ^ ) will be installed.

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

// npm install and unninstall types
// i is for install
// npm i --save-dev @types/ramda
npm uninstall @types/ramda

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

// tasks.json
    "tasks": [
        // run npm script
        {
            "type": "npm",
            "script": "run_hello",
            "options": {
                "shell": {
                    "args": [
                        "-c",
                        "-l"
                    ]
                }
            },
            "group": "build",
            "label": "hello_s"
        },
        // run shell script
        {
            "label": "hello_sss",
            "type": "shell",
            "options": {
                "shell": {
                    "args": [
                        "-c",
                        "-l"
                    ]
                }
            },
            "command": "tsc hello.ts | node hello.js",
            "problemMatcher": []
        }
    ],

http-server [directory] -p 8080 -a localhost
sudo npm install -g live-server
live-server --port=9000

lite-server | lite-server --baseDir="dist" | lite-server --port=9000

import * as custom from './custom'

install types

// This package contains t definitions for lodash
npm install --save @types/lodash

/// We can actually obtain the type definitions for the require command so it becomes TypeScript compatible.
// Install the following type definitions to use the require command:
// This package contains type definitions for Node.js 
npm install --save-dev @types/node


/// Don't use `{}` as a type. `{}` actually means "any non-nullish value".
// - If you want a type meaning "any object", you probably want `Record<string, unknown>` instead.
// - If you want a type meaning "any value", you probably want `unknown` instead.
// - If you want a type meaning "empty object", you probably want `Record<string, never>` instead.

// -------------- When to use for: and which one

// don't use forEach it's not working in async code, and you can't break

// If you create array this for loop is fine, but if you need to acces the members you can accidentally make mistakes

const arrayOfNumbers: number[] = [];
for (let value = 10; value <= 50; value += 10) {
    arrayOfNumbers.push(value);
}

// to access the index
let numbers = [10, 20, 30, 40, 50];

for (const index in numbers) {
    console.log(index);
}

// to access the value
for (const value of numbers) {
    console.log(value);
}




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

// So to check if a variable is defined or not at a global level you normally use typeof:
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

const hipHop = albums.filter(onlyHipHop);
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


// ----------------------------- No BS TS ------------------------------
// Function overload example plus nice way to asign data from string to object
interface Coordinate {
  x: number;
  y: number;
}
function parseCoordinate(str: string): Coordinate;
function parseCoordinate(obj: Coordinate): Coordinate;
function parseCoordinate(x: number, y: number): Coordinate;
function parseCoordinate(arg1: unknown, arg2?: unknown): Coordinate {
  let coord: Coordinate = { x: 0, y: 0 };

  if (typeof arg1 === 'string') {
    (arg1 as string).split(',').forEach((str) => {
      const [key, value] = str.split(':');

      //properties of object are like a map
      // what you say is that the key could be 'x' or 'y' and then asign value
      coord[key as 'x' | 'y'] = parseInt(value, 10);
    });


    // Must remember that the types from Typescript do not exist when the code is transformed to js
    // In js now arg1 is an object not a Coordinate, Then you must cast it to Coordinate
  } else if (typeof arg1 === 'object') {
    coord = {
      ...(arg1 as Coordinate)
    };
  } else {
    coord = {
      x: arg1 as number,
      y: arg2 as number
    };
  }

  return coord;
}

// Dune example
import * as houses from './houses.json';

interface House {
  name: string;
  planets: string | string[];
}

interface HouseWithId extends House {
  id: number;
}

function findHouses(input: string | House[], filter?: (house: House) => boolean): HouseWithId[] {
  if (typeof input === 'string') {
    console.log('it was string');
  } else {
    console.log('it was array');
    const i = input[0];
    console.log(i);
  }

  const houses: House[] = typeof input === 'string' ? JSON.parse(input) : input;

// short way to return
  return (filter ? houses.filter(filter) : houses).map((house) => ({
    id: houses.indexOf(house),
    ...house
  }));
}

const filter = (house: House) => house.name === 'Harkonnen';

console.log(findHouses(houses, filter));


//houses.json
[
    {
        "name": "Atreides",
        "planets": "Calladan"
    },
    {
        "name": "Corrino",
        "planets": ["Kaitan","Salusa Secundus"]
    },
    {
        "name": "Harkonnen",
        "planets": ["Giedi Prime", "Arrakis"]
    }
]

// faster way to create lookup than ... variant
const people = [
  { id: 1, name: 'Jack' },
  { id: 2, name: 'sally' },
  { id: 3, name: 'Joe' }
];

const res = people.reduce((lookup, person) => {
  lookup[person.id] = person;
  return lookup;
}, {});

console.log(res);


// use of reduce
const foods = [
  { name: 'steak', calories: 800, carbs: 10, fat: 30 },
  { name: 'fruit', calories: 200, carbs: 20, fat: 0 },
  { name: 'salad', calories: 100, carbs: 0, fat: 5 },
  { name: 'chips', calories: 300, carbs: 10, fat: 10 },
  { name: 'ice cream', calories: 700, carbs: 20, fat: 20 }
];

const total = foods.reduce(
  (buckets, item) => {
    const calories = item.calories;
    const carbs = item.carbs;
    const fat = item.fat;

    buckets['calories'] += calories;
    buckets['carbs'] += carbs;
    buckets['fat'] += fat;
    return buckets;
  },
  { calories: 0, carbs: 0, fat: 0 }
);

console.log(total);


// check if object has the properties
function getEmail(user:User): string {
    // if user exists get info, if info exists get me email 
    //if that is null then return empty string ??(nullish coalescing operator)
    return user?.info?.email ?? "";
}


function addWithCallback(x:number,y:number, callback?: () => void) {
    console.log(x,y);

    // invoke function or obj method only if it exists
    callback?.();

}


// Tuples
type ThreeDCoordinate = [x: number, y: number, z: number];

function add3DCoordinate(c1: ThreeDCoordinate, c2: ThreeDCoordinate) {
  return [c1[0] + c2[0], c1[1] + c2[1], c1[2] + c2[2]];
}

console.log(add3DCoordinate([1, 1, 1], [10, 100, 30]));

// tuple similar to react use state
// use state returns a state and then a state setter
function simpleStringState(initial: string): [() => string, (v: string) => void] {
  let str: string = initial;

  return [
    () => str,
    (v: string) => {
      str = v;
    }
  ];
}

const [str1Getter, str1Setter] = simpleStringState('hello');
console.log(str1Getter());
str1Setter('goodbye');
console.log(str1Getter());


// Generics
function simpleState<T>(initial: T): [() => T, (v: T) => void] {
  let val: T = initial;
  return [
    () => val,
    (v: T) => {
      val = v;
    },
  ];
}

const [st1getter, st1setter] = simpleState(10);
// if I want a string or null for ex
const [st1getter, st1setter] = simpleState<string | null>(null);

console.log(st1getter());
st1setter("It's a string");
console.log(st1getter());


// Pokemon generic example
// we can make interfaces generic

// We have Rank interface
interface Rank<RankItem> {
  item: RankItem;
  rank: number;
}

function ranker<RankItem>(items: RankItem[], func_ret_rank: (v: RankItem) => number): RankItem[] {
  // ranks(array of Rank) is created from RankItem and fc func_ret_rank
  const ranks: Rank<RankItem>[] = items.map((item) => ({
    item,
    rank: func_ret_rank(item)
  }));

  // ranks are sorted by rank prop
  ranks.sort((a, b) => a.rank - b.rank);

  // A RankItem[] is created from ranks: Rank[], that means it's already sorted
  // then returned
  return ranks.map((rank) => rank.item);
}

interface Pokemon {
  name: string;
  hp: number;
}

const pokemonArray: Pokemon[] = [
  {
    name: 'Bulbasaur',
    hp: 20
  },
  {
    name: 'Megasaur',
    hp: 5
  }
];

// const ranks = ranker(pokemonArray, (pokemon) => pokemon.hp);
const ranks = ranker(pokemonArray, ({ hp }) => hp);
console.log(ranks);


// Generics keyof

// Example 1
// KeyType is one of the properties of DataType wich I supply as string
function pluck<DataType, KeyType extends keyof DataType>(
    items: DataType[],
    key: KeyType
    // I return an array of dogs with only the supplied property as string
): DataType[KeyType][] {
    return items.map((item) => item[key]);
}

const dogs = [
    { name: 'Mimi', age: 12 },
    { name: 'LG', age: 5 }
];

console.log(pluck(dogs, 'age'));
console.log(pluck(dogs, 'name'));


// Example 2
interface BaseEvent {
    time: number;
    user: string;
}

interface EventMap {
    // Create type from BaseEvent + what I quantity and productID
    addToCart: BaseEvent & { quantity: number; productID: string };
    checkout: BaseEvent;
}

// First param is a string that can only by one of the properties of EventMap as string
// The second param is one of EventMap properties, based on the first arg
function sendEvent<Name extends keyof EventMap>(name: Name, data: EventMap[Name]): void {
    console.log([name, data]);
}

// arg1: I give you a string wich is one of the props from EventMap, in this case checkout
// arg2: I give an instance of the prop checkout
sendEvent('checkout', { time: 42, user: 'Zyno' });

// arg1: I give you a string wich is one of the props from EventMap, in this case addToCart
// arg2: I give an instance of the addToCart property
sendEvent('addToCart', { productID: 'SK158', quantity: 40, time: 1320, user: 'The night Owl' });

//********** Utility Types *************
interface MyUser {
    name: string;
    id: number;
    email?: string;
}

type MyUserOptionals = Partial<MyUser>;

const merge = (user: MyUser, overrides: MyUserOptionals): MyUser => ({
    ...user,
    ...overrides
});

// I'm overriding the email
console.log(
    merge(
        {
            name: 'jack',
            id: 548,
            email: 'dontemail@dontemail.com'
        },
        { email: 'overriden@email.com' }
    )
);

type RequiredMyUser = Required<MyUser>;

type JustEmailAndName = Pick<MyUser, 'email' | 'name'>;

type UserWithoutId = Omit<MyUser, 'id'>;

// Record<MyUser['id']  means that when I change the type of MyUser.id it changes here too
// before it was string now it's number
// that means before i had to acces the Record by string now I have to access by number
const mapById = (users: MyUser[]): Record<MyUser['id'], UserWithoutId> => {
    // vs
    // const mapById = (users: MyUser[]): Record<string, UserWithoutId> => {

    return users.reduce((a, v) => {
        const { id, ...other } = v;
        return {
            ...a,
            [id]: other
        };
    }, {});
};

const res = mapById([
    { id: 1, name: 'Mr Foo' },
    { id: 2, name: 'Mr Baz' }
]);

// Access record by number not string, because we changed id to number from string
console.log('res: ', res[1]);


//---------------------------------
// How to use reduce to replace common array funtions

// for each with reduce
function myForEach<T>(items: T[], forEachFunc: (v: T) => void): void {
    items.reduce((a, v) => {
        forEachFunc(v);
        return undefined;
    }, undefined);
}

myForEach(['a', 'b', 'c'], (v) => console.log(`forEach ${v}`));

// filter with reduce
function myFilter<T>(items: T[], filterFunc: (v: T) => boolean): T[] {
    return items.reduce((a: T[], v) => (filterFunc(v) ? [...a, v] : a), []);
}

console.log(myFilter([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (v) => v % 2 === 0));

// map with reduce
// for ex mapFunc takes a string array but returns a number array or viceversa, or with other types
function myMap<T, K>(items: T[], mapFunc: (v: T) => K): K[] {
    return items.reduce((a, v) => [...a, mapFunc(v)], [] as K[]);
}

// apply * 10 to each item and make them a string
console.log(myMap([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (v) => (v * 10).toString()));


// -------------------- Readonly And Immutability in Typescript
interface Cat {
    name: string;
    breed: string;
}

function makeCat(name: string, breed: string): Readonly<Cat> {
    return {
        name,
        breed
    };
}

const usul = makeCat('ususl', 'Tabby');
// usul.name = "Piter" doesn't work

// tuple must be readonly to have inner immutability
function makeCoordinate(x: number, y: number, z: number): readonly [number, number, number] {
    return [x, y, z];
}

const c1 = makeCoordinate(10, 20, 30);
// c1[0] = 50; not working return type is readonly tuple

// In order to make array const you must say as const
const consArray = [1, 2, 3] as const;
// consArray[0] = 50;


------------------- Enums and Literal Types in Typescript

// we asign string so when we debug and print we don't get 0,1,2 we get the string
enum LoadingState {
    beforeLoad = 'beforeLoad',
    loading = 'loading',
    loaded = 'loaded'
}

const isLoading = (state: LoadingState) => state === LoadingState.loading;

console.log(isLoading(LoadingState.beforeLoad));

// An example on how we would use the values of Loading state
const englishLoadingState = {
    [LoadingState.beforeLoad]: 'Before Load',
    [LoadingState.loading]: "It's loading"
};

console.log(englishLoadingState);

// Example of literal types
function rollDice(dice: 1 | 2 | 3): number {
    let pip = 0;
    for (let i = 0; i < dice; i++) {
        pip += Math.floor(Math.random() * 5) + 1;
    }
    return pip;
}

console.log(rollDice(3));

function sendEvent(name: 'addToCart' | 'add_to_small_cart', data: { productId: number }): void;
function sendEvent(name: 'checkout', data: { cartCount: number }): void;
function sendEvent(name: string, data: unknown): void {
    console.log(`name: ${name}: data: ${JSON.stringify(data)}`);
}

sendEvent('add_to_small_cart', { productId: 40 });
sendEvent('checkout', { cartCount: 3 });
sendEvent('addToCart', { productId: 22 });


// --------------Typescript Classes; Member Visibility and Implements
interface Database {
    get(id: string): string;
    set(id: string, value: string): void;
}

class InMemoryDatabase implements Database {
    protected db: Record<string, string> = {};

    get(id: string): string {
        return this.db[id];
    }

    set(id: string, value: string): void {
        this.db[id] = value;
    }
}

interface Persistable {
    saveToString(): string;
    restoreFromString(storedState: string): void;
}

class PersistentMemoryDB extends InMemoryDatabase implements Persistable {
    saveToString(): string {
        return JSON.stringify(this.db);
    }
    restoreFromString(storedState: string): void {
        this.db = JSON.parse(storedState);
    }
}

const myDb = new PersistentMemoryDB();
myDb.set('foo', 'bar');
console.log('db1-foo', myDb.get('foo'));

const saved = myDb.saveToString();
myDb.set('foo', 'db1-bar');
console.log('db1-foo', myDb.get('foo'));

const myDb2 = new PersistentMemoryDB();
myDb2.restoreFromString(saved);
console.log('db2-foo', myDb2.get('foo'));


// -----------------------   Generics in Typescript Classes
interface Database<T, K> {
    get(id: K): T;
    set(id: K, value: T): void;
}

type DBKeyType = string | number | symbol;

class InMemoryDatabase<T, K extends DBKeyType> implements Database<T, K> {
    protected db: Record<K, T> = {} as Record<K, T>;

    get(id: K): T {
        return this.db[id];
    }

    set(id: K, value: T): void {
        this.db[id] = value;
    }
}

interface Persistable {
    saveToString(): string;
    restoreFromString(storedState: string): void;
}

class PersistentMemoryDB<T, K extends DBKeyType>
    extends InMemoryDatabase<T, K>
    implements Persistable
{
    saveToString(): string {
        return JSON.stringify(this.db);
    }
    restoreFromString(storedState: string): void {
        this.db = JSON.parse(storedState);
    }
}

const myDb = new PersistentMemoryDB<number, string>();
myDb.set('foo', 44);
console.log('db1-foo', myDb.get('foo'));

const saved = myDb.saveToString();
myDb.set('foo', 99);
console.log('db1-foo', myDb.get('foo'));

const myDb2 = new PersistentMemoryDB<number, string>();
myDb2.restoreFromString(saved);
console.log('db2-foo', myDb2.get('foo'));

// -------------------  Mapped Types -------
// For a better understanding look at the site documentation

// When you don’t want to repeat yourself, sometimes a type needs to be based on another type.

// Mapped types build on the syntax for index signatures, which are used to declare the types of properties which have not been declared ahead of time:

type MyFlexibleDogInfo = {
    name: string;
    // This means we can create as many props as we want if we supply the right types
    [key: string]: string | number;
};

const dog: MyFlexibleDogInfo = {
    name: 'Lg',
    breed: 'Mutt',
    age: 22
};

interface DogInfo {
    name: string;
    age: number;
}

type OptionssFlags<Type> = {
    [Property in keyof Type]: boolean;
};

// Create a type with every property as boolean
type DogInfoOptions = OptionssFlags<DogInfo>;

//----- second example ---------
// Create new type based on existing type
// change the name of the properties
type Listeners<Type> = {
    // Here the new type of property is a function with the name on + Original name + Change
    [Property in keyof Type as `on${Capitalize<string & Property>}Change`]: (
        newValue: Type[Property]
    ) => void;
} & {
    // Here the property is optional
    [Property in keyof Type as `on${Capitalize<string & Property>}Delete`]?: () => void;
};

function listenToObject<T>(obj: T, listeners: Listeners<T>): void {
    throw 'not impl';
}

const lg: DogInfo = { name: 'LG', age: 13 };

type DogInfoListeners = Listeners<DogInfo>;

// The new type, with the new props, you have autocomplete
listenToObject(lg, {
    onNameChange: (v: string) => {
        console.log('name changed ' + v);
    },
    onAgeChange: (v: number) => {
        console.log('age changed' + v);
    }
});


//-------------- Readonly and Static in Typescript Classes

// this way I don't have to asign the values in the constructor to the properties
// no more
// public name:string;
// and in constructor
// this.name = name etc

class Doggy1 {
    constructor(
        public name: string,
        public age: number,
        public id: number,
        public serialCode: string
    ) {}
}

// You make props readonly so they can't be changed
class Doggy {
    constructor(public readonly name: string, public readonly age: number) {}
}

const lgg = new Doggy('LG', 23);
// lgg.name = "jjj"; not allowed because it's readonly

console.log(lgg.name);

// Singleton

class DogList {
    private doggies: Doggy[] = [];

    // static means we have only one instance
    static instance: DogList = new DogList();

    // IN order to not allow new Doglist we make the constructor private
    private constructor() {}

    static addDog(dog: Doggy) {
        DogList.instance.doggies.push(dog);
    }

    getDogs() {
        return this.doggies;
    }
}

DogList.addDog(lgg);

console.log(DogList.instance.getDogs());


// ------------------ Conditional Types in Typescript
// to run this example use
// node --loader ts-node/esm src/example1.ts
// make sure package.json has "type": "module",

// I think the reason why I need to do all this stuff is because of the new typescript version
// maybe try an older version
// .then(cb as (arg: unknown) => unknown); this is supposed to be just .then(cb)

import fetch from 'node-fetch';

interface PokemonResults {
    count: number;
    next?: string;
    previous?: string;
    results: {
        name: string;
        url: string;
    }[];
}

// what I say is that if T is undefined then T is Promise<PokemonResults> else is void
type FetchPokemonResult<T> = T extends undefined ? Promise<PokemonResults> : void;

function fetchPokemon<T extends undefined | ((data: PokemonResults) => void)>(
    url: string,
    cb?: T
): FetchPokemonResult<T> {
    if (cb) {
        fetch(url)
            .then((resp) => resp.json())
            .then(cb as (arg: unknown) => unknown);
        return undefined as FetchPokemonResult<T>;
    } else {
        return fetch(url).then((resp) => resp.json()) as FetchPokemonResult<T>;
    }
}

fetchPokemon('https://pokeapi.co/api/v2/pokemon?limit=10', (data) => {
    data.results.forEach((pokemon) => console.log(pokemon.name));
});



// async version with function overloading
import fetch from 'node-fetch';

interface PokemonResults {
    count: number;
    next?: string;
    previous?: string;
    results: {
        name: string;
        url: string;
    }[];
}

function fetchPokemon(url: string, cb: (data: PokemonResults) => void): void;
function fetchPokemon(url: string): Promise<PokemonResults>;
function fetchPokemon(url: string, cb?: (data: PokemonResults) => void): unknown {
    if (cb) {
        fetch(url)
            .then((resp) => resp.json())
            .then(cb as (arg: unknown) => unknown);
        return undefined;
    } else {
        return fetch(url).then((resp) => resp.json());
    }
}

// sync
fetchPokemon('https://pokeapi.co/api/v2/pokemon?limit=10', (data) => {
    data.results.forEach((pokemon) => console.log(pokemon.name));
});

// async
(async function () {
    const data = await fetchPokemon('https://pokeapi.co/api/v2/pokemon?limit=10');
    data.results.forEach((pokemon) => console.log(pokemon.name));
})();



// No BS TS #19 - Utility Types in Typescript - Part 2
type Name = {
    first: string;
    last: string;
};

function addFullName(name: Name): Name & {
    fullName: string;
} {
    return { ...name, fullName: `${name.first} ${name.last}` };
}

//                             this means match any function
function permuteRows<T extends (...args: any[]) => any>(
    iteratorFunc: T,
    // Parameters creates a tuple from the types used in the params of function type
    // so we extract the type from the tuple and we want and array of that type
    data: Parameters<T>[0][]
): ReturnType<T>[] {
    return data.map(iteratorFunc);
}

console.log(
    permuteRows(addFullName, [
        { first: 'jack', last: 'Herrington' },
        { first: 'jjj', last: 'rrrr' }
    ])
);

// Object version
class PersonWithFullName {
    constructor(public name: Name) {}
    get fullName() {
        return `${this.name.first} ${this.name.last}`;
    }
}

function createObjects<T extends new (...args: any[]) => any>(
    ObjectType: T,
    data: ConstructorParameters<T>[0][]
): InstanceType<T>[] {
    return data.map((item) => new ObjectType(item));
}

console.log(
    createObjects(PersonWithFullName, [
        { first: 'LG', last: 'Herrington' },
        { first: 'One', last: 'Unouno' }
    ]).map((obj) => obj.fullName)
);

// ---------------------------------  Event processor  -----------------------------------
// No BS TS - Challenge 3
// event processing engine using generics and mapped types.

// My take on event processor basic

type FilterFunction<T> = (data: T[keyof T]) => boolean;
type Filters<T> = Record<keyof T, FilterFunction<T>[]>;

type MapFunction<T> = (data: T[keyof T]) => T[keyof T];
type Maps<T> = Record<keyof T, MapFunction<T>[]>;

type ProcessedEvent<T> = {
    eventName: keyof T;
    data: T[keyof T];
};

class EventProcessor<T extends Record<string | symbol, unknown>> {
    //                            cast empty obj to Filters<T> to satisfy ts
    private filters: Filters<T> = <Filters<T>>{};
    private maps: Maps<T> = <Maps<T>>{};
    private processed: ProcessedEvent<T>[] = [];

    handleEvent<K extends keyof T>(eventName: K, data: T[K]): void {
        let allowEvent = true;
        for (const filter of this.filters[eventName] ?? []) {
            // if filter applied to data is not true
            if (!filter(data)) {
                allowEvent = false;
                break;
            }
        }
        if (allowEvent) {
            let mappedData = { data };
            let d;
            for (const map of this.maps[eventName] ?? []) {
                // if the ev is allowed apply map to data
                d = map(mappedData['data']);
            }
            // store the mapped data in processed along with event name
            this.processed.push({ eventName, data: <T[K]>d });
        }
    }

    addFilter<K extends keyof T>(eventName: K, filter: (data: T[K]) => boolean): void {
        // if there is no event make empty array
        this.filters[eventName] ||= [];
        this.filters[eventName].push(<FilterFunction<T>>filter);
    }

    addMap<K extends keyof T>(eventName: K, map: (data: T[K]) => T[K]): void {
        //  Logical OR assignment (||=). The logical OR assignment ( x ||= y )
        // operator only assigns if x is falsy.
        this.maps[eventName] ||= [];
        this.maps[eventName].push(<MapFunction<T>>(<unknown>map));
    }

    getProcessedEvents() {
        return this.processed;
    }
}

interface EventMap {
    login: { user?: string; name?: string; hasSession?: boolean };
    logout: { user?: string };
}

type Login = { user?: string; name?: string; hasSession?: boolean };
type Logout = { user?: string };
type EventMapp = Record<keyof EventMap, Login | Logout>;

class UserEventProcessor extends EventProcessor<EventMapp> {}

const uep = new UserEventProcessor();

uep.addFilter('login', (v: Login) => {
    if (!v.user) {
        console.log('no user specified for', v.name);
    }
    return Boolean(v.user);
});
uep.addFilter('login', (v: Login) => {
    if (!v.name) {
        console.log('no name specified for user', v.user);
    }
    return Boolean(v.name);
});

uep.addMap('login', (data: Login) => ({
    ...data,
    hasSession: Boolean(data.user && data.name)
}));

uep.handleEvent('login', {
    user: 'lack',
    name: undefined
});
uep.handleEvent('login', {
    user: undefined,
    name: 'Jack'
});
uep.handleEvent('login', {
    user: 'tom',
    name: 'tomas'
});
uep.handleEvent('logout', {
    user: 'tom'
});
uep.handleEvent('login', {
    user: 'rico',
    name: 'Johny Rico'
});
uep.handleEvent('logout', {
    user: 'rico'
});

console.log(uep.getProcessedEvents());


// ----------------- Event processor basic ------------------------------

type FilterFunction<T> = (data: T[keyof T]) => boolean;
type Filters<T> = Record<keyof T, FilterFunction<T>[]>;

type MapFunction<T> = (data: T[keyof T]) => T[keyof T];
type Maps<T> = Record<keyof T, MapFunction<T>[]>;

type ProcessedEvent<T> = {
    eventName: keyof T;
    data: T[keyof T];
};

class EventProcessor<T extends {}> {
    //                            cast empty obj to Filters<T> to satisfy ts
    private filters: Filters<T> = <Filters<T>>{};
    private maps: Maps<T> = <Maps<T>>{};
    private processed: ProcessedEvent<T>[] = [];

    handleEvent<K extends keyof T>(eventName: K, data: T[K]): void {
        let allowEvent = true;
        for (const filter of this.filters[eventName] ?? []) {
            // if filter applied to data is not true
            if (!filter(data)) {
                allowEvent = false;
                break;
            }
        }
        if (allowEvent) {
            let mappedData = { ...data };
            for (const map of this.maps[eventName] ?? []) {
                // if the ev is allowed apply map to data
                mappedData = <T[K]>map(mappedData);
            }
            // store the mapped data in processed along with event name
            this.processed.push({ eventName, data: mappedData });
        }
    }

    addFilter<K extends keyof T>(eventName: K, filter: (data: T[K]) => boolean): void {
        // if there is no event make empty array
        this.filters[eventName] ||= [];
        this.filters[eventName].push(<FilterFunction<T>>filter);
    }

    addMap<K extends keyof T>(eventName: K, map: (data: T[K]) => T[K]): void {
        //  Logical OR assignment (||=). The logical OR assignment ( x ||= y )
        // operator only assigns if x is falsy.
        this.maps[eventName] ||= [];
        this.maps[eventName].push(<MapFunction<T>>(<unknown>map));
    }

    getProcessedEvents() {
        return this.processed;
    }
}

interface EventMap {
    login: { user?: string; name?: string; hasSession?: boolean };
    logout: { user?: string };
}

class UserEventProcessor extends EventProcessor<EventMap> {}

const uep = new UserEventProcessor();

uep.addFilter('login', ({ user }) => Boolean(user));
uep.addFilter('login', ({ user, name }) => {
    if (!name) {
        console.log('no name specified for user', user);
    }
    return Boolean(name);
});

uep.addMap('login', (data) => ({
    ...data,
    hasSession: Boolean(data.user && data.name)
}));

uep.handleEvent('login', {
    user: 'lackk',
    name: undefined
});
uep.handleEvent('login', {
    user: undefined,
    name: 'jack'
});
uep.handleEvent('login', {
    user: 'tom',
    name: 'tomas'
});
uep.handleEvent('logout', {
    user: 'tom'
});
uep.handleEvent('login', {
    user: 'rico',
    name: 'Johny Rico'
});
uep.handleEvent('logout', {
    user: 'rico'
});

console.log(uep.getProcessedEvents());


//---------------------------- Event processor advanced -------------------
// Event processor advanced,
// requires "noImplicitAny": false, or else you need to manualy disable it for a few rows

type Handler<T> = {
    [Prop in keyof T as `map${Capitalize<string & Prop>}`]?: (data: T[Prop]) => T[Prop];
} & {
    [Prop in keyof T as `filter${Capitalize<string & Prop>}`]?: (data: T[Prop]) => boolean;
};

type ProcessedEvent<T> = {
    eventName: keyof T;
    data: T[keyof T];
};

class EventProcessor<T extends {}> {
    //                            cast empty obj to Filters<T> to satisfy ts
    private processed: ProcessedEvent<T>[] = [];
    private handlers: Handler<T>[] = [];

    handleEvent<K extends keyof T>(eventName: K, data: T[K]): void {
        let allowEvent = true;
        // eventName is capitalized, so we need a function for that
        const capitalize = (s) => `${s.charAt(0).toUpperCase()}${s.slice(1)}`;
        for (const handler of this.handlers) {
            const filterFunc = handler[`on${capitalize(eventName)}`];

            // if filter applied to data is not true
            if (filterFunc && !filterFunc(data)) {
                allowEvent = false;
                break;
            }
        }
        if (allowEvent) {
            let mappedData = { ...data };
            for (const handler of this.handlers) {
                const mapFunc = handler[`map${capitalize(eventName)}`];
                if (mapFunc) {
                    mappedData = <T[K]>mapFunc(mappedData);
                }
            }
            // store the mapped data in processed along with event name
            this.processed.push({ eventName, data: mappedData });
        }
    }

    addHandler(handler: Handler<T>): void {
        this.handlers.push(handler);
    }

    getProcessedEvents() {
        return this.processed;
    }
}

interface EventMap {
    login: { user?: string; name?: string; hasSession?: boolean };
    logout: { user?: string };
}

class UserEventProcessor extends EventProcessor<EventMap> {}

const uep = new UserEventProcessor();

uep.addHandler({
    filterLogin: ({ user }) => Boolean(user),
    mapLogin: (data) => ({
        ...data,
        hasSession: Boolean(data.user && data.name)
    })
});

uep.handleEvent('login', {
    user: 'lackk',
    name: undefined
});
uep.handleEvent('login', {
    user: undefined,
    name: 'jack'
});
uep.handleEvent('login', {
    user: 'tom',
    name: 'tomas'
});
uep.handleEvent('logout', {
    user: 'tom'
});
uep.handleEvent('login', {
    user: 'rico',
    name: 'Johny Rico'
});
uep.handleEvent('logout', {
    user: 'rico'
});

console.log(uep.getProcessedEvents());

//  Non abstract constructo type
abstract class Base {
  abstract getName(): string;

  printName() {
    console.log("Hello, " + this.getName());
  }
}

class Derived extends Base {
  getName() {
    return "world !";
  }
}

// What I'm saying is this function expects a concrete type that extends Base
function greet(ctor: new () => Base) {
  const instance = new ctor();
  instance.printName();
}

greet(Derived);
// greet(Base); Argument of type 'typeof Base' is not assignable to parameter of type 'new () => Base'.
  // Cannot assign an abstract constructor type to a non-abstract constructor type. 






























