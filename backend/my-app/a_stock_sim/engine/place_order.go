package engine

func (m *Market) PlaceOrder(order Order) {
	if order.IsBuy {
		m.BuyOrders = append(m.BuyOrders, order)
		m.SortOrdersD()
	} else {
		m.SellOrders = append(m.SellOrders, order)
		m.SortOrdersA()
	}
}
