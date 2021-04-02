// concurency pattern

// If no buffer capacity is specified the channel is synchronous, so it will block until
// the sender is ready to send and the receiver is ready to receive. If a capacity is
// given the channel is asynchronous and communication will progress without
// blocking so long as there is unused capacity for sends and there is data in the
// channel to be received.

// In a select statement Go evaluates each send or receive statement in order from
// first to last. If any of these statements can proceed (i.e., is not blocked), then
// of those that can proceed, an arbitrary choice is made as to which one to use. If
// none can proceed (i.e., if they are all blocked), there are two possible scenarios.
// If a default case is present, the default case is executed and execution resumes
// from the statement following the select; but if there is no default case the select
// will block until at least one communication can proceed.
// A consequence of the select statement’s logic is as follows. A select with no
// default case is blocking and will only complete when one communication case
// (receive or send) has occurred. A select with a default case is nonblocking and
// executes immediately, either because a communication case occurred, or if no
// communication channel is ready, by executing the default case.

// the sync.Once type can be used to call a function once only, no matter how many times the call is made

// timeouts with time after work but with buffered channel
// Note that the channel c has a buffer size of 1. If it were an unbuffered channel and the client.Call method took more than timeoutNanoseconds, the channel send would block forever and the goroutine would never be destroyed.
import "time"

c := make(chan error, 1)

go func() { c <- client.Call("Service.Method", args, &reply) } ()

select {
  case err := <-c:
    // use err and reply
  case <-time.After(timeoutNanoseconds):
    // call timed out
}

// It is also possible to check the number of elements queued in a channel by using len(ch), as stated in the Go specifications. This in combination with cap allows us to check if a channel is full without sending any data.
if len(ch) == cap(ch) {
    // Channel was full, but might not be by now
}

// overflowing channel
for elem := range ch.input {
    // if we can't write it immediately, drop it and move on
    select {
    case ch.output <- elem:
    default:
    }
}
close(ch.output)

// --------------merge example ------------
// with buffer no more go func()
func gen(done <-chan struct{}, nums ...int) <-chan int {
	out := make(chan int, len(nums))
	defer close(out)

		for _, n := range nums {
			select {
			case out <- n:
			case <-done:
				fmt.Println("gen: Done vas called n is ", n)
				return out
			}
		}

	return out
}

func gen(done <-chan struct{}, nums ...int) <-chan int {
	out := make(chan int)

	// without this goroutine the select blocks
	go func() {
		defer close(out)
		for _, n := range nums {
			select {
			case out <- n:
			case <-done:
				fmt.Println("gen: Done vas called n is ", n)
				return
			}
		}
	}()

	return out
}

func sq(done <-chan struct{}, in <-chan int) <-chan int {
	out := make(chan int)

	go func() {
		defer close(out)
		for n := range in {
			select {
			case out <- n * n:
			case <-done:
				fmt.Println("sq: Done was called sq n is ", n)
				return
			}
		}
	}()

	return out
}

func merge(done <-chan struct{}, cs ...<-chan int) <-chan int {
	var wg sync.WaitGroup
	out := make(chan int)

	// Start an worker goroutine for each input channel in cs.  worker
	// copies values from c to out until c is closed or it receives a value
	// from done, then worker calls wg.Done.
	worker := func(c <-chan int) {
		for n := range c {
			select {
			case out <- n:
			case <-done:
				fmt.Println("mege: Done received n is",n)
				return
			}
		}
		wg.Done()
	}

	// We put a limit on workers we don't want too many goroutines
	// const workers = 20
	// wg.Add(workers)

	wg.Add(len(cs))
	for _, c := range cs {
		go worker(c)
	}

	// Start a goroutine to close out once all the worker goroutines are
	// done.  This must start after the wg.Add call.
	go func() {
		wg.Wait()
		close(out)
	}()
	return out
}

func main() {
	// Set up a done channel that's shared by the whole pipeline,
	// and close that channel when this pipeline exits, as a signal
	// for all the goroutines we started to exit.
	done := make(chan struct{})
	defer close(done)

	in := gen(done, 2, 3)

	// Distribute the sq work across two goroutines that both read from in.
	c1 := sq(done, in)
	//done <- struct{}{}
	c2 := sq(done, in)

	out := merge(done, c1, c2)
	// Consume the first value from output.
	// fmt.Println(<-out) // 4 or 9

	for n := range out {
		fmt.Println(n)
	}
	// done will be closed by the deferred call.
}

// ------------------ same merge example but with external worker -----------------

// if worker takes too long time.AfterFunc is called
// remember to call wg.Done
func worker(done <-chan struct{}, out chan<- int, c <-chan int, wg *sync.WaitGroup) {
	for n := range c {

		if n == 4 {
			time.Sleep(3 * time.Second)
		}

		select {
		case out <- n:
		case <-done:
			fmt.Println("merge: Done received n is", n)
			return
		}
	}

	time.AfterFunc(time.Second, func() {
		wg.Done()
	})

	wg.Done()

}


func worker(done <-chan struct{}, out chan<- int, c <-chan int, wg *sync.WaitGroup) {
	for n := range c {
		select {
		case out <- n:
		case <-done:
			fmt.Println("mege: Done received n is", n)
			return
		}
	}
	wg.Done()
}

func merge(done <-chan struct{}, cs ...<-chan int) <-chan int {
	var wg sync.WaitGroup
	out := make(chan int)

	wg.Add(len(cs))
	for _, c := range cs {
		go worker(done, out, c, &wg)
	}

	go func() {
		wg.Wait()
		close(out)
	}()
	return out
}

// --------- timeout program working properly -----------
package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"sync"
	"time"

	au "github.com/logrusorgru/aurora"
)

func worker(done <-chan struct{}, addr string, out chan<- string, wg *sync.WaitGroup) {

	doneCalled := false

	doneCall := func(where string) {
		if doneCalled {
			fmt.Println("Done already colled in", where)
		} else {
			//fmt.Println("Done called in", where)
			doneCalled = true
			wg.Done()

		}
	}

	c := make(chan struct{}, 1)
	go func() {
		time.Sleep(time.Second * 2)
		doneCall("Timeout goroutine")
		c <- struct{}{}
	}()

	addr = "http://localhost:8080/" + addr

	resp, err := http.Get(addr)
	if err != nil {
		fmt.Println("http.Get err:", err)
	}
	response, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("ioutil.ReadAll err:", err)
	}

	select {
	case out <- string(response):
		doneCall("In select")
		s := fmt.Sprintf("Succeded for %v", addr)
		fmt.Printf("%v \n", au.Green(s))
	case <-c:
		s := fmt.Sprintf("Timed out for %v", addr)
		fmt.Printf("%v \n", au.Red(s))
	case <-done:
		fmt.Println("Done called in worker")
		return
	}

}

func workerPool(done chan struct{}) <-chan string {
	addresses := []string{"", "one", "two", "three", "four", "five"}
	out := make(chan string)
	var wg sync.WaitGroup
	wg.Add(len(addresses))

	for i := range addresses {
		go worker(done, addresses[i], out, &wg)
	}

	go func() {
		wg.Wait()
		close(out)
	}()

	return out

}

func timeTrack(start time.Time, name string) {
	elapsed := time.Since(start)
	log.Printf("%s took %s", name, elapsed)
}

func main() {
	defer timeTrack(time.Now(), "main")

	done := make(chan struct{})

	wPoolChannel := workerPool(done)
	for v := range wPoolChannel {
		fmt.Printf("v: %v \n", v)
	}

	close(done)
}




// ---------------- Start rssGo ------------------------------------\\

import (
	"encoding/xml"
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"sync"
)

type Item struct {
	XMLName xml.Name `xml:"item"`
	Title   string   `xml:"title"`
	Link    string   `xml:"link"`
}

func (it Item) String() string {
	return fmt.Sprintf("%s %s", it.Title, it.Link)
}

type RSS struct {
	XMLName xml.Name `xml:"rss"`
	Title   string   `xml:"channel>title"`
	Items   []Item   `xml:"channel>item"`
}

var mangaRssAddresses = []string{
	"http://mangafox.me/rss/the_gamer.xml",
	"http://mangafox.me/rss/ruler_of_the_land.xml",
}

type RssStruct struct {
	rss RSS
	nr  int
}

type nrAddr struct {
	nr   int
	addr string
}

func genFirst(done <-chan struct{}, nrOfAddresses int) <-chan nrAddr {
	out := make(chan nrAddr, nrOfAddresses)

	defer close(out)
	for i, v := range mangaRssAddresses {
		select {
		case out <- nrAddr{nr: i, addr: v}:
		case <-done:
			return out
		}
	}

	return out
}

func mangaWorker(done <-chan struct{}, nrAddress nrAddr, outRssStruct chan<- RssStruct, wg *sync.WaitGroup) {

	resp, err := http.Get(nrAddress.addr)

	if err != nil || resp.StatusCode != 200 {
		fmt.Println("error for :", nrAddress.addr)
		outRssStruct <- RssStruct{}
		return
	}

	XMLdata, _ := ioutil.ReadAll(resp.Body)

	var rss RSS
	rssStruc1 := RssStruct{}

	err = xml.Unmarshal(XMLdata, &rss)

	// If something goes wrong rssStruct1 is an empty struct
	if err != nil {
		fmt.Println("mangaWorker xml.Unmarshal:", err)
		rssStruc1 = RssStruct{}

	} else {
		rss.Items = rss.Items[:5]
		rssStruc1 = RssStruct{rss, nrAddress.nr}
	}

	select {
	case outRssStruct <- rssStruc1:
	case <-done:
		return
	}

	wg.Done()

}
// new mangaWorker proper timeout
func mangaWorker(done <-chan struct{}, nrAddress nrAddr, outRssStruct chan<- RssStruct, wg *sync.WaitGroup) {
	
	// This is the timeout
	c := make(chan struct{}, 1)
	go func() {
		time.Sleep(time.Second * 4)
		c <- struct{}{}
	}()

	doneCalled := false

	// This function is used to call wg.Done()
	doneCall := func(where, info string) {
		if doneCalled {
			fmt.Printf("X_%v Done already called: %v for %v\n", string(info[4:6]), where, info)
		} else {
			doneCalled = true
			wg.Done()

			if strings.Contains(where, "Timed") {
				color.Red("%v Done called %v for %v\n", string(info[4:6]), where, info)
			} else {
				color.Green("%v Done called %v for %v\n", string(info[4:6]), where, info)
			}

		}
	}

	positionAndAddress := fmt.Sprintf("nr: %v adr: %v", nrAddress.nr, nrAddress.addr[23:len(nrAddress.addr)-4])

	resp, err := http.Get(nrAddress.addr)

	if err != nil || resp.StatusCode != 200 {
		log.Println("error for :", nrAddress.addr, "StatusCode:", resp.StatusCode)
		outRssStruct <- RssStruct{}
		doneCall("inside resp.StatusCode", positionAndAddress)
		return
	}

	XMLdata, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Println("ioutil.ReadAll(resp.Body) err:", err)

	}

	var rss RSS
	rssStruc1 := RssStruct{}

	err = xml.Unmarshal(XMLdata, &rss)

	if err != nil {
		log.Println("xml.Unmarshal:", err, "for", positionAndAddress)
		rssStruc1 = RssStruct{}
	} else {
		rss.Items = rss.Items[:5]
		rssStruc1 = RssStruct{rss, nrAddress.nr}
	}

	select {
	case outRssStruct <- rssStruc1:
		//fmt.Println("Done case", positionAndAddress)
		doneCall("In Select", positionAndAddress)
	case <-c:
		doneCall("Timed out", positionAndAddress)
	case <-done:
		return
	}

}

// in other cases nA may be a list of channels, the worker would receive a channel
// data from nA channel is fed to mangaWorkers
func mangaWorkerPool(done <-chan struct{}, nA <-chan nrAddr) <-chan RssStruct {
	var wg sync.WaitGroup
	outRssStruct := make(chan RssStruct)

	// as much workers as adresses
	wg.Add(len(mangaRssAddresses))

	for adrs := range nA {
		go mangaWorker(done, adrs, outRssStruct, &wg)
	}

	go func() {
		wg.Wait()
		close(outRssStruct)
	}()

	return outRssStruct
}

func init() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)
}

func main() {

	//fmt.Println("--------START------------")
    

	done := make(chan struct{})
	defer close(done)

	genCh := genFirst(done, len(mangaRssAddresses))
	ch1 := mangaWorkerPool(done, genCh)

	rssList := make([]RSS, len(mangaRssAddresses))

	for v := range ch1 {
		rssList[v.nr] = v.rss
	}

	dat, err := ioutil.ReadFile("template.html")
	if err != nil {

		log.Println("err with template.html:", err)
		return
	}

	tmpl, err := template.New("t1").Parse(string(dat))
	if err != nil {
		log.Println("Err with template Parse", err)
	}

	htmlFile, err := os.Create("res.html")
	if err != nil {
		log.Println("Err with os create:", err)
	}
	defer htmlFile.Close()

	tmpl.Execute(htmlFile, rssList)
    

}

// ---------------- End rssGo ------------------------------------ \\


//------------------------- time out -------------------------------\\
package main
import (
	"fmt"
	"time"
)

func timeoutF(timeout chan<- bool) {
	time.Sleep(1 * time.Second) // one second
	timeout <- true
}

func sendValuesToChan(i int, ch chan<- int) {
	if i == 3 {
		time.Sleep(30 * time.Second)
	}
	ch <- i

}

func main() {
	timeout := make(chan bool, 1)
	ch := make(chan int)
	defer close(ch)

	for i := 0; i < 7; i++ {
		go sendValuesToChan(i, ch)
	}

	go timeoutF(timeout)

	//we have 8 goroutines because of timeout
	// goroutine that was with i: 3 is replaced by <-time.After
	// if we put more than 8 time.After will continue to trigger
	for i := 0; i < 8; i++ {
		select {
		case vc := <-ch:
			fmt.Printf("v:%v \n", vc)
		case t := <-timeout:
			fmt.Printf("timeout channel: %v \n", t)
			//go routine with i:3 takes 30 seconds
		case <-time.After(2 * time.Second):
			fmt.Println("There was a goroutine that lasted more than 2 second")
		}
	}

}


// ------------------ Time out reachable 1 ----------------------------------\\
package main
import (
	"fmt"
	"time"
)

func check(u string, checked chan<- bool) {
	if u != "three" {
		time.Sleep(3 * time.Second)
	} 
	checked <- true
	
}

// with bufferend channel
func isReachable(urls []string) <-chan bool {
	ch := make(chan bool, len(urls))
	defer close(ch)

	for _, url := range urls {
		checked := make(chan bool)
		go check(url, checked)

		select {
		case ret := <-checked:
			ch <- ret
		case <-time.After(1 * time.Second):
			ch <- false
		}
	}

	return ch
}

func isReachable(urls []string) <-chan bool {
	ch := make(chan bool)

	go func() {
		defer close(ch)

		for _, url := range urls {
			checked := make(chan bool)
			// important check must be run as gorutine
			go check(url, checked)

			select {
			case ret := <-checked:
				ch <- ret
			case <-time.After(1 * time.Second):
				ch <- false
			}
		}
	}()

	return ch
}

func main() {
	reach := isReachable([]string{"one", "Two", "three"})
	for v := range reach {
		fmt.Println("v :", v)
	}
}

//------------------ Reachable simplified time.Afterfunc v2 ---------- \
package main

import (
	"fmt"
	"time"
)

func check(u string, checked chan<- bool) {
	if u == "url0" || u == "url1" {
		time.Sleep(4 * time.Second)
	}

	checked <- true

}

// time.Afterfunc
func IsReachable(urls []string) bool {
	ch := make(chan bool, len(urls))
	for _, url := range urls {
		go check(url, ch)
	}

	time.AfterFunc(time.Second, func() { ch <- false })
	return <-ch
}

func main() {
	fmt.Println(IsReachable([]string{"url1", "url0"}))
	fmt.Println(IsReachable([]string{"url2", "url3"}))
}

// --------------- time out example ====================

timeout := make(chan bool, 1)
go func() {
    time.Sleep(1e9) // one second
    timeout <- true
}()

select {
case <- ch:
    // a read from ch has occurred
case <- timeout:
    // the read from ch has timed out
}

// ------------ context with time out -------------------
package main

import (
    "fmt"
    "io/ioutil"
    "net/http"
    "sync"
    "time"

    "golang.org/x/net/context"
)

var (
    wg sync.WaitGroup
)

// main is not changed
func main() {
    ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
    defer cancel()

    fmt.Println("Hey, I'm going to do some work")

    wg.Add(1)
    go work(ctx)
    wg.Wait()

    fmt.Println("Finished. I'm going home")

}

func work(ctx context.Context) error {
    defer wg.Done()

    tr := &http.Transport{}
    client := &http.Client{Transport: tr}

    // anonymous struct to pack and unpack data in the channel
    c := make(chan struct {
        r   *http.Response
        err error
    }, 1)

    req, _ := http.NewRequest("GET", "http://localhost:1111", nil)
    go func() {
        resp, err := client.Do(req)
        fmt.Println("Doing http request is a hard job")
        pack := struct {
            r   *http.Response
            err error
        }{resp, err}
        c <- pack
    }()

    select {
    case <-ctx.Done():
        tr.CancelRequest(req)
        <-c // Wait for client.Do
        fmt.Println("Cancel the context")
        return ctx.Err()
    case ok := <-c:
        err := ok.err
        resp := ok.r
        if err != nil {
            fmt.Println("Error ", err)
            return err
        }

        defer resp.Body.Close()
        out, _ := ioutil.ReadAll(resp.Body)
        fmt.Printf("Server Response: %s\n", out)

    }
    return nil
}

// ------------- WaitMany() =============
In the rewritten WaitMany() we nil the reference to a or b once they have received a value. When a nil channel is part of a select statement, it is effectively ignored, so niling a removes it from selection, leaving only b which blocks until it is closed, exiting the loop without spinning.


package main

import (
        "fmt"
        "time"
)

func WaitMany(a, b chan bool) {
        for a != nil || b != nil {
                select {
                case <-a:
                        a = nil 
                case <-b:
                        b = nil
                }
        }
}

func main() {
        a, b := make(chan bool), make(chan bool)
        t0 := time.Now()
        go func() {
                close(a)
                close(b)
        }()
        WaitMany(a, b)
        fmt.Printf("waited %v for WaitMany\n", time.Since(t0))
}

// ---------------------- M receivers, N senders ----------------------------
// M receivers, N senders, random one of them says "let's end the game" by notifying a moderator to close an additional signal channel

// This is a the most complicated situation. We can't let any of the receivers and the senders close the data channel. And we can't let any of the receivers close an additional signal channel to notify all senders and receivers to exit the game. Doing either will break the channel closing principle. However, we can introduce a moderator role to close the additional signal channel. One trick in this example is how to notify the moderator to close the additional signal channel:
package main

import (
	"time"
	"math/rand"
	"sync"
	"log"
	"strconv"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	log.SetFlags(0)
	
	// ...
	const MaxRandomNumber = 100000
	const NumReceivers = 10
	const NumSenders = 1000
	
	wgReceivers := sync.WaitGroup{}
	wgReceivers.Add(NumReceivers)
	
	// ...
	dataCh := make(chan int, 100)
	stopCh := make(chan struct{})
		// stopCh is an additional signal channel.
		// Its sender is the moderator goroutine shown below.
		// Its reveivers are all senders and receivers of channel dataCh.
	toStop := make(chan string, 1)
		// the channel toStop is used to notify the moderator
		// to close the additional signal channel (stopCh).
	
	var stoppedBy string
	
	// moderator
	go func() {
		stoppedBy = <- toStop // part of the trick used to notify the moderator
		                      // to close the additional signal channel.
		close(stopCh)
	}()
	
	// senders
	for i := 0; i < NumSenders; i++ {
		go func(id string) {
			for {
				value := rand.Intn(MaxRandomNumber)
				if value == 0 {
					// here, a trick is used to notify the moderator
					// to close the additional signal channel.
					select {
					case toStop <- "sender#" + id:
					default:
					}
					return
				}
				
				select {
				case <- stopCh:
					return
				case dataCh <- value:
				}
			}
		}(strconv.Itoa(i))
	}
	
	// receivers
	for i := 0; i < NumReceivers; i++ {
		go func(id string) {
			defer wgReceivers.Done()
			
			for {
				select {
				case <- stopCh:
					return
				case value := <-dataCh:
					if value == MaxRandomNumber-1 {
						// the same trick is used to notify the moderator 
						// to close the additional signal channel.
						select {
						case toStop <- "receiver#" + id:
						default:
						}
						return
					}
					
					log.Println(value)
				}
			}
		}(strconv.Itoa(i))
	}
	
	// ...
	wgReceivers.Wait()
	log.Println("stopped by", stoppedBy)
}


//----------------------------- Bounded.go ------------------------------ \\

// The MD5All implementation in parallel.go starts a new goroutine for each file. In a directory with many large files, this may allocate more memory than is available on the machine.

// We can limit these allocations by bounding the number of files read in parallel. In bounded.go, we do this by creating a fixed number of goroutines for reading files. Our pipeline now has three stages: walk the tree, read and digest the files, and collect the digests.

package main

import (
	"crypto/md5"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"sort"
	"sync"
)

// walkFiles starts a goroutine to walk the directory tree at root and send the
// path of each regular file on the string channel.  It sends the result of the
// walk on the error channel.  If done is closed, walkFiles abandons its work.
func walkFiles(done <-chan struct{}, root string) (<-chan string, <-chan error) {
	paths := make(chan string)
	errc := make(chan error, 1)
	go func() { // HL
		// Close the paths channel after Walk returns.
		defer close(paths) // HL
		// No select needed for this send, since errc is buffered.
		errc <- filepath.Walk(root, func(path string, info os.FileInfo, err error) error { // HL
			if err != nil {
				return err
			}
			if !info.Mode().IsRegular() {
				return nil
			}
			select {
			case paths <- path: // HL
			case <-done: // HL
				return errors.New("walk canceled")
			}
			return nil
		})
	}()

	return paths, errc
}

// A result is the product of reading and summing a file using MD5.
type result struct {
	path string
	sum  [md5.Size]byte
	err  error
}

// digester reads path names from paths and sends digests of the corresponding
// files on c until either paths or done is closed.
func digester(done <-chan struct{}, paths <-chan string, c chan<- result) {
	for path := range paths { // HLpaths
		data, err := ioutil.ReadFile(path)
		select {
		case c <- result{path, md5.Sum(data), err}:
		case <-done:
			return
		}
	}
}

// MD5All reads all the files in the file tree rooted at root and returns a map
// from file path to the MD5 sum of the file's contents.  If the directory walk
// fails or any read operation fails, MD5All returns an error.  In that case,
// MD5All does not wait for inflight read operations to complete.
func MD5All(root string) (map[string][md5.Size]byte, error) {
	// MD5All closes the done channel when it returns; it may do so before
	// receiving all the values from c and errc.
	done := make(chan struct{})
	defer close(done)

	paths, errc := walkFiles(done, root)

	// Start a fixed number of goroutines to read and digest files.
	c := make(chan result) // HLc

	var wg sync.WaitGroup
	const numDigesters = 20
	wg.Add(numDigesters)

	for i := 0; i < numDigesters; i++ {
		go func() {
			digester(done, paths, c) // HLc
			wg.Done()
		}()
	}

	go func() {
		wg.Wait()
		close(c) // HLc
	}()
	// End of pipeline. OMIT

	m := make(map[string][md5.Size]byte)
	for r := range c {
		if r.err != nil {
			return nil, r.err
		}
		m[r.path] = r.sum
	}
	// Check whether the Walk failed.
	if err := <-errc; err != nil { // HLerrc
		return nil, err
	}
	return m, nil
}

func main() {
	// Calculate the MD5 sum of all files under the specified directory,
	// then print the results sorted by path name.
	m, err := MD5All(os.Args[1])

	if err != nil {
		fmt.Println(err)
		return
	}

	var paths []string
	for path := range m {
		paths = append(paths, path)
	}
	
	sort.Strings(paths)
	for _, path := range paths {
		fmt.Printf("%x  %s\n", m[path], path)
	}
}













