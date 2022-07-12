package main

import (
	"fmt"
	"net/http"

	"app/src"
)

func main() {
	var host string = ""
	fmt.Print("Write host: ")
	fmt.Scanln(&host)
	host = host + ":10001"

	http.HandleFunc("/example", src.Example)

	fmt.Println("Start server on", host)
	http.ListenAndServe(host, nil)
}
