Rails.application.routes.draw do
  resources :customers
  resources :activities


  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
end
