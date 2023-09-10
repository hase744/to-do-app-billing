Rails.application.routes.draw do
  root "user/todos#index"
  namespace :user do
    resources :todos
    resource :cards
    get 'todos/achieve/:id',to: 'todos#achieve', as: 'todo_achieve'
    get 'todos/fail/:id',to: 'todos#failure', as: 'todo_fail'
    get 'user/search', as:'search_user'
    get 'cards/create'
    get 'cards/update'
  end
  get 'abouts/index', as: "about"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
