package heap

import "stock/models"

type MaxHeap struct {
	orders []models.Order
}

type MinHeap struct {
	orders []models.Order
}

func (h *MaxHeap) Insert(order models.Order) {
	h.orders = append(h.orders, order)

	index := len(h.orders) - 1

	for index > 0 {
		parent := (index - 1) / 2

		if h.orders[parent].Price >= h.orders[index].Price {
			break
		}

		h.orders[parent], h.orders[index] = h.orders[index], h.orders[parent]

		index = parent
	}
}

func (h *MaxHeap) Peek() models.Order {
	return h.orders[0]
}

func (h *MaxHeap) Remove() models.Order {
	order := h.orders[0]

	last := len(h.orders) - 1

	h.orders[0] = h.orders[last]
	h.orders = h.orders[:last]

	index := 0

	for {
		left := 2*index + 1
		right := 2*index + 2

		largest := index

		if left < len(h.orders) &&
			h.orders[left].Price > h.orders[largest].Price {
			largest = left
		}

		if right < len(h.orders) &&
			h.orders[right].Price > h.orders[largest].Price {
			largest = right
		}

		if largest == index {
			break
		}

		h.orders[index], h.orders[largest] =
			h.orders[largest], h.orders[index]

		index = largest
	}

	return order
}

func (h *MinHeap) Insert(order models.Order) {
	h.orders = append(h.orders, order)

	index := len(h.orders) - 1

	for index > 0 {
		parent := (index - 1) / 2

		if h.orders[parent].Price <= h.orders[index].Price {
			break
		}

		h.orders[parent], h.orders[index] =
			h.orders[index], h.orders[parent]

		index = parent
	}
}

func (h *MinHeap) Peek() models.Order {
	return h.orders[0]
}

func (h *MinHeap) Remove() models.Order {
	order := h.orders[0]

	last := len(h.orders) - 1

	h.orders[0] = h.orders[last]
	h.orders = h.orders[:last]

	index := 0

	for {
		left := 2*index + 1
		right := 2*index + 2

		smallest := index

		if left < len(h.orders) &&
			h.orders[left].Price < h.orders[smallest].Price {
			smallest = left
		}

		if right < len(h.orders) &&
			h.orders[right].Price < h.orders[smallest].Price {
			smallest = right
		}

		if smallest == index {
			break
		}

		h.orders[index], h.orders[smallest] =
			h.orders[smallest], h.orders[index]

		index = smallest
	}

	return order
}

func (h *MaxHeap) IsEmpty() bool {
	return len(h.orders) == 0
}

func (h *MinHeap) IsEmpty() bool {
	return len(h.orders) == 0
}
