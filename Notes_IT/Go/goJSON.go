// Remember struct must have fields with upper case to be exported
// Specify json tag or else your json is with upper case first letter ex: Name instead of name
// json tag not necessary for simple fields like Name, Age IF you use json.NewDecoder
    type person struct {
        Name string `json:"name"`
        Age  int    `json:"age"`
    }

// Field is ignored by this package.
Field int `json:"-"`

// Field appears in JSON as key "myName".
Field int `json:"myName"`

// Field appears in JSON as key "myName" and
// the field is omitted from the object if its value is empty,
// as defined above.
Field int `json:"myName,omitempty"`

// Field appears in JSON as key "Field" (the default), but
// the field is skipped if empty.
// Note the leading comma.
Field int `json:",omitempty"`

// Field is in json "field": "123" not "field": 123
// takes the string and converts it to int
Field int `json:"field,string"`

//------------------------ex go by ex-----------------------------
// We'll use these two structs to demonstrate encoding and
// decoding of custom types below.
type Response1 struct {
    Page   int
    Fruits []string
}
type Response2 struct {
    Page   int      `json:"page"`
    Fruits []string `json:"fruits"`
}

func main() {

    // First we'll look at encoding basic data types to
    // JSON strings. Here are some examples for atomic
    // values.
    bolB, _ := json.Marshal(true)
    fmt.Println(string(bolB))

    intB, _ := json.Marshal(1)
    fmt.Println(string(intB))

    fltB, _ := json.Marshal(2.34)
    fmt.Println(string(fltB))

    strB, _ := json.Marshal("gopher")
    fmt.Println(string(strB))

    // And here are some for slices and maps, which encode
    // to JSON arrays and objects as you'd expect.
    slcD := []string{"apple", "peach", "pear"}
    slcB, _ := json.Marshal(slcD)
    fmt.Println(string(slcB))

    mapD := map[string]int{"apple": 5, "lettuce": 7}
    mapB, _ := json.Marshal(mapD)
    fmt.Println(string(mapB))

    // The JSON package can automatically encode your
    // custom data types. It will only include exported
    // fields in the encoded output and will by default
    // use those names as the JSON keys.
    res1D := &Response1{
        Page:   1,
        Fruits: []string{"apple", "peach", "pear"}}
    res1B, _ := json.Marshal(res1D)
    fmt.Println(string(res1B))

    // You can use tags on struct field declarations
    // to customize the encoded JSON key names. Check the
    // definition of `Response2` above to see an example
    // of such tags.
    res2D := &Response2{
        Page:   1,
        Fruits: []string{"apple", "peach", "pear"}}
    res2B, _ := json.Marshal(res2D)
    fmt.Println(string(res2B))

    // Now let's look at decoding JSON data into Go
    // values. Here's an example for a generic data
    // structure.
    byt := []byte(`{"num":6.13,"strs":["a","b"]}`)

    // We need to provide a variable where the JSON
    // package can put the decoded data. This
    // `map[string]interface{}` will hold a map of strings
    // to arbitrary data types.
    var dat map[string]interface{}

    // Here's the actual decoding, and a check for
    // associated errors.
    if err := json.Unmarshal(byt, &dat); err != nil {
        panic(err)
    }
    fmt.Println(dat)

    // In order to use the values in the decoded map,
    // we'll need to cast them to their appropriate type.
    // For example here we cast the value in `num` to
    // the expected `float64` type.
    num := dat["num"].(float64)
    fmt.Println(num)

    // Accessing nested data requires a series of
    // casts.
    strs := dat["strs"].([]interface{})
    str1 := strs[0].(string)
    fmt.Println(str1)

    // We can also decode JSON into custom data types.
    // This has the advantages of adding additional
    // type-safety to our programs and eliminating the
    // need for type assertions when accessing the decoded
    // data.
    str := `{"page": 1, "fruits": ["apple", "peach"]}`
    res := Response2{}
    json.Unmarshal([]byte(str), &res)
    fmt.Println(res)
    fmt.Println(res.Fruits[0])

    // In the examples above we always used bytes and
    // strings as intermediates between the data and
    // JSON representation on standard out. We can also
    // stream JSON encodings directly to `os.Writer`s like
    // `os.Stdout` or even HTTP response bodies.
    enc := json.NewEncoder(os.Stdout)
    d := map[string]int{"apple": 5, "lettuce": 7}
    enc.Encode(d)
}
//----------------------- ex go by ex --------------------------

// example access the nested map by casting to map[string]interface
	str = `{"name": "lala", "age": 8, "m1" : {"id": "id001", "pass": "krean"}}`
	var v1 map[string]interface {}
	if err := json.Unmarshal([]bnyte(str), &v1); err != nil { panic(err) }
	fmt.Println(v1["m1"].(map[string]interface {})["id"])

// same thing but to a struct
	var v []Person
	if err := json.NewDecoder(bufferedReader).Decode(&v); err != nil { panic(err) }
	fmt.Println(v[0].Name)

// get byte array from Reader buffer and json.Unmarshal
	bufferedReader := bufio.NewReader(file)
	stat,_ := file.Stat()
	p := make([]byte, stat.Size())
	bufferedReader.Read(p)
	var v1 []Person
	json.Unmarshal(p, &v1)
	fmt.Println(v1)

// decode json POST
func saveGas(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" {
		w.Write([]byte("Not POST method"))
		w.WriteHeader(http.StatusBadRequest)
	}

	var v []Person
	if err := json.NewDecoder(r.Body).Decode(&v); err != nil { panic(err) }
	fmt.Println(v)

}	

// Price in json is a string "price":"3460.00"
type Product struct {
    Name  string
    Price float64 `json:",string"`
}

func main() {
    s := `{"name":"Galaxy Nexus", "price":"3460.00"}`
    var pro Product
    err := json.Unmarshal([]byte(s), &pro)
    if err == nil {
        fmt.Printf("%+v\n", pro)
    } else {
        fmt.Println(err)
        fmt.Printf("%+v\n", pro)
    }
}

type Product struct {
    Name  string `json:"name"`
    Price float64 `json:"price,string"`
}

func main() {
    s := `{"name":"Galaxy Nexus","price":"3460.00"}`
    var pro Product

    // NewReader returns a new Reader reading from s.
    // It is similar to bytes.NewBufferString but more efficient and read-only.
    err := json.NewDecoder(strings.NewReader(s)).Decode(&pro)
    if err != nil {
        fmt.Println(err)
        return
    }
    fmt.Println(pro)
}


// does not work because ms := myStruct{"alpha"} it has to be ms := &myStruct{"alpha"}
// because myStruct method are defined for *myStruct pass by pointer receiver
type myStruct struct {
    Data string `json:"data"`
}

func (s *myStruct) MarshalJSON() ([]byte, error) {
    return []byte(`{"data":"charlie"}`), nil
}

func (s *myStruct) UnmarshalJSON(b []byte) error {
    // Insert the string directly into the Data member
    return json.Unmarshal(b, &s.Data)
}

func main() {
    // Create a struct with initial content "alpha"
    ms := myStruct{"alpha"}

    // Replace content with "bravo" using custom UnmarshalJSON() (SUCCESSFUL)
    if err := json.NewDecoder(bytes.NewBufferString(`"bravo"`)).Decode(&ms); err != nil {
        log.Fatal(err)
    }

    fmt.Printf("mt1 encoded: %v \n", buff.String())

    // Use custom MarshalJSON() to get "charlie" back (UNSUCCESSFUL)
    if err := json.NewEncoder(os.Stdout).Encode(ms); err != nil {
        log.Fatal(err)
    }

    // Trying another method (UNSUCCESSFUL)
    if ret, err := json.Marshal(ms); err != nil {
        log.Fatal(err)
    } else {
        fmt.Println(string(ret))
    }

    // Verify that the Marshaler interface is correctly implemented
    var marsh json.Marshaler
    marsh = &ms
    ret, _ := marsh.MarshalJSON()
    fmt.Println(string(ret)) // Prints "charlie"
}

// If you get errors of type similar :
// json: error calling MarshalJSON for type *main.Date: invalid character '-' after top-level value
// It's because d.Format has wrong JSON string for ex: "2006-01-02T15:04:05.000Z" instead of `"2006-01-02T15:04:05.000Z"`
func (d *Date) MarshalJSON() ([]byte, error) {
	dateFormat := d.Format(`"2006-01-02T15:04:05.000Z"`)

	return []byte(dateFormat), nil
}

// buffer not very good because we can't know the size, it may get big
// Set up a buffer to temporarily hold the encoded data.
var buf bytes.Buffer
// Write JSON-encoded data to a buffer of bytes.
// This buffer will grow to whatever size necessary to
// hold the buffered data.
err := json.NewEncoder(&buf).Encode(&v)
// Send the HTTP request. Whatever is read from the Reader
// will be sent in the request body.
// The buffer is also a Reader, so it can be passed in here.
// Its data will be read out until the buffer is complete.
resp, err := http.Post(“example.com”, “application/json”, &buf)

// Use of io.Pipe: It’s like a portal from Portal, whatever goes in the Writer end, immediately goes out the Reader end
// Set up the pipe to write data directly into the Reader.
pr, pw := io.Pipe()
// Write JSON-encoded data to the Writer end of the pipe.
err := json.NewEncoder(pw).Encode(&v)
// Send the HTTP request. Whatever is read from the Reader
// will be sent in the request body.
// As data is written to the Writer, it will be available
// to read from the Reader.
resp, err := http.Post(“example.com”, “application/json”, pr)

// But wait! This code also includes a serious bug! Because we’re writing to the Writer, then reading from it afterwards, and because the Writer explicitly will not buffer anything, we have a deadlock on our hands! Calls to Write will block until that data can be read, which we’re not doing until after we’ve written. That’s a deadlock.

// To solve this problem, we can use a goroutine to concurrently write while data is being read.
// Set up the pipe to write data directly into the Reader.
pr, pw := io.Pipe()
// Write JSON-encoded data to the Writer end of the pipe.
// Write in a separate concurrent goroutine, and remember
// to Close the PipeWriter, to signal to the paired PipeReader
// that we’re done writing.
go func() {
  err := json.NewEncoder(pw).Encode(&v)
  pw.Close()
}()
// Send the HTTP request. Whatever is read from the Reader
// will be sent in the request body.
// As data is written to the Writer, it will be available
// to read from the Reader.
resp, err := http.Post(“example.com”, “application/json”, pr)

// json.Encoder and Decoder with buffer

    type Person struct {
        Name string
        Size int `json:"shirt-size"`
    }

    var p Person
    buff := new(bytes.Buffer)
    buff.WriteString(`{"name":"naka","shirt-size":1}`)

    dec := json.NewDecoder(buff) // separate decoder if buff name too long
    err := dec.Decode(&p) // one line if buff name is short

    // io.Reader read json from buff into Person p
    err := json.NewDecoder(buff).Decode(&p)
    logFatal1(err)
    fmt.Println("Json string decoded into Person:", p)

    // io.Writer write to buff Person p as json
    err = json.NewEncoder(buff).Encode(&p)
    logFatal1(err)
    fmt.Printf("Person JsonEncoded: %v \n", buff.String())

    err := json.NewDecoder(buff).Decode(&p) //Read jsString([]byte) from buff into p
    err = json.NewEncoder(buff).Encode(&p) // Write jsString([]byte) to buff from p

// example of Pipe, write into pw read from pr with buffer
mt3 := myType1{}
pr, pw := io.Pipe()

go func() {
    json.NewEncoder(pw).Encode(&mt3) //could check for error
    pw.Close()
}()

buf := new(bytes.Buffer)
buf.ReadFrom(pr)
fmt.Println("buf from pipe reader", buf.String())

