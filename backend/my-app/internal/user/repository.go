package user

type Repository struct {
	users []User
}

func NewRepository() *Repository {
	return &Repository{
		users: []User{},
	}
}

func (r *Repository) Create(user User) {
	r.users = append(r.users, user)
}
