package engine

import "fmt"

func (m *Market) Run(orderChan <-chan Order) {
	fmt.Println("Running")
	for order := range orderChan {
		fmt.Println("R", order)
		m.PlaceOrder(order)
		m.MatchOrders()
	}
}
