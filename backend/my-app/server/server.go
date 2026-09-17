package server

import (
	"encoding/json"
	"log"
	"net/http"
	"stock/engine"
	"stock/models"
	"sync"

	"github.com/gorilla/websocket"
)

type Server struct {
	Engine *engine.Engine

	Clients map[*websocket.Conn]bool

	Mutex sync.Mutex

	Upgrader websocket.Upgrader
}

func NewServer(e *engine.Engine) *Server {
	return &Server{
		Engine:  e,
		Clients: make(map[*websocket.Conn]bool),

		Upgrader: websocket.Upgrader{
			CheckOrigin: func(r *http.Request) bool {
				return true
			},
		},
	}
}

func (s *Server) HandleWebSocket(w http.ResponseWriter, r *http.Request) {
	conn, err := s.Upgrader.Upgrade(w, r, nil)

	if err != nil {
		log.Println("WebSocket upgrade error:", err)
		return
	}

	s.Mutex.Lock()
	s.Clients[conn] = true
	s.Mutex.Unlock()

	log.Println("Client connected")

	defer func() {
		s.Mutex.Lock()
		delete(s.Clients, conn)
		s.Mutex.Unlock()

		conn.Close()

		log.Println("Client disconnected")
	}()

	for {
		var order models.Order

		err := conn.ReadJSON(&order)

		if err != nil {
			log.Println("Read error:", err)
			return
		}

		trades := s.Engine.AddOrder(order)

		s.broadcastTrades(trades)
	}
}

func (s *Server) broadcastTrades(trades []models.Trade) {
	for _, trade := range trades {
		message := map[string]interface{}{
			"type":  "trade",
			"trade": trade,
		}

		data, err := json.Marshal(message)

		if err != nil {
			continue
		}

		s.broadcast(data)
	}
}

func (s *Server) broadcast(data []byte) {
	s.Mutex.Lock()
	defer s.Mutex.Unlock()

	for client := range s.Clients {
		err := client.WriteMessage(
			websocket.TextMessage,
			data,
		)

		if err != nil {
			log.Println("Broadcast error:", err)
			client.Close()
			delete(s.Clients, client)
		}
	}
}
