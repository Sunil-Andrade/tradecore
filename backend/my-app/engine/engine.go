package engine

import (
	"stock/heap"
	"stock/models"
	"stock/queue"
)

type Engine struct {
	Stock models.Stock

	BuyOrders  heap.MaxHeap
	SellOrders heap.MinHeap

	OrderQueue queue.Queue

	NextOrderID int
	Sequence    int64

	Trades []models.Trade
}

func (e *Engine) AddOrder(order models.Order) []models.Trade {
	order.ID = e.NextOrderID
	e.NextOrderID++

	order.Sequence = e.Sequence
	e.Sequence++

	e.OrderQueue.Enqueue(order)

	order = e.OrderQueue.Dequeue()

	if order.IsBuy {
		e.BuyOrders.Insert(order)
	} else {
		e.SellOrders.Insert(order)
	}

	return e.Match()
}

func (e *Engine) Match() []models.Trade {
	newTrades := []models.Trade{}

	for {
		if e.BuyOrders.IsEmpty() || e.SellOrders.IsEmpty() {
			break
		}

		buy := e.BuyOrders.Peek()
		sell := e.SellOrders.Peek()

		if buy.Price < sell.Price {
			break
		}

		buy = e.BuyOrders.Remove()
		sell = e.SellOrders.Remove()

		quantity := buy.Quantity

		if sell.Quantity < quantity {
			quantity = sell.Quantity
		}

		trade := models.Trade{
			BuyerID:  buy.TraderID,
			SellerID: sell.TraderID,
			Price:    sell.Price,
			Quantity: quantity,
		}

		newTrades = append(newTrades, trade)
		e.Trades = append(e.Trades, trade)

		e.Stock.Price = sell.Price

		buy.Quantity -= quantity
		sell.Quantity -= quantity

		if buy.Quantity > 0 {
			e.BuyOrders.Insert(buy)
		}

		if sell.Quantity > 0 {
			e.SellOrders.Insert(sell)
		}
	}

	return newTrades
}
