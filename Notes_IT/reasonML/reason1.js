sudo npm install --unsafe-perm -g bs-platform

// Tired of seeing [@bs] foo(bar, baz) for uncurrying? Use the new version to refmt your code to automatically format it into 
foo(. bar, baz)!

// Since bindings are scoped through {}, you can create an anonymous scope around them:
let message = {
  let part1 = "hello";
  let part2 = "world";
  part1 ++ " " ++ part2
};
/* `part1` and `part2` not accessible here! */
// This prevents misuse of the bindings after these lines.


// Aliases
// You can refer to a type by a different name. They'll be equivalent:
type scoreType = int;
let x: scoreType = 10;

concat: (string, list(string)) => string;




































