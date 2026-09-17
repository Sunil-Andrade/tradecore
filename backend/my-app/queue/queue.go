package queue

import "stock/models"

type Queue struct {
	orders []models.Order
}

func (q *Queue) Enqueue(order models.Order) {
	q.orders = append(q.orders, order)
}

func (q *Queue) Dequeue() models.Order {
	order := q.orders[0]
	q.orders = q.orders[1:]
	return order
}

func (q *Queue) Peek() models.Order {
	return q.orders[0]
}

func (q *Queue) IsEmpty() bool {
	return len(q.orders) == 0
}
