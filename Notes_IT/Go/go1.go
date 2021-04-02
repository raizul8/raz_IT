# List available go version (local)
gvm list

# List available go version (ready to be downloaded)
gvm listall

# Installing go
gvm install go1.3

# Using a version
gvm use go1.3

alias gvm_create="gvm pkgset create"
alias gvm_delete="gvm pkgset-delete"
alias gvm_list="gvm pkgset list"
alias gvm_env="gvm pkgenv"

function gvm_use {
    gvm pkgset use $1 --default
}

# Creating a pkgset
gvm pkgset create my-pkgset-name
# delete it
gvm pkgset-delete pkg2

# view packages
gvm pkgset list

# Configure environment variables
gvm pkgenv my-pkgset-name

# Using it
gvm pkgset use my-pkgset-name
gvm pkgset use my-pkgset-name --default
gvm pkgset use global

// go get
GOPATH=$(pwd) go get github.com/google/flatbuffers/go

// Lubuntu where to put desktop files 
/home/raz/.local/share/applications/

// where go is installed
which go
/home/raz/.gvm/gos/go1.8/bin/go

// reload profile
source ~/.profile | . ~/.profile | . .profile

// proto
 protoc --go_out=. *.proto

// delete /usr/local/go to uninstall golang
sudo rm -r go
// unpack go 
sudo tar -C /usr/local -xzf go1.3.linux-amd64.tar.gz

// go install works if you have a directory structure in src foder(meaning other file in src)
// you say go install go1 Not go install go1.go

//As mentioned in "How does Go update third-party packages?", a 
go get -u all can help.

// simple go get should get all packages

// change env var from command line
export GOPATH=/home/raz2/IdeaProjects/p2

// everything in Go is passed by value

// only to ~/.profile if terminal option enabled 
export GOPATH=/home/raizul2/go/P1/hello2
export PATH=$PATH:/home/raizul2/go/P1/hello1/bin:/home/raizul2/go/P1/hello2/bin

//add bin to path quickly
export PATH=$PATH:$GOPATH/bin

// Goroot for gvm
GOROOT=/home/razvan/.gvm/gos/go1.2

//.bashrc and .profile
export PATH=...:${GOPATH//://bin:}/bin

// quick gopath
GOPATH=pwd

// check what you installed for go
dpkg -l | grep golang

// Documentation
godoc fmt Println
    
// In Go, there is no such thing as a type alias. The type keyword introduces new named types. They are not aliases.

// string formatting progrmming in go c3.5 pg 93

// A pointer is a variable which stores the address of another variable.
// A reference is a variable which refers to another variable.

// Check nr of goroutines
check runtime.NumGoroutine()

// return error wrapped in context
return nil, errors.Wrap(err,"Failed to ...")

// new Time with location UTC
time.Date(2017, time.April, 15, 19, 30,0,0,time.UTC)

// +0200 EET
bucharest, _ := time.LoadLocation("Europe/Bucharest")
time.Now().UTC().In(bucharest))

// standard time
string representation of Unix time 1136243045, that is, the precise
date/time 2006-01-02T15:04:05Z07:00
"2006-01-02 15:04:05.000000000 -0700 UTC"
"2006-01-02 15:04:05.000000000 -07:00 UTC"
"2006-01-02T15:04:05.000000000-07:00"
"2006-01-02T15:04:05.000Z-07:00"
RFC3339Nano := "2006-01-02T15:04:05.00Z"
iso8601     := "2006-01-02T15:04:05.000Z"
time.Parse("2006-01-02T15:04:05.000Z", s1)

// The standard time used in the layouts is:

// Mon Jan 2 15:04:05 MST 2006 (MST is GMT-0700)
// which is Unix time 1136243045. (Think of it as 01/02 03:04:05PM '06 -0700.) To define your own format, write down what the standard time would look like formatted your way.

func main() {
    t, err := time.Parse("2006-01-02 15:04", "2011-01-19 22:15")
    if err != nil {
        fmt.Println(err)
        return
    }
    fmt.Println(time.SecondsToUTC(t.Seconds()))

// Get the path of your executable go file
    ex, err := os.Executable()
    if err != nil {
        panic(err)
    }
    exPath := path.Dir(ex)
    fmt.Println(exPath)

// The name of package file the same as package folder
/raz_utils
    raz_utils.go -> package raz_utils
        import raz_utils
        raz_utils.HandleError1(err)    

    // if you give diferent name than your file use razutils instead of raz_utils
    raz_utils.go -> package razutils
        import razutils
        razutils.HandleError1(err)

// Link to file at line 20
fmt.Println("/home/raz/IdeaProjects1/projects1/gas_03_2017/src/raz_utils/raz_utils.go:20:0")

// golang regexp uses re2 syntax

// capture log output
func captureOutput(f func()) string {
    var buf bytes.Buffer
    log.SetOutput(&buf)
    f()
    log.SetOutput(os.Stderr)
    return buf.String()
}

output := captureOutput(func() {
    client.RemoveCertificate("www.example.com")
})
assert.Equal("removed certificate www.example.com\n", output)


// Write to log file
f, err := os.OpenFile("testlogfile", os.O_RDWR | os.O_CREATE | os.O_APPEND, 0666)
if err != nil {
    t.Fatalf("error opening file: %v", err)
}
defer f.Close()

log.SetOutput(f)
log.Println("This is a test log entry")

// Capture log output from my services
var buf bytes.Buffer
myService.Logger = log.New(&buf, "", log.LstdFlags)
myService.Run()
if !strings.Contains(buf.String(), "service failed") {
        t.Fatal("expected log message")
}

// Use io.Copy() function to copy data from a reader to a writer

// Reflection on struct used also by json package
type Contact struct {
    Name string "check:len(3,40)"
    Id int "check:range(1,999999)"
}
person := Contact{"Bjork", 0xDEEDED}
personType := reflect.TypeOf(person)

if nameField, ok := personType.FieldByName("Name"); ok {
    fmt.Printf("%q %q %q\n", nameField.Type, nameField.Name, nameField.Tag)
}
"string" "Name" "check:len(3,40)"

// Go is smart enough to allow us to drop inner
// type names and ampersands when creating slice literals, so here the creation
// of the points slice is really a shorthand for points := []*Point{&Point{3, 1},
// &Point{1, 2}, …}.
points := []*Point{{3, 1}, {1, 2}, {2, 3}, {1, 3}, {3, 2}, {2, 1}, {2, 2}}

// type assert the val from reply interface{} to findResult
result := (<-reply).(findResult)


// mock time
// The cure is to mock out time… which of course is non-trivial because the time package is just a bunch of top level functions. So everywhere that was using the time package now needs to take your special clock interface that wraps time and then for tests you pass in a fake time that you can control.

// Multi-OS Mistakes
// When making a new path, even in tests, use filepath.Join, not path.Join and definitely not by concatenating strings and slashes. filepath.Join will do the right thing with slashes for the OS. For comparing paths, always use path.ToSlash to convert a filepath to a canonical string that you can then compare to.

// <Duplicating streams>
//https://medium.com/go-walkthrough/go-walkthrough-io-package-8ac5e95a9fbd#.rwbpkhpsm
// One issue you may run across when using readers is that once a reader is read, the data cannot be reread. For example, your application may fail to parse an HTTP request body and you’re unable to debug the issue because the parser has already consumed the data.

// The TeeReader is a great option for capturing the reader’s data while not interfering with the consumer of the reader.
func TeeReader(r Reader, w Writer) Reader
// This function constructs a new reader that wraps your reader, r. Any reads from the new reader will also get written to w. This writer can be anything from an in-memory buffer to a log file to STDERR.

// For example, you can capture bad requests like this:
var buf bytes.Buffer
body := io.TeeReader(req.Body, &buf)
// ... process body ...
if err != nil {
        // inspect buf
        return err
}
// However, it’s important that you restrict the request body that you’re capturing so that you don’t run out of memory.
// The LimitReader provides this functionality by producing a wrapping reader that restricts the total number of bytes read:
func LimitReader(r Reader, n int64) Reader
// One issue with LimitReader is that it won’t tell you if your underlying reader exceeds n. It will simply return io.EOF once n bytes are read from r. One trick you can use is to set the limit to n+1 and then check if you’ve read more than n bytes at the end.
// <Duplicating streams/>

// MultiReader concatenates several readers into one
r := io.MultiReader(
        bytes.NewReader([]byte("...my header...")),
        myFile,
)
http.Post("http://example.com", "application/octet-stream", r)

// MultiWriter:
// The name is a bit confusing since it’s not the writer version of MultiReader. 
// MultiWriter returns a writer that duplicates each write to multiple writers.
// I use MultiWriter extensively in unit tests where I need to assert that a service is logging properly:
type MyService struct {
        LogOutput io.Writer
}
...
var buf bytes.Buffer
var s MyService
s.LogOutput = io.MultiWriter(&buf, os.Stderr)
// Using a MultiWriter allows me to verify the contents of buf while also seeing the full log output in my terminal for debugging.

// Optimizing string writes
// There are a lot of writers in the standard library that have a WriteString() method which can be used to improve write performance by not requiring an allocation when converting a string to a byte slice. You can take advantage of this optimization by using the io.WriteString() function.
// The function is simple. It first checks if the writer implements a WriteString() method and uses it if available. Otherwise it falls back to copying the string to a byte slice and using the Write() method.

// Slices can be passed to functions to be updated (e.g., to have items replaced), but here we need to append to the slice. The built-in append() function sometimes returns a reference to a new slice (if the original’s capacity is insufficient). The way we handle this here is to pass a pointer to a slice and set the contents that the pointer points to, to the slice returned by append(). (If we didn’t use a pointer we would simply get a local slice which would not be visible to the caller.) 

// ellipsis syntax ... 
// append is a variadic fc , accepts one or more items to append not a slice that's
// why slice[index:]... feeds the values
append(insertion, slice[index:]...)

// call MinimumInt1
func MinimumInt1(first int, rest ...int) int {...}

numbers := []int{7, 6, 2, -1, 7, -3, 9}
fmt.Println(MinimumInt1(numbers[0], numbers[1:]...))

// In general, Go variables hold values. That is, we can think of a variable as
// “being” the value it stores. The exceptions are variables that refer to channels,
// functions, methods, maps, and slices—these hold references—and variables
// that hold pointers.

// rune is Unicode code point

// time program timing function
func timeTrack(start time.Time, name string) {
    elapsed := time.Since(start)
    log.Printf("%s took %s", name, elapsed)
}

defer timeTrack(time.Now(), "main")

func factorial(n *big.Int) (result *big.Int) {
    defer timeTrack(time.Now(), "factorial")
    // ... do some things, maybe even return under some condition
    return n
}

// find nr of processors
func MaxParallelism() int {
    maxProcs := runtime.GOMAXPROCS(0)
    numCPU := runtime.NumCPU()
    if maxProcs < numCPU {
        return maxProcs
    }
    return numCPU
}

// The correct way to use Context's is to always cancel them when the the related operation — the request handler, in our case — completes. As a rule of thumb, any code that creates a new Context should ensure that it is canceled.
// Given the buggy snippet above, the actual code fix is simple:
func (s *Server) handleRequest(req *Request, conn *Connection) {
    // Create a context with a deadline an hour in the future.
    ctx, cancelCtx :=
        context.WithTimeout(context.Background(), 1*time.Hour)
    // Use defer in case of panics or returning early.
    defer cancelCtx()
    // ... The rest of the method is the same ...
    // Right after this method returns, cancelCtx() is called,
    // allowing ctx to be garbage collected.
}

// Multiple
// assignments make it easy to swap two values without the need for an explicit
// temporary variable—for example, 
a, b = b, a.

// cat si rest direct fara sa calc / si %
whole, fraction := math.Modf(x)

// When two or more consecutive named function parameters share a type, you can omit the type from all but the last.
func add(x, y int) int {
    return x + y
}

// if you want to search long slices, maps etc consider first sort than search
// there is a fc sort.Search to use in sorted 

// Example of maps:
cities := make([]string, 0, len(populationForCity))
for city := range populationForCity {
    cities = append(cities, city)
}
sort.Strings(cities)
for _, city := range cities {
    fmt.Printf("%-10s %8d\n", city, populationForCity[city])
}

// you can put one statement before a condition
if err := json.Unmarshal([]byte(input), &val); err != nil {
    panic(err)
}

// If we simply want to know whether a
// particular key is in the map—which is to put two variables on the left-hand side,
// the first to accept the value and the second to accept a bool indicating if the key
// was found
if usWord, found := usForBritish[word]; found {}

// Universal slice sorting is implemented via new sort.Slice
type Peak struct {
    Name      string
    Elevation int // in feet
}

peaks := []Peak{
    {"Aconcagua", 22838},
    {"Denali", 20322},
    {"Kilimanjaro", 19341},
    {"Mount Elbrus", 18510},
    {"Mount Everest", 29029},
    {"Mount Kosciuszko", 7310},
    {"Mount Vinson", 16050},
    {"Puncak Jaya", 16024},
}

// does an in-place sort on the peaks slice, with tallest peak first
sort.Slice(peaks, func(i, j int) bool {
    return peaks[i].Elevation >= peaks[j].Elevation
})
// This is possible because the Len() and Swap(i, j int) methods of the existing sort.Interface interface are identical for all slice types, and can be abstracted away. The Less(i, j int) method can’t be automatically inferred, and is the comparator function passed into sort.Slice.


// returns a string
s := fmt.Sprintf("ping %d", i)

// delete from a slice
slice = append(slice[:i], slice[i+1:]...)

// There's another, quicker way to delete, if you don't care about the
// elements' order. You can copy the last element to position i and then
// shrink the slice:

slice[i] = slice[len(slice)-1]

slice = slice[:len(slice)-1]

// Simple array
x := [5]float64{ 98, 93, 77, 82, 83 }

// Notice the extra trailing , after 83. This is required by Go and it allows us to easily 
// remove an element from the array by commenting out the line:
x := [4]float64{ 
    98, 
    93, 
    77, 
    82, 
    // 83,
}

// Or, you can have the compiler count the array elements for you:

b := [...]string{"Penn", "Teller"}

// for loop when you are not interested in the values from x
for range x {
    ...
}

// normal loop
for i := 0; i < len(x); i++ {}

// alternate loop
var a = [3]int{4,8,9,}

for i,value := range a {
	fmt.Println(i, value)
}


 //on an array, range returns the index
    a := [...]string{"a", "b", "c", "d"}
    for i := range a {
        fmt.Println("Array item", i, "is", a[i])
    }

    //on a map, range returns the key 
    capitals := map[string] string {"France":"Paris", "Italy":"Rome", "Japan":"Tokyo" }
    for key := range capitals {
        fmt.Println("Map item: Capital of", key, "is", capitals[key])
    }

    //range can also return two items, the index/key and the corresponding value 
    for key2, val := range capitals {
        fmt.Println("Map item: Capital of", key2, "is", val)
    }

// map Vertex not required(1" : Vertex{a: 20...) only "1" : {a: 20, b: 80},
    m := map[string]Vertex {
        "1" : Vertex{a: 20, b: 80},
        "2" : {10, 80},
    }    
    
// slice
letters := []string{"a", "b", "c", "d"}
x := make([]float64, 5)	

//10 represents the capacity of the underlying array which the slice points to:
x := make([]float64, 5, 10)

arr := [5]float64{1,2,3,4,5}
x := arr[0:5]

For convenience we are also allowed to omit low, high or even both low and high. arr[0:] is 
the same as arr[0:len(arr)], arr[:5] is the same as arr[0:5] and arr[:] is the same as 
arr[0:len(arr)].

// append two slices
    x1 := []int{1, 2} //make([]int, 3)
    x2 := []int{3, 4, 5}

    x3 := append(x1, x2...)

// variadic fc
// By using ... before the type name of the last parameter you can indicate that it takes 
//zero or more of those parameters. In this case we take zero or more ints. We invoke the 
//function like any other function except we can pass as many ints as we want

func add(args ...int) int {
    total := 0
    for _, v := range args {
        total += v
    }
    return total
}
func main() {
    fmt.Println(add(1,2,3))
}

// defer schedules a function call to be run after the function completes
f, _ := os.Open(filename)
defer f.Close()

// after panic defer(a amana, intarzia) activates and I recover
func main() {
    defer func() {    
        str := recover()
        fmt.Println(str)
    }()
    panic("PANIC")
}

// new takes a type as an argument, allocates enough memory to fit a value of that type and 
// returns a pointer to it.
func one(xPtr *int) {
    *xPtr = 1
}
func main() {
    xPtr := new(int)
    one(xPtr)
    fmt.Println(*xPtr) // x is 1
}

// anonimous struct
var aux struct {
    Date     Date
    CMeters  int64   `json:"cMeters"`
    Consumed int64   // json pkg auto "consumed"
    CPrice   float64 `json:"cPrice"`
    Total    float64 // auto "total" as json
}

// struct
type Circle struct {
    x, y, r float64
}

// initialization
var c Circle
c := new(Circle)
c := Circle{x: 0, y: 0, r: 5}
c := Circle{0, 0, 5}

//-- Methods for structs
func (c *Circle) area() float64 {
    return math.Pi * c.r*c.r
}

func (c *Circle) myMethod(x float64) float64 {
    return c.x * x
}

//-- no need for &, Go automatically knows to pass a pointer to the circle for this method
fmt.Println(c.area())

//-- embedded types
type Person struct {
    Name string
}
func (p *Person) Talk() {
    fmt.Println("Hi, my name is", p.Name)
}

type Android struct {
    Person
    Model string
}
func (a *Android) Identify() {
    fmt.Println("This is", a.Name, " android.And I am model no.", a.Model)
}

func main() {
    p := Person{"Jack Reaper"}
    p.Talk()
    a := Android{ Model:"HK40"}
    a.Name = "Kelanved"
    a.Talk()
    a.Identify()
} 
//--

//-- interfaces for structs
type Circle struct {...}
type Rectangle struct {...}
// circle rectangle have area() function
func (c *Circle) area() float64 {
    return math.Pi * c.r*c.r
}

type Shape interface {
    area() float64
}

func totalArea(shapes ...Shape) float64 {
    var area float64

    for _, s := range shapes {
        area  += s.area()
    }
    return area
}

func main() {
    c1 := Circle{10, 20, 30}
    c2 := Circle{10, 20, 30}

    fmt.Println(totalArea(&c1, &c2))
}
//--
// Interfaces can also be used as fields:

type MultiShape struct {
    shapes []Shape
}

// We can even turn MultiShape itself into a Shape by giving it an area method:

func (m *MultiShape) area() float64 {
    var area float64
    for _, s := range m.shapes {
        area += s.area()
    }
    return area
}

//-- example of chanel direction

func pinger(c chan<- string) {
    for i := 0; ; i++ {
        c <- fmt.Sprintf("ping %d", i)
    }
}

func ponger(c chan<- string) {
    // error <-c (receive from send-only type chan<- string)
    //s := <- c
    for i:=0; ; i++ {
        c <- "pong"
    }
}


func printer(c <-chan string) {
    for {
        // error c <- "lala" (send to receive-only type <-chan string)
        //c <- "lala"
        msg := <- c
        fmt.Println(msg)
        time.Sleep(time.Second * 1)
    }
}

func main() {
    var c chan string = make(chan string)

    go pinger(c)
    go ponger(c)
    go printer(c)

    var input string
    fmt.Scanln(&input)

}
//--

// package alias
import m "golang-book/chapter11/math"

// current dir
dir, err := filepath.Abs(filepath.Dir(os.Args[0]))

// Read a file from relative path
import (
    "fmt"
    "path/filepath"
    "io/ioutil"
)

func main() {

    testFile, _ := filepath.Abs("files/test.txt")
    fmt.Println(testFile)

    bs, err := ioutil.ReadFile(testFile)
    if err != nil {
        return
    }
    // convert []int to string
    str := string(bs)
    fmt.Println(str)
}

// examples of handling r.Body request body
func saveGas(w http.ResponseWriter, r *http.Request) {
    if r.Method != "POST" {
        w.Write([]byte("Not POST method"))
        w.WriteHeader(http.StatusBadRequest)
    }

    // read request body
    v1, err := ioutil.ReadAll(r.Body); check(err)
    // func Copy(dst Writer, src Reader), Reader into Writer
    io.Copy(w,r.Body)

    var v []Person
    if err := json.NewDecoder(r.Body).Decode(&v); err != nil { panic(err) }
    fmt.Println(v)

    // write to file r.Body
    f, err := os.Create("web/gasApplication/data/data.json"); check(err)
    defer f.Close();
    io.Copy(f, r.Body)
}

    
// How to efficiently concatenate strings in Go

package main

import (
    "bytes"
    "fmt"
)

func main() {
    var buffer bytes.Buffer

    for i := 0; i < 1000; i++ {
        buffer.WriteString("a")
    }

    fmt.Println(buffer.String())
}

// If you write buffer to file close the file if it's open and open it again to see changes or find a way to refresh it(double click filename icon intellij)

// func Copy(dst Writer, src Reader),copies Reader into Writer
    io.Copy(w,r.Body)

// open file for read/write with append
file, err := os.OpenFile("test1.txt", os.O_RDWR|os.O_APPEND, 0664)
//open file if it does not exists create it
file, err := os.OpenFile("test1.txt", os.O_RDWR|os.O_APPEND|os.O_CREATE, 0664)

// directory contents
   dir, err := os.Open(".")
    if err != nil {
        return
    }
    defer dir.Close()

    fileInfos, err := dir.Readdir(-1)
    if err != nil {
        return
    }
    for _, fi := range fileInfos {
        fmt.Println(fi.Name())
    }

// directory and subdirectory listing
        filepath.Walk(".", func(path string, info os.FileInfo, err error) error{
            fmt.Println(path)
            return nil
        })

// read file binary into memory
package main

  import (
      "os"
      "bufio"
  )

  func main() {

      file, err := os.Open("binary.dat")

      if err != nil {
          fmt.Println(err)
          return
      }

      defer file.Close()

      info, err := file.Stat()
       if err != nil {
         return nil, err
        }

      // calculate the bytes size
      var size int64 = info.Size()
      bytes := make([]byte, size)

      // read into buffer
      buffer := bufio.NewReader(file)
      _,err = buffer.Read(bytes)
 }

// closure
func main() {
    x := 0
    increment := func() int {
        x++
        return x
    }
    fmt.Println(increment())
    fmt.Println(increment())    
}
// increment adds 1 to the variable x which is defined in the main function's scope. 
// This x variable can be accessed and modified by the increment function. This is why 
// e first time we call increment we see 1 displayed, but the second time we call it we 
// see 2 displayed.

// A function like this together with the non-local variables it references is 
// known as a closure. In this case increment and the variable x form the closure.


// find variable type at runtime
reflect.TypeOf(l)

// find varible type at compile time
%T  a Go-syntax representation of the type of the value

// printing
%v  the value in a default format.
%T  a Go-syntax representation of the type of the value
%t  the word true or false

// package alias
import m "golang-book/chapter11/math"


// You may have noticed that every function in the packages we've seen start with a 
// capital letter. In Go if something starts with a capital letter that means other 
// packages (and programs) are able to see it. If we had named the function average 
// instead of Average our main program would not have been able to see it.

// It's a good practice to only expose the parts of our package that we want other 
// packages using and hide everything else. This allows us to freely change those 
// parts later without having to worry about breaking other programs, and it makes 
// our package easier to use.

// Package names match the folders they fall in. There are ways around this, but 
// it's a lot easier if you stay within this pattern.

// godoc on http server
// If you run go install in the math folder, then re-run the godoc command you should 
// see our comment below the function definition. This documentation is also available 
// in web form by running this command:

godoc -http=":6060"
and entering this URL into your browser:

http://localhost:6060/pkg/

// func literal, function literal
func(s string) {
        fmt.Println(s)
    }("Mayakasha")

// function type
type Fuc func(string) int

func f1(f Fuc, s string ) {
    fmt.Println(f(s))
}

f1(func(s string) int {return len(s)}, "lala")

// named results
func split(sum int) (x, y int) {
    x = sum * 4 / 9
    y = sum - x
    return
}

// golang while
    for sum < 1000 {
        sum += sum
    }
    fmt.Println(sum)

// slices
//As mentioned earlier, re-slicing a slice doesn't make a copy of the underlying array.
// The full array will be kept in memory until it is no longer referenced. Occasionally 
// is can cause the program to hold all the data in memory when only a small piece of it
// is needed.
//For example, this FindDigits function loads a file into memory and searches it for 
// the first group of consecutive numeric digits, returning them as a new slice.

var digitRegexp = regexp.MustCompile("[0-9]+")

func FindDigits(filename string) []byte {
    b, _ := ioutil.ReadFile(filename)
    return digitRegexp.Find(b)
}

//This code behaves as advertised, but the returned []byte points into an 
// array containing the entire file. Since the slice references the original 
// array, as long as the slice is kept around the garbage collector can't release 
// the array; the few useful bytes of the file keep the entire contents in memory.

//To fix this problem one can copy the interesting data to a new slice before 
// returning it:

func CopyDigits(filename string) []byte {
    b, _ := ioutil.ReadFile(filename)
    b = digitRegexp.Find(b)
    c := make([]byte, len(b))
    copy(c, b)
    return c
}

// Alternative to generics, only for simple stuff not efficient
// The function returns a value of type interface{} which we convert to the built-in
// type we expect using an unchecked type assertion

i := Minimum(4, 3, 8, 2, 9).(int)
fmt.Printf("%T %v\n", i, i)
f := Minimum(9.4, -5.4, 3.8, 17.0, -3.1, 0.0).(float64)
fmt.Printf("%T %v\n", f, f)
s := Minimum("K", "X", "B", "C","CC", "CA", "D", "M").(string)
fmt.Printf("%T %q\n", s, s)

func Minimum(first interface{}, rest ...interface{}) interface{} {
    minimum := first
    for _, x := range rest {
        switch x := x.(type) {
        case int:
            if x < minimum.(int) {
                minimum = x
            }
        case float64:
            if x < minimum.(float64) {
                minimum = x
            }
        case string:
            if x < minimum.(string) {
                minimum = x
            }
        }
    }
    return minimum
}

// use of .(type) in switch, works only in switch

switch v := i.(type) { // or switch i.(type) {
case int:
    fmt.Println("twice i is", v*2)
case float64:
    fmt.Println("the reciprocal of i is", 1/v)
case string:
    h := len(v) / 2
    fmt.Println("i swapped by halves is", v[h:]+v[:h])
default:
    fmt.Println("i isn't one of the types above")
}

// case fallthrough continue to next case
case ".tar":
    fallthrough
case ".tar.gz":
    fallthrough
case ".tgz":
    return TarFileList(file)  

// The Suffix() function returns a string. And
// instead of using fallthrough statements for tar files, we have used a comma separated
// list of all the matching suffixes as that case clause’s expression list.
switch Suffix(file) { // Canonical ✓
    case ".gz":
        return GzipFileList(file)
    case ".tar", ".tar.gz", ".tgz":
        return TarFileList(file)
    case ".zip":
        return ZipFileList(file)
}  

// Variadic function(accepts variable number of input)
func sum(nums ...int) (total int) {
    total = 20
    fmt.Println(nums)
    for _, num := range nums {
        total += num
    }

    return
}

func main() {
    nums := []int{1, 2, 3, 4}
    fmt.Println(sum(nums...))
}

// check type at runtime
reflect.TypeOf(l)

// Create new struct A asign values
// Convert interface{} to string or int etc with type assertion
A {
    Data:  a["data"].(string),
    Price: a["price"].(float64),
    Tf:    a["tf"].(bool),
}

// other type assertion example
// convert interface{} to myType
var x interface{} = myType{"names", 30}
fmt.Printf("name:%v age:%v", x.(myType).name, x.(myType).age)

mt := x.(myType)
fmt.Printf("name:%v age:%v\n", mt.name, mt.age)

//
s, ok := i.(string)

// find the position of an element in a slice with a custom function, pointer not necessary
func SliceIndex(sl *[]int, myF func (nr int) bool) int {

    fmt.Println(len(*sl))
    for i, v := range *sl {
        if myF(v) {
            return i
        }
    }

    return -1
}

// collection functions

// Returns the first index of the target string t, or -1 if no match is found.
func Index(vs []string, t string) int {
    for i, v := range vs {
        if v == t {
            return i
        }
    }
    return -1
}

// Returns true if the target string t is in the slice.
func Include(vs []string, t string) bool {
    return Index(vs, t) >= 0
}

// Returns true if one of the strings in the slice satisfies the predicate f.
func Any(vs []string, f func(string) bool) bool {
    for _, v := range vs {
        if f(v) {
            return true
        }
    }
    return false
}

// Returns true if all of the strings in the slice satisfy the predicate f.
func All(vs []string, f func(string) bool) bool {
    for _, v := range vs {
        if !f(v) {
            return false
        }
    }
    return true
}

// Returns a new slice containing all strings in the slice that satisfy the predicate f.
func Filter(vs []string, f func(string) bool) []string {
    vsf := make([]string, 0)
    for _, v := range vs {
        if f(v) {
            vsf = append(vsf, v)
        }
    }
    return vsf
}

// Returns a new slice containing the results of applying the function f to each string in the original slice.
func Map(vs []string, f func(string) string) []string {
    vsm := make([]string, len(vs))
    for i, v := range vs {
        vsm[i] = f(v)
    }
    return vsm
}

// test collection functions
 var strs = []string{"peach", "apple", "pear", "plum"}
    fmt.Println(Index(strs, "pear"))
    fmt.Println(Include(strs, "grape"))
    fmt.Println(Any(strs, func(v string) bool {
        return strings.HasPrefix(v, "p")
    }))
    fmt.Println(All(strs, func(v string) bool {
        return strings.HasPrefix(v, "p")
    }))
    fmt.Println(Filter(strs, func(v string) bool {
        return strings.Contains(v, "e")
    }))
    fmt.Println(Map(strs, strings.ToUpper))
//---------------

// Note that in the last line we create another type, called Todos, which is a slice (an ordered collection) of Todo
type Todos []Todo

// main file location
os.Args[0]

// instead of new you can use composite literals
// Sometimes the zero value isn't good enough and an initializing constructor is necessary, as in this example derived from package os.
func NewFile(fd int, name string) *File {
    if fd < 0 {
        return nil
    }
    f := new(File)
    f.fd = fd
    f.name = name
    f.dirinfo = nil
    f.nepipe = 0
    return f
}
// There's a lot of boiler plate in there. We can simplify it using a composite literal, which is an expression that creates a new instance each time it is evaluated.
func NewFile(fd int, name string) *File {
    if fd < 0 {
        return nil
    }
    f := File{fd, name, nil, 0}
    return &f
}
// Note that, unlike in C, it's perfectly OK to return the address of a local variable; the storage associated with the variable survives after the function returns. In fact, taking the address of a composite literal allocates a fresh instance each time it is evaluated, so we can combine these last two lines.
return &File{fd, name, nil, 0}

// ---------------------
// I have a type function to wich I add a method to support the interface.
type appHandler func(int, string) error

type interfaceJaja interface {
    serveMe(int, string)
}

func (aHandler appHandler) serveMe(nr int, namus string) {
    switch {
    case nr == 4:
        fmt.Println("Err: 4444")
        return
    case namus == "":
        fmt.Println("Namus is empty")
        return
    }

    if err := aHandler(nr, namus); err != nil {
        fmt.Println("aHandler issued an error")
    }
}

func main() {
    var myAppHandler appHandler = func(nr int, name string) error {
        if nr == 0 || name == "" {
            return errors.New("This is bad")
        }

        return nil
    }

    myAppHandler.serveMe(0, "Naumus")

}

// Go uses UTF-8 encoded characters in its strings. Each character is of type rune. This is a alias for int32 as a Unicode character can be 1, 2 or 4 bytes in UTF-8 encoding. In terms of characters, a string is an array of runes.

// A string is also an array of bytes, but you have to be careful: only for the ASCII subset is a byte equal to a character. All other characters occupy two, three or four bytes. This means that the length of a string in characters (runes) is generally not the same as the length of its byte array. They are only equal when the string consists of ASCII characters only.

const nihongo = "日本語"
for i, w := 0, 0; i < len(nihongo); i += w {
    runeValue, width := utf8.DecodeRuneInString(nihongo[i:])
    fmt.Printf("%#U starts at byte position %d\n", runeValue, i)
    w = width
}
    
U+65E5 '日' starts at byte position 0
U+672C '本' starts at byte position 3
U+8A9E '語' starts at byte position 6

// search in string get index
file = strings.ToLower(filepath.Base(file))
strings.LastIndex(file, ".");


func Suffix(file string) string {
    file = strings.ToLower(filepath.Base(file))
    
    if i := strings.LastIndex(file, "."); i > -1 {
       if file[i:] == ".bz2" || file[i:] == ".gz" || file[i:] == ".xz" {
            // interersting if
            if j := strings.LastIndex(file[:i], ".");
                j > -1 && strings.HasPrefix(file[j:], ".tar") {
                return file[j:]
            }
        }
        return file[i:]
    }

    return file
}

// Labels can be applied to for loops, switch statements, and select statements.
// Both break and continue statements can specify labels and can be used inside
// for loops. It is also possible to use break statements—either bare or specifying
// a label—inside switch and select statements
found := false
FOUND:
for row := range table {
    for column := range table[row] {
        if table[row][column] == x {
            found = true
            break FOUND
        }
    }
}

f1For1:
    for i := 0; i < 36; i++ {
        var x int
        select {
        case <-channels[0]:
            x = 1
        case <-channels[1]:
            x = 2
        case <-channels[2]:
            x = 3
            break f1For1
        }
    }

// If no buffer capacity is specified the channel is synchronous, so it will block until
// the sender is ready to send and the receiver is ready to receive. If a capacity is
// given the channel is asynchronous and communication will progress without
// blocking so long as there is unused capacity for sends and there is data in the
// channel to be received.

// convert panic to error. ConvertInt64ToInt(x) may panic
func IntFromInt64(x int64) (i int, err error) {
    defer func() {
        if e := recover(); e != nil {
            err = fmt.Errorf("%v", e)
        }
    }()
i = ConvertInt64ToInt(x)
return i, nil
}

// for a large web site with lots of page handlers, adding a deferred
// function to catch and log panics involves a lot of code duplication and is easy
// to forget. This can be solved by creating a wrapper function that has the code
// needed by each page handler. Using the wrapper we can omit the recover code
// from the page handlers, so long as we change the http.HandleFunc() calls.

http.HandleFunc("/", logPanics(homePage))

func logPanics(function func(http.ResponseWriter,
    *http.Request)) func(http.ResponseWriter, *http.Request) {
    return func(writer http.ResponseWriter, request *http.Request) {
        defer func() {
            if x := recover(); x != nil {
                log.Printf("[%v] caught panic: %v", request.RemoteAddr, x)
            }
        }()
        function(writer, request)
    }
}

// anonymous functions(i.e. closures)
addPng := func(name string) string { return name + ".png" }
addJpg := func(name string) string { return name + ".jpg" }
fmt.Println(addPng("filename"), addJpg("filename"))

// factory function, fc that returns a function
func MakeAddSuffix(suffix string) func(string) string {
    return func(name string) string {
        if !strings.HasSuffix(name, suffix) {
            return name + suffix
        }
        return name
    }
}
addZip := MakeAddSuffix(".zip")
addTgz := MakeAddSuffix(".tar.gz")
fmt.Println(addTgz("filename"), addZip("filename"), addZip("gobook.zip"))

// This version of the function makes use of a map whose keys are strings (file
// suffixes), and whose values are functions with the signature func(string)
// ([]string, error). (All of the custom functions, GzipFileList(), TarFileList(),
// and ZipFileList(), are of this type.)

// The function uses the [] index operator to retrieve the function that matches the
// given suffix and to set ok to true; or to return nil and false if the suffix isn’t a
// map key. If there is a matching function the function is called with the filename,
// and its results returned.

// This function is more scalable than using an if or switch statement since no
// matter how many file suffix–function items we add to the FunctionForSuffix
// map, the function remains unchanged. And unlike a big if or switch statement,
// map lookup speeds don’t really degrade as the number of items increases.★ In
// addition, using a map in this way can make things clearer and also makes it
// possible to add new items to the map dynamically.

var FunctionForSuffix = map[string]func(string) ([]string, error){
    ".gz": GzipFileList, ".tar": TarFileList, ".tar.gz": TarFileList,
    ".tgz": TarFileList, ".zip": ZipFileList}

func ArchiveFileListMap(file string) ([]string, error) {
    if function, ok := FunctionForSuffix[Suffix(file)]; ok {
        return function(file)
    }
    return nil, errors.New("unrecognized archive")
}

//We have made the choice of IsPalindrome() implementation dependent on a
// command-line argument. If the argument is given, we strip it out of the os.Args
// slice (so the rest of the program doesn’t have to know or care about it),and create
// a 7-bit ASCII version of the IsPalindrome() function. The stripping out is slightly
// subtle since we want os.Args to have its first string and its third and subsequent
// strings but not its second string (which is "-a" or "--ascii"). We can’t use
// os.Args[0] in the append() call because the first argument must be a slice, so we
// use os.Args[:1] which is a one-item slice containing os.Args[0] (§4.2.1, 153 ➤). If
// the ASCII argument isn’t present, we create the same version as we saw earlier
// that works correctly on both 7-bit ASCII and UTF-8 Unicode strings. In the rest
// of the program the IsPalindrome() function can be called normally, but the actual
// code that gets executed will vary depending on which version was created. (The
// source code for this example is in palindrome/palindrome.go.)
 os.Args = append(os.Args[:1], os.Args[2:]...) // Strip out second arg os.Args[1]


// higher order functions
//  A higher order function is a function that takes one or more other functions as
// arguments and uses them in its own body.
// This is a generic function that returns the index position of an item in a slice for
// which the predicate() function returns true.

// The SliceIndex() function doesn’t know or care about the slice’s or the item’s
// types—indeed, the function knows nothing of the slice or the item it (indirectly)
// operates on. The function expects its first argument to be the length of the
// slice and the second argument to be a function that returns a Boolean for any
// given index position in the slice indicating whether the desired item is at that
// position.

func SliceIndex(limit int, predicate func(i int) bool) int {
    for i := 0; i < limit; i++ {
        if predicate(i) {
            return i
        }
    }
    return -1
}


// Filtering a slice is quite a common requirement so it is a pity that the IntFilter() function can only operate on []ints. Fortunately, it is perfectly possible to create a generic filter function using the same techniques as we used for the SliceIndex() function.
func Filter(limit int, predicate func(int) bool, appender func(int)) {
    for i := 0; i < limit; i++ {
        if predicate(i) {
            appender(i)
        }
    }
}
// Just like the SliceIndex() function, the Filter() function knows nothing about
// what it operates on beyond the given limit. The Filter() function relies on
// the predicate() and appender() functions it is passed to do the filtering and
// appending.
readings := []int{4, -3, 2, -7, 8, 19, -11, 7, 18, -6}
// if you know the max length of slice specify the capacity or else it will continue to crete a new array with double the cap when len > cap
even := make([]int, 0, len(readings))

predicate := func(i int) bool {
    return readings[i]%2 == 0
}
appender := func(i int) {
    even = append(even, readings[i])
}

Filter(len(readings), predicate, appender)
fmt.Printf("Print even: %v \n", even)

// --
// Slices can be passed to functions to be updated (e.g., to have items replaced), but here we need to append to the slice. The built-in append() function sometimes returns a reference to a new slice (if the original’s capacity is insufficient). The way we handle this here is to pass a pointer to a slice and set the contents that the pointer points to, to the slice returned by append(). (If we didn’t use a pointer we would simply get a local slice which would not be visible to the caller.) An alternative approach is to pass in the slice value, and return the appended slice which must then be assigned to the original slice (e.g., slice = function(slice)); however, this can be tricky to get right with recursive functions.


The sort.Interface interface defined in the sort package specifies three methods,
Len(), Less(), and Swap(), with the same signatures as the Entries methods of the
same names. This means that we can trivially sort an Entries value using the
standard library’s sort.Sort() function.

type Entry struct {
    key      string
    value    string
    children Entries
}
type Entries []Entry

func (entries Entries) Len() int { return len(entries) }
func (entries Entries) Less(i, j int) bool {
    return entries[i].key < entries[j].key
}
// swap without 3rd value, direct swap
func (entries Entries) Swap(i, j int) {
    entries[i], entries[j] = entries[j], entries[i]
}

// Not only are custom types based on built-in types easy to create, they are also
// very efficient to use. Converting to or from a built-in type has no runtime cost
// since the conversion is effectively done at compile time. In view of this it is entirely
// practical to “promote” values of built-in types to a custom type to use the
// custom type’s methods, and to “demote” such values to the underlying built-in
// type when we want to pass them to functions whose parameters are of built-in
// types. We saw an example of promotion earlier when we converted a []string to
// a FoldedStrings (162 ➤), and we will see an example of demotion when we first
// look at the Count type later in this chapter (➤ 259).

// Types like Count, StringMap, and FloatChan that are based directly on a built-in
// type can be used in the same way as the built-in type—for example, we can use
// the built-in append() function on a custom type StringSlice []string type—but
// we must convert them (at no cost because it is done at compile time) to the underlying
// built-in type if we need to pass them to a function that expects their underlying
// type. And sometimes we need to do the reverse and promote the value
// of a built-in type to a custom type to benefit from the custom type’s methods. We
// saw an example of this when we converted a []string to a FoldedStrings value in
// the SortFoldedStrings() function (162 ➤).

A type’s method set is the set of all the methods that can be called on a value of
the type.

If we have a pointer to a value of a custom type, its method set consists of all the
methods defined for the type—whether they accept a value or a pointer. If we
call a method that takes a value, on a pointer,Go is smart enough to dereference
the pointer and pass the underlying value as the method’s receiver.

If we have a value of a custom type, its method set consists of all those methods
defined for the type that accept a value receiver—but not those methods that
accept a pointer receiver. This isn’t as limiting as it sounds, since if we have
a value we can still call a method that has a pointer receiver and rely on Go
to pass the value’s address—providing the value is addressable (i.e., it is a
variable, a dereferenced pointer, an array or slice item, or an addressable field
in a struct). So, given the call value.Method() where Method() requires a pointer
and value is an addressable value, Go will treat the code as if we had written
(&value).Method().

Defining methods that accept value receivers works well for types that are
small, such as numbers. Such methods cannot modify the value they are called
on since they get a copy of the value as their receiver. If we have values of large
types or values we want to modify we need to use methods that accept pointer
receivers. This makes method calls as cheap as possible (since the receiver is
passed as a 32- or 64-bit pointer, no matter how large the value the method is
called on is).


//-- method expression
Just as we can assign and pass functions, we can also assign and pass method
expressions. A method expression is a function that must be passed a value of
the method’s type as its first argument. (The term unbound method is often used
in other languages for this concept.)

asStringV := Part.String // Effective signature: func(Part) string
sv := asStringV(part)
hasPrefix := Part.HasPrefix // Effective signature: func(Part, string) bool
asStringP := (*Part).String // Effective signature: func(*Part) string
sp := asStringP(&part)
lower := (*Part).LowerCase // Effective signature: func(*Part)
lower(&part)
fmt.Println(sv, sp, hasPrefix(part, "w"), part)

«16 "WRENCH"» «16 "WRENCH"» true «16 "wrench"»


// It is a Go convention to call construction functions New(), or if there is more than one, for their names to begin with “New”.

// The Exchanger interface specifies a single method, Exchange(), which takes no arguments and returns nothing. We have followed the Go convention for interface names, which is that they should end with er. It is quite common to have interfaces with only one method—for example, the standard library’s io.Reader and io.Writer interfaces each specify a single method. Notice that an interface is really specifying an API(Application Programming Interface),that is, zero or more methods—although it says nothing about what those methods actually do.

// The snippet’s points variable is a slice of arrays of type [2]int a better way is anonymous structs
points := [][2]int{{4, 6}, {}, {-7, 11}, {15, 17}, {14, -8}}
for _, point := range points {
fmt.Printf("(%d, %d) ", point[0], point[1])
}
// anonymous struct
// Here, the snippet’s points variable is a slice of struct{ x, y int}s. Although the
// struct itself is unnamed, we can access its data via its named fields which is
// easier and safer than using array indexes.
points := []struct{ x, y int }{{4, 6}, {}, {-7, 11}, {15, 17}, {14, -8}}
for _, point := range points {
fmt.Printf("(%d, %d) ", point.x, point.y)
}


// Usually an embedded field’s fields can be accessed directly using the . (dot)
// selector operator without mentioning the type name, but if the containing
// struct has a named field whose name is the same as one of the embedded struct’s
// fields, then we must use the embedded struct’s type name to disambiguate.

// To embed an anonymous field we use the name of the type (or interface, as we
// will see later) that we want to embed, without specifying a variable name for
// it. We can access such a field’s own fields directly (i.e., without specifying the
// type or interface’s name), or using the type or interface’s name if we need to
// disambiguate from another name in the containing struct.

type Author2 struct {
    Person            // Anonymous field (embedding)
    Title    []string // Named field (aggregation)
    YearBorn int      // Named field (aggregation)
}

// The Author2 struct shown here embeds a Person struct as an anonymous field.
// This means that we can access the Person fields directly (except when we need to
// disambiguate).

author2.Title = []string{"The Picture of Dorian Gray"}
author2.Person.Title = "" // Must use the type name to disambiguate
author2.Forenames = []string{"Oscar", "Fingal", "O'Flahertie", "Wills"}
author2.Surname = "Wilde" // Same as: author2.Person.Surname = "Wilde"

// Embedding Anonymous Values That Have Methods
// If an embedded field has methodswe can call them on the containing struct, and
// only the embedded field will be passed as the methods’ receiver.
type Tasks struct {
    slice []string // Named field (aggregation)
    Count          // Anonymous field (embedding)
}

func (tasks *Tasks) Add(task string) {
    tasks.slice = append(tasks.slice, task)
    tasks.Increment() // As if we had written: tasks.Count.Increment()
}
func (tasks *Tasks) Tally() int {
    return int(tasks.Count)
}

tasks := Tasks{}
fmt.Println(tasks.IsZero(), tasks.Tally(), tasks)
tasks.Add("One")
tasks.Add("Two")
fmt.Println(tasks.IsZero(), tasks.Tally(), tasks)

// It is important to remember that when an embedded field’s method is called on
// a value that contains that field, it is only the embedded field that gets passed as
// the method’s receiver. So when Tasks.IsZero(), Tasks.Increment(), or any other
// Count method is called on a Tasks value, these methods receive a Count (or *Count
// value), not the Tasks value.
// In this example the Tasks type has its own methods (Add() and Tally()), and also
// the embedded Count type’s methods (Increment(), Decrement(), and IsZero()).It
// is, of course, possible for the Tasks type to override any or all of the Count type’s
// methods simply by implementing its own methods of the same names


// In addition to aggregating and embedding concrete types in structs, it is also
// possible to aggregate and embed interfaces. (Naturally, the converse—aggregating
// or embedding a struct in an interface—isn’t possible, because an interface
// is a wholly abstract type, so such aggregating or embedding would not make
// sense.) When a struct includes an aggregated (named) or embedded (anonymous)
// field of an interface type, it means that the struct can store in that field
// any value that satisfies the interface’s specification.


// The Optioner interface specifies the generic methods that all our option types
// must provide. The OptionCommon struct has the two fields that are common
// to every option. Go allows us to annotate struct fields with strings (called
// tags in Go terminology). These tags have no functional purpose, but—unlike
// comments—they are accessible using Go’s reflection support (§9.4.9, ➤ 427).
// Some programmers use the tags to specify field validation—for example, with
// tags like "check:len(2,30)" for a string, or "check:range(0,500)" for a number,
// and with whatever semantics the programmer creates.

type OptionCommon struct {
    ShortName string "short option name"
    LongName  string "long option name"
}

type Optioner interface {
    Name() string
    IsValid() bool
}

type IntOption struct {
    OptionCommon        // Anonymous field (embedding)
    Value, Min, Max int // Named fields (aggregation)
}

func (option IntOption) Name() string {
    return name(option.ShortName, option.LongName)
}
func (option IntOption) IsValid() bool {

    return option.Min <= option.Value && option.Value <= option.Max
}
func name(shortName, longName string) string {
    if longName == "" {
        return shortName
    }
    return longName
}
// This is the complete implementation of the custom IntOption type plus the supporting
// unexported name() function. Since the OptionCommon struct is embedded
// we can access its fields directly—as we do in the IntOption.Name() method. The
// IntOption satisfies the Optioner interface (since it provides the Name() and Is-
// Valid() methods with the correct signatures).
// Although the processing done by the name() function is very simple we have chosen
// to use a separate function rather than implement it in the IntOption.Name()
// method. This makes the IntOption.Name() method very short and means that we
// can reuse the functionality in other custom options. So, for example, the GenericOption.
// Name() and StringOption.Name() methods’ bodies are identical to the
// IntOption.Name() method’s single statement body, with all three relying on the
// name() function to do the actual work. This is a common pattern in Go, and we
// will see it again in the chapter’s last section.


// This is the complete implementation of the FloatOption. The embedded Optioner
// field means that when we create FloatOption values we must assign to the
// embedded field any value that satisfies the Optioner interface.
type FloatOption struct {
    Optioner         // Anonymous field (interface embedding: needs concrete type)
    Value    float64 // Named field (aggregation)
}


// The other common mistake was for linux developers to assume you can delete/move a file while it’s open. This doesn’t work on Windows, because Windows locks the file when it’s open. This often came in the form of a defer file.Delete() call, which would get FIFO’d before the deferred file.Close() call, and thus would try to delete the file while it was still open. Oops. One fix is to just always call file.Close() before doing a move or delete. Note that you can call Close multiple times on a file, so this is safe to do even if you also have a defer file.Close() that’ll fire at the end of the function.

// reverse slice
    for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
        s[i], s[j] = s[j], s[i]
    }


// Here we import the image/gif, image/jpeg, and image/png packages purely to
// execute their init() functions (which registers their image format with the image
// package).Each of these packages is aliased to the blank identifier, so Go will not
// complain about us not making explicit use of any of them in our code.
import (
"fmt"
"image"
"os"
"path/filepath"
"runtime"
_ "image/gif"
_ "image/jpeg"
_ "image/png"
)

// Trick 1. Test fixtures
// This trick is used in the standard library. I learned it from Mitchell Hashimoto’s and Dave Cheney’s work. go test has good support for loading test data from files. Firstly, go build ignores directory named testdata. Secondly, when go test runs, it sets current directory as package directory. This allows you to use relative path testdata directory as a place to load and store your data. Here is an example:
func helperLoadBytes(t *testing.T, name string) []byte {
  path := filepath.Join("testdata", name) // relative path
  bytes, err := ioutil.ReadFile(path)
  if err != nil {
    t.Fatal(err)
  }
  return bytes
}

// Trick 2. Golden files
// This trick is also used in the standard library, but I learned it from Mitchell Hashimoto’s talk. The idea here is to save expected output as a file named .golden and provide a flag for updating it. Here is an example:

var update = flag.Bool("update", false, "update .golden files")
func TestSomething(t *testing.T) {
  actual := doSomething()
  golden := filepath.Join(“testdata”, tc.Name+”.golden”)
  if *update {
    ioutil.WriteFile(golden, actual, 0644)
  }
  expected, _ := ioutil.ReadFile(golden)
 
  if !bytes.Equal(actual, expected) {
    // FAIL!
  }
}

























