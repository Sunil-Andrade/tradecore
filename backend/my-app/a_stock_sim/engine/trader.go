package engine

import (
	"fmt"
	"math/rand"
)

func (t *Trader) Run(orders chan<- Order) {
	for {
		isBuy := rand.Intn(2) == 0
		randomOffest := rand.Intn(2)

		if isBuy {
		}
		if randomOffest == 2 {
		}

		select {
		case orders <- Order{}:
			fmt.Println("hello")
		}
	}
}
