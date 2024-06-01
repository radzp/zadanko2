package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"time"
)

// obsługuję żądania HTTP i zwracam adres IP klienta oraz czas
func handleRequest(w http.ResponseWriter, r *http.Request) {
	ip, _, _ := net.SplitHostPort(r.RemoteAddr)
	tim := time.Now()
	fmt.Fprintf(w, "IP klienta: %s, Czas: %s", ip, tim)
}

// uruchamiam serwer na porcie 8000 i obsługuję żądania HTTP
func startServer(port string) {
	http.HandleFunc("/", handleRequest)
	log.Printf("Serwer uruchomiony:  %s przez Anna Paczesna, na porcie %s\n", time.Now(), port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

// serwer uruchamiam na porcie 8000
func main() {
	startServer("8000")
}
