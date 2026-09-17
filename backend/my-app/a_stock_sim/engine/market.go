package engine

type Trader struct {
	Id      int
	Balance int
	Shares  int
}

type Stock struct {
	Name  string
	Price int
}

type Order struct {
	TraderId int
	Price    int
	Quantity int
	IsBuy    bool
	Sequence int
}

type Trade struct {
	BuyerId  int
	SellerId int
	Price    int
	Quantity int
}

type Market struct {
	Stock Stock

	Traders map[int]*Trader

	BuyOrders  []Order
	SellOrders []Order

	Trades []Trade
}
