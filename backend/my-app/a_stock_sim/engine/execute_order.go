package engine

import "fmt"

func (m *Market) ExecuteOrder(buy *Order, sell *Order) {
	//validate buyer
	buyer := m.Traders[buy.TraderId]
	if buy.Price > buyer.Balance {
		fmt.Println("Buyer not enough balance")
		return
	}

	//validate seller
	seller := m.Traders[sell.TraderId]
	if sell.Quantity > seller.Shares {
		fmt.Println("Not enough shares")
		return
	}

	//determin trade price
	tradePrice := sell.Price

	//determin quantiry
	tradeQuantity := min(buy.Quantity, sell.Quantity)

	//tranfershares
	buyer.Shares += tradeQuantity
	buyer.Balance -= tradePrice * tradeQuantity

	seller.Shares -= tradeQuantity
	seller.Balance += tradePrice * tradeQuantity

	//update stock price
	m.Stock.Price = tradePrice

	//chnage order
	buy.Quantity -= tradeQuantity
	sell.Quantity -= tradeQuantity

	if sell.Quantity == 0 {
		m.SellOrders = m.SellOrders[1:]
	}
	if buy.Quantity == 0 {
		m.BuyOrders = m.BuyOrders[1:]
	}

	trade := Trade{
		BuyerId:  buy.TraderId,
		SellerId: sell.TraderId,
		Price:    tradePrice,
		Quantity: tradeQuantity,
	}

	m.Trades = append(m.Trades, trade)

}
