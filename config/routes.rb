Rails.application.routes.draw do
  resources :shopping_lists, only: %i[index create show destroy update]
  resources :recipe_cards, only: %i[index show create destroy]
  resources :users, only: %i[index show create destroy update]
  resources :recipes, only: %i[index show create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
