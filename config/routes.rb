Rails.application.routes.draw do
  resources :shopping_lists, only: [:index, :create]
  resources :recipe_cards
  resources :users
  resources :recipes, only: %i[index show create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
