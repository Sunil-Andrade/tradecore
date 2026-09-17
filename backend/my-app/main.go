package main

import (
	"log"
	"net/http"
	"stock/engine"
	"stock/models"
	"stock/server"
)

func main() {
	market := &engine.Engine{
		Stock: models.Stock{
			Name:  "ABC",
			Price: 100,
		},
		NextOrderID: 1,
	}

	wsServer := server.NewServer(market)

	http.HandleFunc("/ws", wsServer.HandleWebSocket)

	log.Println("Stock market server running on :8080")

	err := http.ListenAndServe(":8080", nil)

	if err != nil {
		log.Fatal(err)
	}
}
