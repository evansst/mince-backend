class User < ApplicationRecord
  has_many :recipe_cards
  has_many :recipes, through: :recipe_cards
end
