
// error and log crates, there is crate with low cost abstraction for rust smart pointers and stuff
// learn clippy tool that tells you what you shouldn't do
// wireframe tool for web development

// Vim
// Ctrl + o when insert mode to use a command like easy motion

// Delete inside quotes
// di"
// Delete all including the quotes
// da"


//  google actually did some really cool
// research on this a while back where they
// talked to all their teams and did lots
// of surveys
// and what they found out was that happy
// and productive teams share two common
// traits and the first is autonomy they
// have a lot of individual control about
// what they're working on and the second
// is that both they and external parties
// value what they're doing so they find a
// lot of value in what they're doing so if
// you don't have autonomy and you don't
// have that sense of value it's easy to
// get
// burnt out in a situation like that so
// whatever you can do in conjunction with
// your company and your manager to get the
// whole team
// into that autonomous and valued state
// the better off it's going to be
// but if none of that works honestly it's
// a great hiring environment out there
// super hot right now so if it's not if it
// for you and if it if you're burning out
// at work and you know that there's just
// really no way out of it at this
// particular work then there's probably
// another good job out there for you 

rocket = {git = "https://github.com/SergioBenitez/Rocket", tag="v0.5.0-rc.1"}

// fix code for edition
cargo fix --edition
// then modify edition field
edition = "2021"
// then cargo build or test to check your code works

// As of Rust 1.41.0, you can use the following command to update crates to their latest version:
cargo install <crate>

// update rust and cargo
// cargo update uses Toml file
rustup update && cargo update
rustup default nightly

cargo new hello_cargo --bin


rustup uninstall stable
rustup install stable

// where cargo downloads crates
/home/raz/.cargo/registry/src

// executable in target/debug
cargo build
cargo run

// have folder bin in src folder, if you have rust files with main you execute them like this
cargo run --bin vector_operations // vector_operations is vector_operations.rs

// or have this in Cargo.toml
// you execute it like this 
// cargo run --bin tst1
[[bin]]
name ="tst1"
path = "src/tst1.rs"

// to use cargo run with backtrace
export RUST_BACKTRACE=1

// executable in target/release
cargo build --release

// linking with cc failed do this
sudo apt-get install build-essential

// install dependencies
cargo install --path .

// path dependencies if your crates are not published to crates.io
[dependencies]
hello_macro = { path = "../hello_macro" }
hello_macro_derive = { path = "../hello_macro/hello_macro_derive" }


// update or install cargo web
cargo install --force cargo-web

// documentation, cargo creates documentation for your project and shows it in browser
 cargo doc --open

rustup show

 stable-x86_64-unknown-linux-gnu updated - rustc 1.45.0 (5c1f21c3b 2020-07-13) (from rustc 1.41.0 (5e1a79984 2020-01-27))
  nightly-x86_64-unknown-linux-gnu updated - rustc 1.46.0-nightly (346aec9b0 2020-07-11) (from rustc 1.43.0-nightly (5e7af4669 2020-02-16))


// check nightly version
rustup run nightly rustc --version

rustup install nightly
rustup install stable

// specific version
rustup install 1.30.0
rustup install nightly-2018-08-01

// To update all of the various channels you may have installed:
rustup update

rustup default nightly
rustup default stable-x86_64-unknown-linux-gnu

// If you prefer, once we setup a project directory in the following section, you can use per-directory overrides to use the nightly version only for your Rocket project by running the following command in the directory:
// rustup override set nightly

// install older version rust
rustup toolchain install 1.18.0

// Directory overrides
// rustup override set 1.0.0

// Directories can be assigned their own Rust toolchain with rustup override. When a directory has an override then any time rustc or cargo is run inside that directory, or one of its child directories, the override toolchain will be invoked.

// To use to a specific nightly for a directory:
// rustup override set nightly-2014-12-18

// statements don’t evaluate to a value, which is expressed by (), the empty tuple

// In Rust, where we have the concept of ownership and borrowing, an additional difference between references and smart pointers is that references are pointers that only borrow data; in contrast, in many cases, smart pointers own the data they point to.


//********
// Use BtreeSet, BtreeMap over hashmaps

// Add an allow attribute on a struct, module, function, etc.:
#[allow(dead_code)]
struct SemanticDirection;

// Add a crate-level allow attribute; notice the !:
#![allow(dead_code)]
#![allow(unused_imports)]
#![allow(dead_code, unused_variables)]

// wont compile if you have missing docs
#![deny(missing_docs)]
// warn self explanatory
#![warn(missing_docs)]

// Rust supports mardown in comments with ///

// rust can test code in docs, wrap your code in three backticks ``` then cargo test

// Pass it to rustc:
rustc -A dead_code main.rs

// Pass it using cargo via the RUSTFLAGS environment variable:
RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo build

// cargo subcommand extracts documentation from your code to populate readme
cargo install cargo-readme

// At compile time slog by default removes trace and debug level statements in release builds, and trace level records in debug builds
[dependencies.slog]
version = "2.4.1"
default-features = false
features = ["release_max_level_debug", "max_level_debug"]

// rust has conditional compilation

// run examples from others repository
cargo run --release --example small_fib
cargo run --example small_fib
// be carefull from where you run cargo run for ex:
// I had rocket_auth repo where if you don't run cargo run from the same folder that has templates it can't find the templates. The root path is where you run cargo run.



// provide credentials like this
DATABASE_URL=postgres://localhost?dbname=mydb&user=postgres&password=postgres

// sqlx example of database credentials
let pool_options = PgConnectOptions::new()
        .host("localhost")
        .port(5432)
        .username("dbuser")
        .database("dbtest")
        .password("dbpassword");

let pool: PgPool = Pool::<Postgres>::connect_with(pool_options).await?;


// let-else statements
use create::prelude::*;

pub fn key_sum(item: &str) -> Result<(&str, i32)> {
    let Some((key, val)) = item.split_once(':') else {
        return Err(Error::Static("Invalid item"));
    };

    let Ok(val) = val.trim().parse::<i32>() else {
        return Err(Error::Static("Invalid item"));
    };

    Ok((key, val))
}

// break from labeled blocks
let result = 'block: {
    do_thing();
    if condition_not_met() {
        break 'block 1;
    }

    do_next_thing();
    if condition_not_met() {
        break 'block 2;
    }
    
    do_last_thing();
    3

};

// Use dbg! instead of println
fn fibonacci(n: u32) -> u32 {
    if dbg!(n <= 2) {
        dbg!(1)
    } else {
        dbg!(fibonacci(n - 1) + fibonacci(n - 2))
    }
}

// Output is:
[main.rs:6] n <= 2 = false
[main.rs:6] n <= 2 = false
[main.rs:6] n <= 2 = false
[main.rs:6] n <= 2 = true
[main.rs:7] 1 = 1
[main.rs:6] n <= 2 = true
[main.rs:7] 1 = 1
[main.rs:9] fibonacci(n - 1) + fibonacci(n - 2) = 2
[main.rs:6] n <= 2 = true
[main.rs:7] 1 = 1
[main.rs:9] fibonacci(n - 1) + fibonacci(n - 2) = 3
[main.rs:6] n <= 2 = false
[main.rs:6] n <= 2 = true
[main.rs:7] 1 = 1
[main.rs:6] n <= 2 = true
[main.rs:7] 1 = 1
[main.rs:9] fibonacci(n - 1) + fibonacci(n - 2) = 2
[main.rs:9] fibonacci(n - 1) + fibonacci(n - 2) = 5

// casting
// as for casting is an anti-pattern in most cases. You should write xx::from(yy) or xx::try_from(yy) instead. E.g.
u32::try_from(todo.title.len()))

// Alternatives are 
xx = yy.into() and xx = yy.try_into() 
// - they are as safe as their (Try)From counterparts however they make the code LESS READABLE because you often have to guess the type.

//for loop
	let a = [10, 20, 30, 40, 50];

    for element in a.iter() {
        println!("the value is: {}", element);
    }

    // loop in Range
	for number in (1..4).rev() {
	        println!("{}!", number);
	    }

// turbofish ::<type>
// compiler can't figure out type use turbofish after fc name that returns the type
let four = "4".parse::<u32>().unwrap();

// s1 value on stack (ptr,len,capacity),the pointer has the address of the data on heap
let s1 = String::from("hello");
// &s1(&String(ptr)) is a reference(pointer) to s1
// &s1 is called a borrow
let len = calculate_length(&s1);

// s(&String) is a reference to value s1(String)
// s(ptr) -> s1(ptr,len,capacity) -> data on heap
fn calculate_length(s: &String) -> usize {}

// String Literals Are Slices
// Recall that we talked about string literals being stored inside the binary. Now that we know about slices, we can properly understand string literals:
let s = "Hello, world!";

// The type of s here is &str: it’s a slice pointing to that specific point of the binary. This is also why string literals are immutable; &str is an immutable reference.

String Slices as Parameters
// Knowing that you can take slices of literals and Strings leads us to one more improvement on first_word, and that’s its signature:

fn first_word(s: &String) -> &str {

// A more experienced Rustacean would write the following line instead because it allows us to use the same function on both Strings and &strs:

fn first_word(s: &str) -> &str {

// If we have a string slice, we can pass that directly. If we have a String, we can pass a slice of the entire String. Defining a function to take a string slice instead of a reference to a String makes our API more general and useful without losing any functionality:

fn main() {
    let my_string = String::from("hello world");

    // first_word works on slices of `String`s
    let word = first_word(&my_string[..]);

    let my_string_literal = "hello world";

    // first_word works on slices of string literals
    let word = first_word(&my_string_literal[..]);

    // since string literals *are* string slices already,
    // this works too, without the slice syntax!
    let word = first_word(my_string_literal);
}



// Self vs self
Self is the type of the current object. It may appear either in a trait or an impl, but appears most often in trait where it is a stand-in for whatever type will end up implementing the trait (which is unknown when defining the trait):

trait Clone {
    fn clone(&self) -> Self;
}
// If I then implement Clone:

impl Clone for MyType {
    // I can use either the concrete type (known here)
    fn clone(&self) -> MyType;

    // Or I can use Self again, it's shorter after all!
    fn clone(&self) -> Self;
}
I could also use it in a regular impl if I am lazy (it's shorter!):

impl MySuperLongType {
    fn new(a: u32) -> Self { ... }
}
// self is the name used in a trait or an impl for the first argument of a method. Using another name is possible, however there is a notable difference:

// if using self, the function introduced is a method
// if using any other name, the function introduced is an associated function
// In Rust, there is no implicit this argument passed to a type's methods: you have to explicitly pass the "current object" as a method parameter. This would result in:

impl MyType {
    fn doit(this: &MyType, a: u32) { ... }
}
As we have seen, as a shorter form this could also be (still verbose):

impl MyType {
    fn doit(this: &Self, a: u32) { ... }
}
Which is actually what &self boils down to under the covers.

impl MyType {
    fn doit(&self, a: u32) { ... }
}
Thus the correspondence table:

self => self: Self
&self => self: &Self
&mut self => self: &mut Self
The way to invoke those functions change, however:

impl MyType {
    fn doit(&self, a: u32) {
        // ...
    }
    fn another(this: &Self, a: u32) {
        // ...
    }
}

fn main() {
    let m = MyType;

    // Both can be used as an associated function
    MyType::doit(&m, 1);
    MyType::another(&m, 2);

    // But only `doit` can be used in method position
    m.doit(3);     // OK: `m` is automatically borrowed
    m.another(4);  // ERROR: no method named `another`
}


// Rust has two main types of strings: &str and String. Let’s talk about &str first. These are called ‘string slices’. A string slice has a fixed size, and cannot be mutated. It is a reference to a sequence of UTF-8 bytes.

let greeting = "Hello there."; // greeting: &'static str

// "Hello there." is a string literal and its type is &'static str. A string literal is a string slice that is statically allocated, meaning that it’s saved inside our compiled program, and exists for the entire duration it runs. The greeting binding is a reference to this statically allocated string. Any function expecting a string slice will also accept a string literal.

// String literals can span multiple lines. There are two forms. The first will include the newline and the leading spaces:

let s = "foo
    bar";

assert_eq!("foo\n        bar", s);

// The second, with a \, trims the spaces and the newline:

let s = "foo\
    bar"; 

assert_eq!("foobar", s);

// Rust has more than only &str's though. A String, is a heap-allocated string. This string is growable, and is also guaranteed to be UTF-8. Strings are commonly created by converting from a string slice using the to_string method.

let mut s = "Hello".to_string(); // mut s: String
println!("{}", s);

s.push_str(", world.");
println!("{}", s);

// Strings will coerce into &str with an &:

fn takes_slice(slice: &str) {
    println!("Got: {}", slice);
}

fn main() {
    let s = "Hello".to_string();
    takes_slice(&s);
}

// This coercion does not happen for functions that accept one of &str’s traits instead of &str. For example, TcpStream::connect has a parameter of type ToSocketAddrs. A &str is okay but a String must be explicitly converted using &*.

use std::net::TcpStream;

TcpStream::connect("192.168.0.1:3000"); // &str parameter

let addr_string = "192.168.0.1:3000".to_string();
// TcpStream::connect(&*addr_string); // convert addr_string to &str

// Viewing a String as a &str is cheap, but converting the &str to a String involves allocating memory. No reason to do that unless you have to!

// Because strings are valid UTF-8, strings do not support indexing:

let s = "hello";

println!("The first letter of s is {}", s[0]); // ERROR!!!


// Example of while let
// print vec values from last position
let mut stack = Vec::new();

stack.push(1);
stack.push(2);
stack.push(3);

// as long as we have values in stack
while let Some(top) = stack.pop() {
    println!("{}", top);
}

//  for loop pattern, destructure tuple
let v = vec!['a', 'b', 'c'];

for (index, value) in v.iter().enumerate() {
    println!("{} is at index {}", value, index);
}

// tuple with if
    let (status_line, filename) = if buffer.starts_with(get) {
        ("HTTP/1.1 200 OK\r\n\r\n", "hello.html")
    } else if buffer.starts_with(sleep) {
        thread::sleep(Duration::from_secs(5));
        ("HTTP/1.1 200 OK\r\n\r\n", "hello.html")
    } else {
        ("HTTP/1.1 404 NOT FOUND\r\n\r\n", "404.html")
    };


// Usually, access to a vector with [] is very fast. But, because each character in a UTF-8 encoded string can be multiple bytes, you have to walk over the string to find the nᵗʰ letter of a string. This is a significantly more expensive operation, and we don’t want to be misleading. Furthermore, ‘letter’ isn’t something defined in Unicode, exactly. We can choose to look at a string as individual bytes, or as codepoints:

let hachiko = "忠犬ハチ公";

for b in hachiko.as_bytes() {
    print!("{}, ", b);
}

println!("");

for c in hachiko.chars() {
    print!("{}, ", c);
}

println!("");
This prints:

229, 191, 160, 231, 138, 172, 227, 131, 143, 227, 131, 129, 229, 133, 172,
忠, 犬, ハ, チ, 公,

//string indexing
// You can get something similar to an index like this:  
let dog = hachiko.chars().nth(1); // kinda like hachiko[1]

&str // is a slice, a view to a String

// A string slice is a reference to part of a String, and looks like this:
let s = String::from("hello world");
let hello = &s[0..5];
let world = &s[6..11];

fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..] // slice sintax
}

// This fn is the same as above s is a slice because we can make a &String into a &str(slice) easily
fn first_word(s: &str) -> &str {}

	let my_string = String::from("hello world");

    // first_word works on slices of `String`s
    let word = first_word(&my_string[..]);

    let my_string_literal = "hello world";

    // first_word works on slices of string literals
    let word = first_word(&my_string_literal[..]);

    // since string literals *are* string slices already,
    // this works too, without the slice syntax!
    let word = first_word(my_string_literal);

// other slices
let a = [1, 2, 3, 4, 5];
// Slice type &[i32]
let slice = &a[1..3];


// iter.collect() construct a string by concatenating an iterator's items, which can be char, &str, or String values. For example, to remove all spaces from a string, you can write: 
let spacey = "man hat tan";
let spaceless: String = 
    spacey.chars().filter(|c| !c.is_whitespace()).collect();
assert_eq!(spaceless,"manhattan");


// Values can be extracted from the tuple using tuple indexing
let long_tuple = (1u8, 2u16, 3u32, 4u64,-1i8, -2i16, -3i32, -4i64,0.1f32, 0.2f64,'a', true);
println!("long tuple first value: {}", long_tuple.0);

struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// Interesting way to destructure Message::Hello
enum Message {
    Hello { id: i32 },
}

let msg = Message::Hello { id: 10 };

match msg {
    // to access id you need to create a new var(id_var, could also be called id)
    Message::Hello { id: id_var @ 3..=7 } => {
        println!("Found an id in range 3..7: id_var={}", id_var);
    }
    // id cannot be accesed because it's out of scope
    Message::Hello { id: 10..=12 } => {
        println!("Found id in 10..12 range");
    }
    Message::Hello { id } => {
        println!("Found some other id {}", id);
    }
}

// destructure struct
// This code creates the variables x and y that match the x and y fields of the p variable. The outcome is that the variables x and y contain the values from the p struct.
struct Point {
    x: i32,
    y: i32,
}

fn main() {
    let p = Point { x: 0, y: 7 };

    let Point { x, y } = p;
    assert_eq!(0, x);
    assert_eq!(7, y);
}


// Destructuring and matching literal values in one pattern
let p = Point { x: 0, y: 7 };

match p {
    Point { x, y: 0 } => println!("On the x axis at {}", x),
    Point { x: 0, y } => println!("On the y axis at {}", y),
    Point { x, y } => println!("On neither axis: ({}, {})", x, y),
}
// The first arm will match any point that lies on the x axis by specifying that the y field matches if its value matches the literal 0. The pattern still creates an x variable that we can use in the code for this arm.

// Similarly, the second arm matches any point on the y axis by specifying that the x field matches if its value is 0 and creates a variable y for the value of the y field. The third arm doesn’t specify any literals, so it matches any other Point and creates variables for both the x and y fields.

// In this example, the value p matches the second arm by virtue of x containing a 0, so this code will print On the y axis at 7.


// It makes sense to name the function arguments with the same name as the struct fields, but having to repeat the email and username field names and variables is a bit tedious. If the struct had more fields, repeating each name would get even more annoying. Luckily, there's a convenient shorthand!
fn build_user(email: String, username: String) -> User {
    User {
        email: email,
        username: username,
        active: true,
        sign_in_count: 1,
    }
}


// Using struct update syntax to set a new email and username values for a User instance but use the rest of the values from the fields of the instance in the user1 variable
let user2 = User {
    email: String::from("another@example.com"),
    username: String::from("anotherusername567"),
    ..user1
};

// We can also define structs that look similar to tuples, called tuple structs, that have the added meaning the struct name provides, but don’t have names associated with their fields, just the types of the fields. Tuple structs are useful when you want to give the whole tuple a name and make the tuple be a different type than other tuples, but naming each field as in a regular struct would be verbose or redundant.

struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

let black = Color(0, 0, 0);
let origin = Point(0, 0, 0);

// -- 
fn to_hex_string(ba: &[u8]) -> String {
    let strs: Vec = ba.iter()
        .map(|b| format!("{:02X}", b))
        .collect();
    strs.connect("")
}
This function takes a slice (a part of an array) of bytes (u8) and returns its representation as a hex string.

Vec is a growable array

.iter() it is the function that returns an iterator for a slice

.map() The argument above is Rust's syntax for a closure.

.collect() Here, it consumes the iterator and puts all the mapped results into the Vec we asked for.

.connect("") is basically a join of all the resulting strings.

#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

// print a struct use {:?} (prints on one line) or 
// {:#?} (prints on multiple lines)
println!("{:?}", rect);

// Method
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}
// Method defined with impl(implementation block), you can have more than one impl
impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };

    println!(
        "The area of the rectangle is {} square pixels.",
        rect1.area()
    );
}


// Associated Functions
// Another useful feature of impl blocks is that we’re allowed to define functions within impl blocks that don’t take self as a parameter. These are called associated functions because they’re associated with the struct. They’re still functions, not methods, because they don’t have an instance of the struct to work with. You’ve already used the String::from associated function.

// Associated functions are often used for constructors that will return a new instance of the struct. For example, we could provide an associated function that would have one dimension parameter and use that as both width and height, thus making it easier to create a square Rectangle rather than having to specify the same value twice:
impl Rectangle {
    fn square(size: u32) -> Rectangle {
        Rectangle { width: size, height: size }
    }
}

// Tuples can be used as function arguments and as return values
fn reverse(pair: (i32, bool)) -> (bool, i32) {
    // `let` can be used to bind the members of a tuple to variables
    let (integer, boolean) = pair;

    (boolean, integer)
}

let long_tuple = (1u8, 2u16, 3u32, 4u64,
                      -1i8, -2i16, -3i32, -4i64,
                      0.1f32, 0.2f64,
                      'a', true);

// Values can be extracted from the tuple using tuple indexing
    println!("long tuple first value: {}", long_tuple.0);
    println!("long tuple second value: {}", long_tuple.1);


// To create one element tuples, the comma is required to tell them apart
// from a literal surrounded by parentheses
println!("one element tuple: {:?}", (5u32,));
println!("just an integer: {:?}", (5u32));

// tuple struct
#[derive(Debug)]
struct Matrix(f32, f32, f32, f32);
struct Pair(i32,f32);

// --Strings example
// No longer true it's fast now
// Don’t use to_string on strs; it’s generic, which makes it slow. Prefer into or to_owned.

// When you have a &str, to_owned() should be preferred to to_string(); it’s more efficient, bypassing the std::fmt infrastructure

// You should always be using to_owned(). to_string() is the generic conversion to a String from any type implementing the ToString trait. It uses the formatting functions and therefor might end up doing multiple allocations and running much more code than a simple to_owned() which just allocates a buffer and copies the literal into the buffer.

// When you concatenate strings, you need to allocate memory to store the result. The easiest to start with is String and &str
fn main() {
    let mut owned_string: String = "hello ".to_owned();
    let borrowed_string: &str = "world";

    owned_string.push_str(borrowed_string);
    println!("{}", owned_string);
}

// Here, we have an owned string that we can mutate. This is efficient as it potentially allows us to reuse the memory allocation. There's a similar case for String and String, as &String can be dereferenced as &str.
fn main() {
    let mut owned_string: String = "hello ".to_owned();
    let another_owned_string: String = "world".to_owned();

    owned_string.push_str(&another_owned_string);
    println!("{}", owned_string);
}

// What if we wanted to produce a new string, leaving both untouched? The simplest way is to use format!:
fn main() {
    let borrowed_string: &str = "hello ";
    let another_borrowed_string: &str = "world";

    let together = format!("{}{}", borrowed_string, another_borrowed_string);
    println!("{}", together);
}

// You don't have to use format! though. You can clone one string and append the other string to the new string:
fn main() {
    let owned_string: String = "hello ".to_owned();
    let another_owned_string: &str = "world";

    let together = owned_string.clone() + another_owned_string;
    println!("{}", together);
}

// join example
	let a = "Hello";
    let b = "world";
    let result = [a, b].join("\n");


// we can enumerate all possible values, which is where enumeration gets its name.
enum IpAddrKind {
    V4,
    V6,
}

// We can create instances of each of the two variants of IpAddrKind like this:
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;


fn route(ip_type: IpAddrKind) { }

// And we can call this function with either variant:
route(IpAddrKind::V4);
route(IpAddrKind::V6);

// This new definition of the IpAddr enum says that both V4 and V6 variants will have associated String values:
enum IpAddr {
    V4(String),
    V6(String),
}

let home = IpAddr::V4(String::from("127.0.0.1"));

let loopback = IpAddr::V6(String::from("::1"));

// This enum has four variants with different types:
// Quit has no data associated with it at all.
// Move includes an anonymous struct inside it.
// Write includes a single String.
// ChangeColor includes three i32 values.
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}
// Defining an enum with variants like the ones in Listing 6-2 is similar to defining different kinds of struct definitions except the enum doesn’t use the struct keyword and all the variants are grouped together under the Message type.

// Interesting use of map with Option
// Maps an Option<T> to Option<U> by applying a function to a contained value.
// basicaly you turn Option<&SelectedTodo> into Option<Ulid>

fn fc1(todos: &BTreeMap<Ulid, Todo>, selected_todo: Option<&SelectedTodo>) {
    todos.map(|todo| {
            let id = todo.id;
            let is_selected = Some(id) == selected_todo.map(|selected_todo| selected_todo.id);

}

// take from Option 
let mut xx = Some(2);

// Get Val from Option xx and put None instead
if let Some(xx1) = xx.take() {
    println!("{:?}", xx1);
}

// another take() example
// if let to destructure the Some
impl Drop for ThreadPool {
    fn drop(&mut self) {
        for worker in &mut self.workers {
            println!("Shutting down worker {}", worker.id);

            if let Some(thread) = worker.thread.take() {
                thread.join().unwrap();
            }
        }
    }
}

// There is one more similarity between enums and structs: just as we’re able to define methods on structs using impl, we’re also able to define methods on enums. Here’s a method named call that we could define on our Message enum:
impl Message {
    fn call(&self) {
        // method body would be defined here
    }
}

let m = Message::Write(String::from("hello"));
m.call();

enum Option<T> {
    Some(T),
    None,
}

let some_number = Some(5);
let some_string = Some("a string");
// If we use None rather than Some, we need to tell Rust what type of Option<T> we have, because the compiler can’t infer the type that the Some variant will hold by looking only at a None value.
let absent_number: Option<i32> = None;


enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u32 {
    match coin {
        Coin::Penny => {
            println!("Lucky penny!");
            1
        },
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}

//--
#[derive(Debug)] // So we can inspect the state in a minute
enum UsState {
    Alabama,
    Alaska,
    // ... etc
}

enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

fn value_in_cents(coin: Coin) -> u32 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("State quarter from {:?}!", state);
            25
        },
    }
}

fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        None => None,
        Some(i) => Some(i + 1),
    }
}

let five = Some(5);
let six = plus_one(five);
let none = plus_one(None);

// copy items from vector
use std::iter::FromIterator;
let data = vec![1, 2, 5, 44, 59, 67];
let part = Vec::from_iter(data[1..4].iter().cloned());
or 
let part: Vec<_> = data[1..4].iter().cloned().collect();

// The _ Placeholder
// Rust also has a pattern we can use in situations when we don’t want to list all possible values
// The _ pattern will match any value. By putting it after our other arms, the _ will match all the possible cases that aren’t specified before it. The () is just the unit value, so nothing will happen in the _ case. As a result, we can say that we want to do nothing for all the possible values that we don’t list before the _ placeholder.
let some_u8_value = 0u8;
match some_u8_value {
    1 => println!("one"),
    3 => println!("three"),
    5 => println!("five"),
    7 => println!("seven"),
    _ => (),
}

// Mixing if let, else if, else if let, and else
    let favorite_color: Option<&str> = None;
    let is_tuesday = false;
    let age: Result<u8, _> = "34".parse();

    if let Some(color) = favorite_color {
        println!("Using your favorite color, {}, as the background", color);
    } else if is_tuesday {
        println!("Tuesday is green day!");
    } else if let Ok(age) = age {
        if age > 30 {
            println!("Using purple as the background color");
        } else {
            println!("Using orange as the background color");
        }
    } else {
        println!("Using blue as the background color");
    }

// Match on Option inside mutex_guard
    let n: i32 = 5;

    let arc = Arc::new(Mutex::new(Some(n)));

    let arc_clone = arc.clone();

    let mutex_guard = arc_clone.lock().unwrap();

    // note you must use *mutex_guard not mutex_guard simple
    let ref_n: &i32 = match *mutex_guard {
        Some(ref x) => x,
        None => panic!("Error."),
    };

    println!("{:?}", ref_n);



// if let as syntax sugar for a match that runs code when the value matches one pattern and then ignores all other values.
let some_u8_value = Some(3);
// match some_u8_value to Some(3)
// if no match do nothing
if let Some(3) = some_u8_value {
    println!("three");
}

// Recall the Coin enum definition in Listing 6-4, where the Quarter variant also held a UsState value. If we wanted to count all non-quarter coins we see while also announcing the state of the quarters, we could do that with a match expression like this:
let mut count = 0;
match coin {
    Coin::Quarter(state) => println!("State quarter from {:?}!", state),
    _ => count += 1,
}

 // if let else
 // The block of code that goes with the else is the same as the block of code that would go with the _ case in the match expression that is equivalent to the if let and else.
let mut count = 0;
if let Coin::Quarter(state) = coin {
    println!("State quarter from {:?}!", state);
} else {
    count += 1;
}
// else if let
    if let Some(3) = some_u8_value {
        println!("{}", "2.Three");
    } else if let Some(4) = some_u8_value {
        println!("{}", "JKJK");
    }

// Every module definition in Rust starts with the mod keyword. Add this code to the beginning of the src/lib.rs file, above the test code:
mod network {
    fn connect() {
    }
}
// We can also have multiple modules, side by side, in the same src/lib.rs file. For example, to also have a client module that has a function named connect as well.
mod client {
    fn connect() {
    }
}

// We could also create modules in src/main.rs for a binary crate in the same way as we’re creating modules in src/lib.rs for the library crate. In fact, we can put modules inside of modules, which can be useful as your modules grow to keep related functionality organized together and separate functionality apart. The choice of how you organize your code depends on how you think about the relationship between the parts of your code. For instance, the client code and its connect function might make more sense to users of our library if they were inside the network namespace 
mod network {
    fn connect() {
    }

    mod client {
        fn connect() {
        }
    }
}

// Separate modules
mod client;

mod network {
    fn connect() {
    }

    mod server {
        fn connect() {
        }
    }
}
// We’re still declaring the client module here, but by replacing the block with a semicolon, we’re telling Rust to look in another location for the code defined within the scope of the client module. In other words, the line mod client; means:
mod client {
    // contents of client.rs
}

// Rust needs to know the module hierarchy, consider this ex:
communicator
 ├── client
 └── network
// In this example, we have three modules again: client, network, and network::client. Following the same steps we did earlier for extracting modules into files, we would create src/client.rs for the client module. For the network module, we would create src/network.rs. But we wouldn’t be able to extract the network::client module into a src/client.rs file because that already exists for the top-level client module! If we could put the code for both the client and network::client modules in the src/client.rs file, Rust wouldn’t have any way to know whether the code was for client or for network::client.

// Therefore, in order to extract a file for the network::client submodule of the network module, we needed to create a directory for the network module instead of a src/network.rs file. The code that is in the network module then goes into the src/network/mod.rs file, and the submodule network::client can have its own src/network/client.rs file. Now the top-level src/client.rs is unambiguously the code that belongs to the client module.

// Rules of Module Filesystems
// Let’s summarize the rules of modules with regard to files:

// If a module named foo has no submodules, you should put the declarations for foo in a file named foo.rs.
// If a module named foo does have submodules, you should put the declarations for foo in a file named foo/mod.rs.
// These rules apply recursively, so if a module named foo has a submodule named bar and bar does not have submodules, you should have the following files in your src directory:

├── foo
│   ├── bar.rs (contains the declarations in `foo::bar`)
│   └── mod.rs (contains the declarations in `foo`, including `mod bar`)
// The modules should be declared in their parent module’s file using the mod keyword.


// The line use a::series::of; means that rather than using the full a::series::of path wherever we want to refer to the of module, we can use of.
pub mod a {
    pub mod series {
        pub mod of {
            pub fn nested_modules() {}
        }
    }
}

use a::series::of;

fn main() {
    of::nested_modules();
}

// The use keyword brings only what we’ve specified into scope: it does not bring children of modules into scope. That’s why we still have to use of::nested_modules when we want to call the nested_modules function.

// We could have chosen to bring the function into scope by instead specifying the function in the use as follows

pub mod a {
    pub mod series {
        pub mod of {
            pub fn nested_modules() {}
        }
    }
}

use a::series::of::nested_modules;

fn main() {
    nested_modules();
}

// Because enums also form a sort of namespace like modules, we can bring an enum’s variants into scope with use as well. For any kind of use statement, if you’re bringing multiple items from one namespace into scope, you can list them using curly brackets and commas in the last position, like so:

enum TrafficLight {
    Red,
    Yellow,
    Green,
}

use TrafficLight::{Red, Yellow};

fn main() {
    let red = Red;
    let yellow = Yellow;
    let green = TrafficLight::Green;
}
// We’re still specifying the TrafficLight namespace for the Green variant because we didn’t include Green in the use statement.


communicator
 ├── client
 ├── network
 |   └── client
 └── tests
// The compilation failed, but why? We don’t need to place communicator:: in front of the function like we did in src/main.rs because we are definitely within the communicator library crate here. The reason is that paths are always relative to the current module, which here is tests. The only exception is in a use statement, where paths are relative to the crate root by default. Our tests module needs the client module in its scope!

// So how do we get back up one module in the module hierarchy to call the client::connect function in the tests module? In the tests module, we can either use leading colons to let Rust know that we want to start from the root and list the whole path, like this:

::client::connect();
Or, we can use super to move up one module in the hierarchy from our current module, like this:

super::client::connect();
// These two options don’t look that different in this example, but if you’re deeper in a module hierarchy, starting from the root every time would make your code lengthy. In those cases, using super to get from the current module to sibling modules is a good shortcut. Plus, if you’ve specified the path from the root in many places in your code and then you rearrange your modules by moving a subtree to another place, you’d end up needing to update the path in several places, which would be tedious.

// It would also be annoying to have to type super:: in each test, but you’ve already seen the tool for that solution: use! The super:: functionality changes the path you give to use so it is relative to the parent module instead of to the root module.

// For these reasons, in the tests module especially, use super::something is usually the best solution. So now our test looks like this:

#[cfg(test)]
mod tests {
    use super::client;

    #[test]
    fn it_works() {
        client::connect();
    }
}

// To bring all the items in a namespace into scope at once, we can use the * syntax, which is called the glob operator. This example brings all the variants of an enum into scope without having to list each specifically

enum TrafficLight {
    Red,
    Yellow,
    Green,
}

use TrafficLight::*;

fn main() {
    let red = Red;
    let yellow = Yellow;
    let green = Green;
}


// Patterns can have a trailing conditional expression condition called a “guard”:

fn divide_opt(x: Option<i32>, y: Option<i32>) -> Option<i32> {
    match (x, y) {
        (Some(i), Some(j)) if j != 0 => Some(i / j),
        _ => None,
    }
}

// match on different kind of errors
use std::fs::File;
use std::io::ErrorKind;

fn main() {
    let f = File::open("hello.txt");

    let f = match f {
        Ok(file) => file,
        // The condition if error.kind() == ErrorKind::NotFound is called a match guard: it’s an extra condition on a match arm that further refines the arm’s pattern.
        // In short, in the context of a pattern, & matches a reference and gives us its value, but ref matches a value and gives us a reference to it.
        Err(ref error) if error.kind() == ErrorKind::NotFound => {
            match File::create("hello.txt") {
                Ok(fc) => fc,
                Err(e) => {
                    panic!(
                        "Tried to create file but there was a problem: {:?}",
                        e
                    )
                },
            }
        },
        Err(error) => {
            panic!(
                "There was a problem opening the file: {:?}",
                error
            )
        },
    };
}

// unwrap, is a shortcut method that is implemented just like the match statement we wrote in Listing 9-4. If the Result value is the Ok variant, unwrap will return the value inside the Ok. If the Result is the Err variant, unwrap will call the panic! macro for us. Here is an example of unwrap in action
fn main() {
    let f = File::open("hello.txt").unwrap();
}

// Another method, expect, which is similar to unwrap, lets us also choose the panic! error message. Using expect instead of unwrap and providing good error messages can convey your intent and make tracking down the source of a panic easier. The syntax of expect looks like this:
fn main() {
    let f = File::open("hello.txt").expect("Failed to open hello.txt");
}

// err propagation
fn read_username_from_file() -> Result<String, io::Error> {
    let f = File::open("hello.txt");

    // on success we return the file handle, on err we propagate the err
    let mut f = match f {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut s = String::new();

    // this match is the last, it ret Result:Ok or Result::Err(err propagation)
    match f.read_to_string(&mut s) {
        Ok(_) => Ok(s),
        Err(e) => Err(e),
    }
}

//
// Create my own Tresult and TError, to handle all kinds of errors
type Tresult<T> = result::Result<T, TError>;
type TError = Box<dyn error::Error>;

// .into transforms the error into type of Tresult<String>
fn read_file(p: &str) -> Tresult<String> {
    read_to_string(p).map_err(|e| e.into())
}

// A Shortcut for Propagating Errors: ?
// ? Can Only Be Used in Functions That Return Result
fn read_username_from_file() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;
    let mut s = String::new();
    
    f.read_to_string(&mut s)?;
    Ok(s)
}

// Chaining method calls, same as above but shorter
fn read_username_from_file() -> Result<String, io::Error> {
	let mut s = String::new();

	File::open("hello.txt")?.read_to_string(&mut s)?;
 	
 	Ok(s)
}

// The ? placed after a Result value is defined to work in almost the same way as the match expressions we defined to handle the Result values in Listing 9-6. If the value of the Result is an Ok, the value inside the Ok will get returned from this expression and the program will continue. If the value is an Err, the value inside the Err will be returned from the whole function as if we had used the return keyword so the error value gets propagated to the calling code.

// The one difference between the match expression from Listing 9-6 and what the question mark operator does is that when using the question mark operator, error values go through the from function defined in the From trait in the standard library. Many error types implement the from function to convert an error of one type into an error of another type. When used by the question mark operator, the call to the from function converts the error type that the question mark operator gets into the error type defined in the return type of the current function that we’re using ? in. This is useful when parts of a function might fail for many different reasons, but the function returns one error type that represents all the ways the function might fail. As long as each error type implements the from function to define how to convert itself to the returned error type, the question mark operator takes care of the conversion automatically.

// ? Can Only Be Used in Functions That Return Result
// The ? can only be used in functions that have a return type of Result, because it is defined to work in the same way as the match expression we defined in Listing 9-6. The part of the match that requires a return type of Result is return Err(e), so the return type of the function must be a Result to be compatible with this return.

// Generics
struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
}

// Note that we have to declare T just after impl in order to use T in the type Point<T>. Declaring T as a generic type after the impl is how Rust knows the type in the angle brackets in Point is a generic type rather than a concrete type. For example, we could choose to implement methods on Point<f32> instances rather than Point instances with any generic type. Listing 10-10 shows that we don’t declare anything after the impl in this case, since we’re using a concrete type, f32:

impl Point<f32> {
    fn distance_from_origin(&self) -> f32 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}

// This code means the type Point<f32> will have a method named distance_from_origin, and other instances of Point<T> where T is not of type f32 will not have this method defined. This method measures how far our point is from the point of coordinates (0.0, 0.0) and uses mathematical operations which are only available for floating-point types.



//  About String and &str
// Basically a String wraps and manages a dynamically allocated str as backing storage.
// Since str cannot be resized, String will dynamically allocate/deallocate memory.

// A &str is thus a reference directly into the backing storage of the String, while &String is a reference to the “wrapper” object.
// Additionaly, &str can be used for substrings, i.e. they are slices. A &String references always the whole string.

// match example
fn main() {
    let number = 13;
    // TODO ^ Try different values for `number`

    println!("Tell me about {}", number);
    match number {
        // Match a single value
        1 => println!("One!"),
        // Match several values
        2 | 3 | 5 | 7 | 11 => println!("This is a prime"),
        // Match an inclusive range
        13...19 => println!("A teen"),
        // Handle the rest of cases
        _ => println!("Ain't special"),
    }

    let boolean = true;
    // Match is an expression too
    let binary = match boolean {
        // The arms of a match must cover all the possible values
        false => 0,
        true => 1,
        // TODO ^ Try commenting out one of these arms
    };

    println!("{} -> {}", boolean, binary);
}


pub fn match_fn1() {
    let v = vec!["one", "two", "three", "four", "five"];

    for (num, word) in v.iter().enumerate() {
        match num {
            0 => println!("_This is {}", num),
            1 => println!("_One of the solutions is {}", num),
            _ => println!("_Don't care about the rest "),
        }

        match word {
            &"five" => println!("* Yay this is five {}", word),
            _ => {}
        }
    }

    // or you could use 1..101
    for nr in 1..=100 {
        match nr {
            1 => println!("-> This is one {}", nr),
            2 => println!("-> This is two {}", nr),
            90..95 => println!("-> Between 90 and 95 {}", nr),
            _ => {}
        }
    }
}

// Sum an iter two ways
    // this method doesn't like i32
    let sum: f64 = products
    .iter()
    .map(|p| p.price)
    .sum();

    let sum1 = products
        .iter()
        .map(|p| p.price)
        .fold(0.0, |total, next| total + next);

 
// drain does not consume the iterator
let v1 = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let c: Vec<i32> = v1.drain(..).filter(|nr| *nr % 2 == 0).collect();

// An Iter::map operation might fail, for example:
let strings = vec!["tofu", "93", "18"];
let possible_numbers: Vec<_> = strings
    .into_iter()
    .map(|s| s.parse::<i32>())
    .collect();
println!("Results: {:?}", possible_numbers);

// Result::ok  Result -> Option
// Option::ok  Option -> Result
// Option::ok or else Option -> Result

// Ignore the failed items with filter_map()
// filter_map calls a function and filters out the results that are None.
let strings: Vec<_> = vec!["tofu", "93", "18"];
let r2: Vec<_> = strings
    .into_iter() // Transform Vec to iterable 
    .map(|s| s.parse::<i32>()) // s.parse can fail Give Result with Err
    .filter_map(Result::ok) // Result::ok Converts Result to Option and filter_map filters out the results that are None and unwraps them.
    .collect(); // Transform the iterator that now contains the values from Some to Vector



// Fail the entire operation with collect()
// Result implements FromIter so that a vector of results (Vec<Result<T, E>>) can be turned into a result with a vector (Result<Vec<T>, E>). Once an Result::Err is found, the iteration will terminate.
// This same technique can be used with Option.
let strings = vec!["tofu", "93", "18"];
let numbers: Result<Vec<_>, _> = strings
    .into_iter()
    .map(|s| s.parse::<i32>())
    .collect();
println!("Results: {:?}", numbers);


// Collect all valid values and failures with partition()
let strings = vec!["tofu", "93", "18"];
let (numbers, errors): (Vec<_>, Vec<_>) = strings
    .into_iter()
    .map(|s| s.parse::<i32>())
    .partition(Result::is_ok);
println!("Numbers: {:?}", numbers);
println!("Errors: {:?}", errors);

// When you look at the results, you'll note that everything is still wrapped in Result. A little more boilerplate is needed for this.
let strings = vec!["tofu", "93", "18"];
let (numbers, errors): (Vec<_>, Vec<_>) = strings
    .into_iter()
    .map(|s| s.parse::<i32>())
    .partition(Result::is_ok);
let numbers: Vec<_> = numbers.into_iter().map(Result::unwrap).collect();
let errors: Vec<_> = errors.into_iter().map(Result::unwrap_err).collect();
println!("Numbers: {:?}", numbers);
println!("Errors: {:?}", errors);

// Option variant
    let fc_ret_options = |s:&str| {
        let res = s.parse::<i32>();
        match res {
            Ok(_ok) => Some(_ok),
            Err(_err) => None
        }
    };

    let strings1 = vec!["tofu","93","18","lala","22"];
    let (numbers,_):(Vec<_>,Vec<_>) = strings1
    .into_iter()
    .map(fc_ret_options)
    .partition(Option::is_some);

    let numbers: Vec<_> = numbers.into_iter().map(Option::unwrap).collect();
    println!("Numbers: {:?}",numbers);

// The short variant with Option
// filter_map takes a closure that returns Options, None are ignored the rest are unwraped
    let strings2 =  vec!["tofu","93","18","lala","22"];
    let numbers2:Vec<_> = strings2
    .into_iter()
    .filter_map(fc_ret_options)
    .collect();

    println!("Numbers: {:?}",numbers2);    

// Different Strings with padding
let player1 = "first player:";
let player2 = "second xx . xx player:";
let player3 = "third player:";

println!("{:_^30} this is", player1);
println!("{:_^30} padded!", player2);
println!("{:_^30} padded!", player3);

println!("{:_^30} this is", player1);
println!("{:_^30} padded!", player2);


// A function signature uses patterns in the parameters
fn print_coordinates(&(x, y): &(i32, i32)) {
    println!("Current location: ({}, {})", x, y);
}

fn main() {
    let point = (3, 5);
    print_coordinates(&point);
}


// Currently, the question-mark operator only works for Result, not Option, and this is a feature, not a limitation. Option has a ok_or_else which converts itself into a Result. For example, say we had a HashMap and must fail if a key isn't defined:

let val = map.get("my_key").ok_or_else(|| MyError::new("my_key not defined"))?;


// Matching on nested enums
enum Color {
   Rgb(i32, i32, i32),
   Hsv(i32, i32, i32),
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(Color),
}

fn main() {
    let msg = Message::ChangeColor(Color::Hsv(0, 160, 255));

    match msg {
        Message::ChangeColor(Color::Rgb(r, g, b)) => {
            println!(
                "Change the color to red {}, green {}, and blue {}",
                r,
                g,
                b
            )
        },
        Message::ChangeColor(Color::Hsv(h, s, v)) => {
            println!(
                "Change the color to hue {}, saturation {}, and value {}",
                h,
                s,
                v
            )
        }
        _ => ()
    }
}

// The pattern of the first arm in the match expression matches a Message::ChangeColor enum variant that contains a Color::Rgb variant; then the pattern binds to the three inner i32 values. The pattern of the second arm also matches a Message::ChangeColor enum variant, but the inner enum matches the Color::Hsv variant instead. We can specify these complex conditions in one match expression, even though two enums are involved.


// Destructuring Structs and Tuples
// We can mix, match, and nest destructuring patterns in even more complex ways. The following example shows a complicated destructure where we nest structs and tuples inside a tuple and destructure all the primitive values out:
let ((feet, inches), Point {x, y}) = ((3, 10), Point { x: 3, y: -10 });

// This code lets us break complex types into their component parts so we can use the values we’re interested in separately.

// Destructuring with patterns is a convenient way to use pieces of values, such as the value from each field in a struct, separately from each other.


// We’ve used the underscore (_) as a wildcard pattern that will match any value but not bind to the value. Although the underscore _ pattern is especially useful as the last arm in a match expression, we can use it in any pattern, including function parameters

// Using _ in a function signature

fn foo(_: i32, y: i32) {
    println!("This code only uses the y parameter: {}", y);
}

fn main() {
    foo(3, 4);
    
// This code will completely ignore the value passed as the first argument, 3, and will print This code only uses the y parameter: 4.


// Using an underscore within patterns that match Some variants when we don’t need to use the value inside the Some
let mut setting_value = Some(5);
let new_setting_value = Some(10);

match (setting_value, new_setting_value) {
    (Some(_), Some(_)) => {
        println!("Can't overwrite an existing customized value");
    }
    _ => {
        setting_value = new_setting_value;
    }
}

println!("setting is {:?}", setting_value);


// We can also use underscores in multiple places within one pattern to ignore particular values. 
// Ignoring multiple parts of a tuple.
let numbers = (2, 4, 8, 16, 32);

match numbers {
    (first, _, third, _, fifth) => {
        println!("Some numbers: {}, {}, {}", first, third, fifth)
    },
}

// This code will print Some numbers: 2, 8, 32, and the values 4 and 16 will be ignored.


// An unused variable starting with an underscore still binds the value, which might take ownership of the value
let s = Some(String::from("Hello!"));

if let Some(_s) = s {
    println!("found a string");
}

println!("{:?}", s);

// We’ll receive an error because the s value will still be moved into _s, which prevents us from using s again. However, using the underscore by itself doesn’t ever bind to the value. Listing 18-22 will compile without any errors because s doesn’t get moved into _.
// This code works just fine because we never bind s to anything; it isn’t moved.

let s = Some(String::from("Hello!"));

if let Some(_) = s {
    println!("found a string");
}

println!("{:?}", s);
// code result

// found a string
// Some("Hello")


// Ignoring all fields of a Point except for y by using ..
    struct Point {
        x: i32,
        y: i32,
        z: i32,
    }

    let origin = Point { x: 0, y: 5, z: 0 };

    match origin {
        Point { y, .. } => println!("y is {}", y),
    }

// The syntax .. will expand to as many values as it needs to be. Listing 18-24 shows how to use .. with a tuple.
let numbers = (2, 4, 8, 16, 32);

match numbers {
    (first, .., last) => {
        println!("Some numbers: {}, {}", first, last);
    },
}


// In this code, the first and last value are matched with first and last. The .. will match and ignore everything in the middle.

// However, using .. must be unambiguous. If it is unclear which values are intended for matching and which should be ignored, Rust will give us an error.
// An attempt to use .. in an ambiguous way
let numbers = (2, 4, 8, 16, 32);

match numbers {
    (.., second, ..) => {
        println!("Some numbers: {}", second)
    },
}

// It’s impossible for Rust to determine how many values in the tuple to ignore before matching a value with second and then how many further values to ignore thereafter. This code could mean that we want to ignore 2, bind second to 4, and then ignore 8, 16, and 32; or that we want to ignore 2 and 4, bind second to 8, and then ignore 16 and 32; and so forth. The variable name second doesn’t mean anything special to Rust, so we get a compiler error because using .. in two places like this is ambiguous.


// A match guard is an additional if condition specified after the pattern in a match arm that must also match, along with the pattern matching, for that arm to be chosen. Match guards are useful for expressing more complex ideas than a pattern alone allows.

// The condition can use variables created in the pattern. Listing 18-26 shows a match where the first arm has the pattern Some(x) and also has a match guard of if x < 5.


// Using a match guard to test for equality with an outer variable
// This code will now print Default case, x = Some(5). The pattern in the second match arm doesn’t introduce a new variable y that would shadow the outer y, meaning we can use the outer y in the match guard. Instead of specifying the pattern as Some(y), which would have shadowed the outer y, we specify Some(n). This creates a new variable n that doesn’t shadow anything because there is no n variable outside the match.

// The match guard if n == y is not a pattern and therefore doesn’t introduce new variables. This y is the outer y rather than a new shadowed y, and we can look for a value that has the same value as the outer y by comparing n to y.
    let x = Some(5);
    let y = 10;

    match x {
        Some(50) => println!("Got 50"),
        Some(n) if n == y => println!("Matched, n = {:?}", n),
        _ => println!("Default case, x = {:?}", x),
    }

    println!("at the end: x = {:?}, y = {:?}", x, y);


// You can also use the or operator | in a match guard to specify multiple patterns; the match guard condition will apply to all the patterns. Listing 18-28 shows the precedence of combining a match guard with a pattern that uses |. The important part of this example is that the if y match guard applies to 4, 5, and 6, even though it might look like if y only applies to 6.
let x = 4;
let y = false;

match x {
    4 | 5 | 6 if y => println!("yes"),
    _ => println!("no"),
}

// The match condition states that the arm only matches if the value of x is equal to 4, 5, or 6 and if y is true. When this code runs, the pattern of the first arm matches because x is 4, but the match guard if y is false, so the first arm is not chosen. The code moves on to the second arm, which does match, and this program prints no. The reason is that the if condition applies to the whole pattern 4 | 5 | 6, not only to the last value 6. In other words, the precedence of a match guard in relation to a pattern behaves like this:

(4 | 5 | 6) if y => ...
// rather than this:
4 | 5 | (6 if y) => ...

// After running the code, the precedence behavior is evident: if the match guard were applied only to the final value in the list of values specified using the | operator, the arm would have matched and the program would have printed yes.


// @ Bindings
// The at operator (@) lets us create a variable that holds a value at the same time we’re testing that value to see whether it matches a pattern. Listing 18-29 shows an example where we want to test that a Message::Hello id field is within the range 3...7. But we also want to bind the value to the variable id_variable so we can use it in the code associated with the arm. We could name this variable id, the same as the field, but for this example we’ll use a different name.
enum Message {
    Hello { id: i32 },
}

let msg = Message::Hello { id: 5 };

match msg {
    Message::Hello { id: id_variable @ 3...7 } => {
        println!("Found an id in range: {}", id_variable)
    },
    Message::Hello { id: 10...12 } => {
        println!("Found an id in another range")
    },
    Message::Hello { id } => {
        println!("Found some other id: {}", id)
    },
}

// This example will print Found an id in range: 5. By specifying id_variable @ before the range 3...7, we’re capturing whatever value matched the range while also testing that the value matched the range pattern.

// In the second arm, where we only have a range specified in the pattern, the code associated with the arm doesn’t have a variable that contains the actual value of the id field. The id field’s value could have been 10, 11, or 12, but the code that goes with that pattern doesn’t know which it is. The pattern code isn’t able to use the value from the id field, because we haven’t saved the id value in a variable.

// In the last arm, where we’ve specified a variable without a range, we do have the value available to use in the arm’s code in a variable named id. The reason is that we’ve used the struct field shorthand syntax. But we haven’t applied any test to the value in the id field in this arm, as we did with the first two arms: any value would match this pattern.

// Using @ lets us test a value and save it in a variable within one pattern.


// Fully Qualified Syntax for Disambiguation: Calling Methods with the Same Name 
trait Pilot {
    fn fly(&self);
}

trait Wizard {
    fn fly(&self);
}

struct Human;

impl Pilot for Human {
    fn fly(&self) {
        println!("This is your captain speaking.");
    }
}

impl Wizard for Human {
    fn fly(&self) {
        println!("Up!");
    }
}

impl Human {
    fn fly(&self) {
        println!("*waving arms furiously*");
    }
}

// Specifying which trait’s fly method we want to call
fn main() {
    let person = Human;
    Pilot::fly(&person);
    Wizard::fly(&person);
    person.fly();
}


// However, associated functions that are part of traits don’t have a self parameter. When two types in the same scope implement that trait, Rust can’t figure out which type you mean unless you use fully qualified syntax. For example, the Animal trait in Listing 19-19 has the associated function baby_name, the implementation of Animal for the struct Dog, and the associated function baby_name defined on Dog directly.

trait Animal {
    fn baby_name() -> String;
}

struct Dog;

impl Dog {
    fn baby_name() -> String {
        String::from("Spot")
    }
}

impl Animal for Dog {
    fn baby_name() -> String {
        String::from("puppy")
    }
}

fn main() {
    println!("A baby dog is called a {}", Dog::baby_name());
}

// Because Animal::baby_name is an associated function rather than a method, and thus doesn’t have a self parameter, Rust can’t figure out which implementation of Animal::baby_name we want.

// To disambiguate and tell Rust that we want to use the implementation of Animal for Dog, we need to use fully qualified syntax. Listing 19-21 demonstrates how to use fully qualified syntax.

fn main() {
    println!("A baby dog is called a {}", <Dog as Animal>::baby_name());
}

// In general, fully qualified syntax is defined as follows:

<Type as Trait>::function(receiver_if_method, next_arg, ...);

//--
Good names are important, and while values in a tuple struct can be referenced with dot notation as well, a struct gives us actual names, rather than positions.

There is one case when a tuple struct is very useful, though, and that is when it has only one element. We call this the ‘newtype’ pattern, because it allows you to create a new type that is distinct from its contained value and also expresses its own semantic meaning:

struct Inches(i32);

let length = Inches(10);

let Inches(integer_length) = length;
println!("length is {} inches", integer_length);

As you can see here, you can extract the inner integer type through a destructuring let, as with regular tuples. In this case, the let Inches(integer_length) assigns 10 to integer_length.


// Using the Newtype Pattern to Implement External Traits on External Types
// In Chapter 10 in the “Implementing a Trait on a Type” section, we mentioned the orphan rule that states we’re allowed to implement a trait on a type as long as either the trait or the type are local to our crate. It’s possible to get around this restriction using the newtype pattern, which involves creating a new type in a tuple struct. (We covered tuple structs in the “Using Tuple Structs without Named Fields to Create Different Types” section of Chapter 5.) The tuple struct will have one field and be a thin wrapper around the type we want to implement a trait for. Then the wrapper type is local to our crate, and we can implement the trait on the wrapper. Newtype is a term that originates from the Haskell programming language. There is no runtime performance penalty for using this pattern, and the wrapper type is elided at compile time.

// As an example, let’s say we want to implement Display on Vec<T>, which the orphan rule prevents us from doing directly because the Display trait and the Vec<T> type are defined outside our crate. We can make a Wrapper struct that holds an instance of Vec<T>; then we can implement Display on Wrapper and use the Vec<T> value, as shown in Listing 19-23.

// Creating a Wrapper type around Vec<String> to implement Display
use std::fmt;

struct Wrapper(Vec<String>);

impl fmt::Display for Wrapper {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[{}]", self.0.join(", "))
    }
}

fn main() {
    let w = Wrapper(vec![String::from("hello"), String::from("world")]);
    println!("w = {}", w);

// The implementation of Display uses self.0 to access the inner Vec<T>, because Wrapper is a tuple struct and Vec<T> is the item at index 0 in the tuple. Then we can use the functionality of the Display type on Wrapper.

// The downside of using this technique is that Wrapper is a new type, so it doesn’t have the methods of the value it’s holding. We would have to implement all the methods of Vec<T> directly on Wrapper such that the methods delegate to self.0, which would allow us to treat Wrapper exactly like a Vec<T>. If we wanted the new type to have every method the inner type has, implementing the Deref trait (discussed in Chapter 15 in the “Treating Smart Pointers Like Regular References with the Deref Trait” section) on the Wrapper to return the inner type would be a solution. If we don’t want the Wrapper type to have all the methods of the inner type—for example, to restrict the Wrapper type’s behavior—we would have to implement just the methods we do want manually.

// Now you know how the newtype pattern is used in relation to traits; it’s also a useful pattern even when traits are not involved. Let’s switch focus and look at some advanced ways to interact with Rust’s type system.


// The dyn Trait feature is the new syntax for using trait objects. In short:

// Box<Trait> becomes Box<dyn Trait>
// &Trait and &mut Trait become &dyn Trait and &mut dyn Trait

trait Trait {}

impl Trait for i32 {}

// old
fn function1() -> Box<Trait> {
}

// new
fn function2() -> Box<dyn Trait> {
}



// Self is the type of the current object. It may appear either in a trait or an impl, but appears most often in trait where it is a stand-in for whatever type will end up implementing the trait (which is unknown when defining the trait):

trait Clone {
    fn clone(&self) -> Self;
}

// If I then implement Clone:

impl Clone for MyType {
    // I can use either the concrete type (known here)
    fn clone(&self) -> MyType;

    // Or I can use Self again, it's shorter after all!
    fn clone(&self) -> Self;
}

// I could also use it in a regular impl if I am lazy (it's shorter!):

impl MySuperLongType {
    fn new(a: u32) -> Self { ... }
}

// self is the name used in a trait or an impl for the first argument of a method. Using another name is possible, however there is a notable difference:

//     if using self, the function introduced is a method
//     if using any other name, the function introduced is an associated function

// In Rust, there is no implicit this argument passed to a type's methods: you have to explicitly pass the "current object" as a method parameter. This would result in:

impl MyType {
    fn doit(this: &MyType, a: u32) { ... }
}

// As we have seen, as a shorter form this could also be (still verbose):

impl MyType {
    fn doit(this: &Self, a: u32) { ... }
}

// Which is actually what &self boils down to under the covers.

impl MyType {
    fn doit(&self, a: u32) { ... }
}

// Thus the correspondence table:

self => self: Self
&self => self: &Self
&mut self => self: &mut Self

// The way to invoke those functions change, however:

impl MyType {
    fn doit(&self, a: u32) {
        // ...
    }
    fn another(this: &Self, a: u32) {
        // ...
    }
}

fn main() {
    let m = MyType;

    // Both can be used as an associated function
    MyType::doit(&m, 1);
    MyType::another(&m, 2);

    // But only `doit` can be used in method position
    m.doit(3);     // OK: `m` is automatically borrowed
    m.another(4);  // ERROR: no method named `another`
}



// Primitive Type fn
// Function pointers, like fn(usize) -> bool.

// Function pointers implement all closures traits: Fn, FnMut, and FnOnce.

// Unlike closures, fn is a type rather than a trait, so we specify fn as the parameter type directly rather than declaring a generic type parameter with one of the Fn traits as a trait bound.

// Function pointers implement all three of the closure traits (Fn, FnMut, and FnOnce), so you can always pass a function pointer as an argument for a function that expects a closure. It’s best to write functions using a generic type and one of the closure traits so your functions can accept either functions or closures.

// As an example of where you could use either a closure defined inline or a named function, let’s look at a use of map. To use the map function to turn a vector of numbers into a vector of strings, we could use a closure, like this:

let list_of_numbers = vec![1, 2, 3];
let list_of_strings: Vec<String> = list_of_numbers
    .iter()
    .map(|i| i.to_string())
    .collect();

// Or we could name a function as the argument to map instead of the closure, like this:

let list_of_numbers = vec![1, 2, 3];
let list_of_strings: Vec<String> = list_of_numbers
    .iter()
    .map(ToString::to_string)
    .collect();


// Function pointers are pointers that point to code, not data. They can be called just like functions. Like references, function pointers are, among other things, assumed to not be null, so if you want to pass a function pointer over FFI and be able to accommodate null pointers, make your type Option<fn()> with your required signature.

// Plain function pointers are obtained by casting either plain functions, or closures that don't capture an environment:

fn add_one(x: usize) -> usize {
    x + 1
}

let ptr: fn(usize) -> usize = add_one;
assert_eq!(ptr(5), 6);

let clos: fn(usize) -> usize = |x| x + 5;
assert_eq!(clos(5), 10);
Run

// In addition to varying based on their signature, function pointers come in two flavors: safe and unsafe. Plain fn() function pointers can only point to safe functions, while unsafe fn() function pointers can point to safe or unsafe functions.

fn add_one(x: usize) -> usize {
    x + 1
}

unsafe fn add_one_unsafely(x: usize) -> usize {
    x + 1
}

let safe_ptr: fn(usize) -> usize = add_one;

//ERROR: mismatched types: expected normal fn, found unsafe fn
//let bad_ptr: fn(usize) -> usize = add_one_unsafely;

let unsafe_ptr: unsafe fn(usize) -> usize = add_one_unsafely;
let really_safe_ptr: unsafe fn(usize) -> usize = add_one;
Run

On top of that, function pointers can vary based on what ABI they use. This is achieved by adding the extern keyword to the type name, followed by the ABI in question. For example, fn() is different from extern "C" fn(), which itself is different from extern "stdcall" fn(), and so on for the various ABIs that Rust supports. Non-extern functions have an ABI of "Rust", and extern functions without an explicit ABI have an ABI of "C". For more information, see the nomicon's section on foreign calling conventions.

Extern function declarations with the "C" or "cdecl" ABIs can also be variadic, allowing them to be called with a variable number of arguments. Normal rust functions, even those with an extern "ABI", cannot be variadic. For more information, see the nomicon's section on variadic functions.

These markers can be combined, so unsafe extern "stdcall" fn() is a valid type.

// ex of fc that accepts a closure or a function pointer
//< fn that accepts a fc or a closure
fn f_accepts<T>(fc_or_cl: T)
where
    T: Fn(i32) -> i32,
{
    println!("fc_or_closure{}", fc_or_cl(30));
}

fn ffx1(a: i32) -> i32 {
    a + 10
}

fn tst_accepts() {
    let fc_pointer: fn(i32) -> i32 = ffx1;
    let clsr = |x: i32| x + 2;
    f_accepts(fc_pointer);
    f_accepts(clsr);
}


//< use of FnOnce() -> T that returns a type 
pub fn spawn<F, T>(f: F) -> JoinHandle<T>
    where
        // FnOnce() is a closure that takes no params but returns T
        F: FnOnce() -> T + Send + 'static,
        T: Send + 'static

// The F type parameter is the one we’re concerned with here; the T type parameter is related to the return value, and we’re not concerned with that. We can see that spawn uses FnOnce as the trait bound on F. This is probably what we want as well, because we’ll eventually pass the argument we get in execute to spawn. We can be further confident that FnOnce is the trait we want to use because the thread for running a request will only execute that request’s closure one time, which matches the Once in FnOnce.

// The F type parameter also has the trait bound Send and the lifetime bound 'static, which are useful in our situation: we need Send to transfer the closure from one thread to another and 'static because we don’t know how long the thread will take to execute.

pub fn execute<F>(&self, f: F)
    where
        F: FnOnce() + Send + 'static
{

}
// We still use the () after FnOnce because this FnOnce represents a closure that takes no parameters and returns the unit type (). Just like function definitions, the return type can be omitted from the signature, but even if we have no parameters, we still need the parentheses.


// We have another useful pattern that exploits an implementation detail of tuple structs and tuple-struct enum variants. These types use () as initializer syntax, which looks like a function call. The initializers are actually implemented as functions returning an instance that’s constructed from their arguments. We can use these initializer functions as function pointers that implement the closure traits, which means we can specify the initializer functions as arguments for methods that take closures, like so:

enum Status {
    Value(u32),
    Stop,
}

let list_of_statuses: Vec<Status> =
    (0u32..20)
    .map(Status::Value)
    .collect();


The Easy Case: Rust
The notation for Rust closures is very concise in comparison:

let m = 1.0;
let c = 2.0;

let line = |x| m*x + c;

println!("{} {}", line(0.0), line(1.0));

Two points need emphasis. The first is that closures are quite distinct from plain functions - I can define a function line here but it will not share references to the local variables m and c. The second is that the argument and return type are established by type inference. As soon as we say line(0.0) the compiler knows that this closure takes a f64 and returns an f64. If I subsequently try to call line(1) it will complain because no way Rust will convert an integer into a float without a typecast.

Rust has a very similar attitude to C++ here - that closures should be a zero-overhead abstraction. Here we have a vector of integers, and wish to know how many elements are greater than zero:

let k = my_vec.iter().filter(|n| **n > 0).count();

The guarantee is that this will be just as fast as writing out an explicit loop! What is the type of n? iter() produces a iterator over references to the elements (say &i32) and filter takes a closure which is passed a reference to the iterator type - so it will be &&i32 in this case. So we need a double dereference to get the actual integer - Rust references don’t automagically dereference themselves, except if a method is called. (A more idiomatic way of writing this is |&&n| n > 0.) So, although type inference saves us typing and makes iterator expressions much less noisy, it does not not save us from having to know the type.

The way that Rust (and C++) avoids overhead in this most important case is not to box closures. This means that they can be inlined.




Implications of “Closures are Structs”

|x| m*x + c has a lifetime tied to that of m and c. It cannot live longer than these variables. The lifetime appears explictly when we try to store closures in boxes:

struct HasAClosure<'a> {
    closure: Box<Fn(f64)->f64 + 'a>
}

impl <'a>HasAClosure<'a> {

    fn new<C>(f: C) -> HasAClosure<'a>
    where C: Fn(f64)->f64 + 'a {
        HasAClosure {
            closure: Box::new(f)
        }
    }

}

I recall being a little puzzled at the lifetime bound, until I fully internalized the fact that closures are structs, and structs that borrow have lifetimes.

The borrow checker is going to be particularly strict about closures that borrow mutably (FnMut) since there may be only one mutable reference to a value, and that reference will be captured by the closure.

let mut x = 1.0;
let mut change_x = || x = 2.0;
change_x();
println!("{}",x);
....
25 |     let mut change_x = || x = 2.0;
   |                    -- - previous borrow occurs due to use of `x` in closure
   |                    |
   |                    mutable borrow occurs here
26 |     change_x();
27 |     println!("{}",x);
   |                   ^ immutable borrow occurs here

The closure bound to change_x has got its sticky paws on x and will not release it until it goes out of scope! So this will work:

let mut x = 1.0;
{
    let mut change_x = || x = 2.0;
    change_x();
}
println!("{}",x);

// This is annoying, but it truly becomes a bastard when you have some struct keeping actions as closures. Only one of those actions can manipulate the environment! Working with Rust is sometimes like the old joke about the person who goes to the doctor: “It hurts when I do this”. To which the doctor replies, “Then don’t do it”. In the case of actions that need to manipulate some state, make the owner of the actions keep the state and explicitly pass a mutable reference to it in the actions. That is, the closures themselves do not borrow mutably.

// The problem goes beyond mutable references, particularly when the lifetime of the closures has to be longer than any temporary scope. For instance, you may attach an action to a button in some function - that action must last longer than the function.

// move closures avoid borrow-checking problems by avoiding borrowing - they move the values. If those values are Copy, then Rust will copy. But otherwise the value will be moved and not be available afterwards. This is the only way to get a closure with a 'static lifetime.

// A common strategy is to use shared references like Rc and Arc (equivalent to C++’s shared_ptr). Cloning a shared reference just increments the reference count, and dropping them decrements the count; when the count goes to zero the actual value is dropped. This is a kind of garbage collection and provides the important guarantee that the references will last ‘just long enough’. So typically you would clone a reference and move it into a closure, and avoid explicit lifetime problems.


// Error chain
fn error_chain_fmt(
    e: &impl std::error::Error,
    f: &mut std::fmt::Formatter<'_>,
) -> std::fmt::Result {

    writeln!(f, "{}\n", e)?;
    let mut current = e.source();
    
    // this iterates over the error chain
    while let Some(cause) = current {
        writeln!(f, "Caused by:\n\t{}", cause)?;
        current = cause.source();
    }
    Ok(())
}

// It iterates over the whole chain of errors7 that led to the failure we are trying to print.
// We can then change our implementation of Debug for StoreTokenError to use it:

impl std::fmt::Debug for StoreTokenError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        error_chain_fmt(self, f)
    }
}

