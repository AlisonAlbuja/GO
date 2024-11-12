
package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	// Obtener el puerto desde la variable de entorno Heroku 
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080" // usar puerto 8080 por defecto en caso de no estar configurado
	}

http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "HELLO Alison Albuja") 
})

fmt.Println("Server started on port:", port)
http.ListenAndServe(":" + port, nil)
}
