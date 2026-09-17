package models

type Trader struct {
	ID      int
	Balance int
	Shares  int
}

type Stock struct {
	Name  string
	Price int
}

type Order struct {
	ID       int
	TraderID int
	Price    int
	Quantity int
	IsBuy    bool
	Sequence int64
}

type Trade struct {
	BuyerID  int
	SellerID int
	Price    int
	Quantity int
}
