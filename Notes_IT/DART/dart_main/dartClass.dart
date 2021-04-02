class Person {
  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor(dctr = if you don't specify one its
  // provided for you); you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

// multiple constructors
class FluffyBunny {
  FluffyBunny.fromXml(String xml) {
    // …
  }

  FluffyBunny.fromJson(String json) {
    // ...
  }
}

var xml = "<bunny><name>floppy</name></bunny>";
var json = '{"bunny":{"name":"peter"}}';

var floppy = new FluffyBunny.fromXml(xml);
var peter = new FluffyBunny.fromJson(json);

// factory constructor
class Symbol {
  final String name;
  static Map<String, Symbol> _cache = new Map<String, Symbol>();

  factory Symbol(String name) {
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

// interfaces
// has implied interface
abstract class Animal {
	void speak(String say);
}

class Dog implements Animal {
  String name;

  Dog(this.name);

  // inherited from Animal interface
  void speak(String say) {
    print("$name says $say");
  }
}

class Duck implements Animal {
  String species;

  Duck(this.species);

  // inherited from Animal interface
  void speak(String say) {
    print("$species says $say...$say");
  }
}

void main() {
  Animal dog = new Dog("Koa");
  dog.speak("bark");

  Animal duck = new Duck("Mallard");
  duck.speak("quack");

  List<Animal> animals = [dog, duck];
  for (Animal animal in animals) {
    animal.speak("hello");
  }
}
// prints
// Koa says bark
// Mallard says quack...quack
// Koa says hello
// Mallard says hello...hello


// simply put, a mixin is a common behavior/feature
// shared among multiple unrelated classes. In practice, this means a set of methods and properties that are common to all classes implementing this mixin.

// The Genre mixin is just a class that has to follow three requirements:
// * No constructors defined
// * The super class is the default Object class
// * No calls to the parent class with super

class Genre {
List<String> keywords = [];
  guessGenre() {
  // Try to guess what's the overall genre for this object.
  // Implementation is not interesting for us here.
  }
}

class Shelf extends Object with Genre {
/* Remains unchanged. */
}
class Book extends Object with Genre {
/* Remains unchanged. */
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


// class  trick
class Person {
  String name;
  int age;
}

void main() {
  Person p = new Person()
    ..name = "lala"
    ..age = 20;
}


// generic

class A<T,U> {

  T f1(T v) {
    int nr;
    
    if(v is int) {
      nr = v as int;
      print(nr+100);
    }
    else throw "error";
    
    return v;
  }
  
  U f2(U v) {
    return v;
  }
  
}


  A a1 = new A<int, String>();
  print(a1.f1(40));
  print(a1.f2("lalal"));


// Is there a Dart equivalent syntax to the c# ability to specify type constraints on a generic type, e.g. in C#-like syntax where TBase is SomeType:

class StackPanel<TBase> extends Panel<TBase> where TBase : SomeType{

}

You can specify type constraints like this :

class StackPanel<TBase extends SomeType> extends Panel<TBase> {
}

The language specification says :

A type parameter T may be suffixed with an extends clause that specifies the upper bound for T. If no extends clause is present, the upper bound is Object. It is a static type warning if a type parameter is a supertype of its upper bound. The bounds of type variables are a form of type annotation and have no effect on execution in production mode.


// This pattern also allows you to lock down an object system where an arbitrary instance won’t fly
// abstract class cannot be inherited, constructor is factory
abstract class SomeClass {
  int get a;
  String get b;
  bool someMethod();

  factory SomeClass(int a, String b) => new _SomeClassImpl(a, b);
}

class _SomeClassImpl implements SomeClass {
  final int a;
  final String b;
  bool someMethod() ...

  _SomeClassImpl(this.a, this.b);

  // No impersonators allowed
  bool operator ==(Object other) =>
    other is _SomeClassImpl && other.a == a && other.b == b;
}
