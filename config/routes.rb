Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
end
