response.Success = false
response.Reason = err.Error()

package main
import (
	"fmt"
	"io/ioutil"
	"net/http"
	"github.com/gorilla/mux"
)

// write to ResponseWriter our error
http.Error(w,"Could not encode json",http.StatusInternalServerError)

func home(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadFile("web/home/home.html")
	if err != nil {
		w.WriteHeader(http.StatusNotFound)
		fmt.Println("home")
	}
	w.Write(body)
	w.Header().Set("Content-Type", "text/html;charset=utf-8")
}



func main() {
	fmt.Println("listen and serve any:8080")

	r := mux.NewRouter()
	r.HandleFunc("/home", home)
	//serve static files
	r.PathPrefix("/").Handler(http.FileServer(http.Dir("web/")))
	http.Handle("/", r)
	http.ListenAndServe(":8080", nil)
}

// use this when gorilla mux
r.HandleFunc("/getPerson", getPerson).Methods("GET","POST")

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

// exec template and render to os.Stout
	dat, err := ioutil.ReadFile("template.html"); check(err)
	tmpl, err := template.New("t1").Parse(string(dat)); check(err)

	htmlFile, _ := os.Open("template.html")

	tmpl.Execute(os.Stdout, rssList)

// avoid CORS
// The preflight is being triggered by your Content-Type of "application/json". The simplest way to prevent this is to set the Content-Type to be "text/plain" in your case. application/x-www-form-urlencoded & multipart/form-data Content-Types are also acceptable, but you'll of course need to format your request payload appropriately.

// If you are still seeing a preflight after making this change, then Angular may be adding an X-header to the request as well.

// http.Error
http.Error(w, err.Error(), 500)


// -- 
// Movie Struct
type Movie struct {
	Title  string `json:"title"`
	Rating string `json:"rating"`
	Year   string `json:"year"`
}

var movies = map[string]*Movie{
	"tt0076759": &Movie{Title: "Star Wars: A New Hope", Rating: "8.7", Year: "1977"},
	"tt0082971": &Movie{Title: "Indiana Jones: Raiders of the Lost Ark", Rating: "8.6", Year: "1981"},
}	

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/movies", handleMovies).Methods("GET")
	router.HandleFunc("/movie/{imdbKey}", handleMovie).Methods("GET", "DELETE")
	http.ListenAndServe(":8080", router)
}

func handleMovie(res http.ResponseWriter, req *http.Request) {
	res.Header().Set("Content-Type", "application/json")

	vars := mux.Vars(req)
	imdbKey := vars["imdbKey"]

	log.Println("Request for:", imdbKey)

	movie, ok := movies[imdbKey]
	if !ok {
		res.WriteHeader(http.StatusNotFound)
		fmt.Fprint(res, string("Movie not found"))
	}

	switch req.Method {
	case "GET":
		outgoingJSON, error := json.Marshal(movie)
		if error != nil {
			log.Println(error.Error())
			http.Error(res, error.Error(), http.StatusInternalServerError)
			return
		}
		fmt.Fprint(res, string(outgoingJSON))
	case "DELETE":
		delete(movies, imdbKey)
		res.WriteHeader(http.StatusNoContent)
	}
}

func handleMovies(res http.ResponseWriter, req *http.Request) {
	res.Header().Set("Content-Type", "application/json")

	outgoingJSON, error := json.Marshal(movies)

	if error != nil {
		log.Println(error.Error())
		http.Error(res, error.Error(), http.StatusInternalServerError)
		return
	}

	fmt.Fprint(res, string(outgoingJSON))
}