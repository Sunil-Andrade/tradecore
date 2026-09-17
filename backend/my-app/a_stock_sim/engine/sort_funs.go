package engine

import (
	"slices"
)

func (m *Market) SortOrdersD() {
	slices.SortFunc(m.BuyOrders, func(a, b Order) int {
		return b.Price - a.Price
	})
}

func (m *Market) SortOrdersA() {
	slices.SortFunc(m.SellOrders, func(a, b Order) int {
		return a.Price - b.Price
	})
}
