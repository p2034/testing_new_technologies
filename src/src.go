package src

import (
	"fmt"
	"http"
)

func Example(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Get request!")
	fmt.Fprintf(w, "<h1>Hello from golang from docker!</h1>")
}