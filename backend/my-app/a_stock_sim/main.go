package main

import (
	"fmt"
	"sim/engine"
)

func main() {

	trader1 := &engine.Trader{
		Id:      1,
		Balance: 1000,
		Shares:  4,
	}

	trader2 := &engine.Trader{
		Id:      2,
		Balance: 1000,
		Shares:  4,
	}

	stock := engine.Stock{
		Name:  "X",
		Price: 100,
	}

	market := engine.Market{
		Stock: stock,
		Traders: map[int]*engine.Trader{
			trader1.Id: trader1,
			trader2.Id: trader2,
		},
	}

	// sellOrder := engine.Order{
	// 	TraderId: 1,
	// 	Price:    100,
	// 	Quantity: 1,
	// 	IsBuy:    false,
	// 	Sequence: 1,
	// }

	// sellOrder1 := engine.Order{
	// 	TraderId: 1,
	// 	Price:    103,
	// 	Quantity: 1,
	// 	IsBuy:    false,
	// 	Sequence: 1,
	// }

	// buyOrder := engine.Order{
	// 	TraderId: 2,
	// 	Price:    105,
	// 	Quantity: 7,
	// 	IsBuy:    true,
	// 	Sequence: 2,
	// }

	//channnel
	orders := make(chan engine.Order)

	go func() {}()
	go market.Run(orders)
	orders <- engine.Order{
		TraderId: 1,
		Price:    100,
		Quantity: 1,
		IsBuy:    false,
		Sequence: 1,
	}
	orders <- engine.Order{
		TraderId: 2,
		Price:    100,
		Quantity: 1,
		IsBuy:    true,
		Sequence: 1,
	}
	close(orders)

	fmt.Println("Hello")

}
