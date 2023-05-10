Rails.application.routes.draw do
  resources :customers
  resources :activities
  resources :payments

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
end
