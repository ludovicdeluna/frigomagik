Rails.application.routes.draw do
  root "home#index"
  post "recipes/search"
  get "recipes/:id", to: "recipes#show", as: "recipes_show"

  get "/with_react", to: "with_react#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
