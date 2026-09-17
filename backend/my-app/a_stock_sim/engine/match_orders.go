package engine

import "fmt"

func (m *Market) MatchOrders() {
	if len(m.BuyOrders) == 0 || len(m.SellOrders) == 0 {
		return
	}

	for {
		if len(m.BuyOrders) == 0 || len(m.SellOrders) == 0 {
			break
		}

		buy := &m.BuyOrders[0]
		sell := &m.SellOrders[0]

		if buy.Price < sell.Price {
			fmt.Println("Trade not possible")
			break
		}

		m.ExecuteOrder(buy, sell)
	}

}
