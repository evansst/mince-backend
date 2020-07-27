# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'
require 'byebug'



# ingredient_array = %w[bread flour sugar milk eggs] done
# ingredient_array = %w[beef chicken pork turkey fish] done
# ingredient_array = %w[potatoes onions garlic tomatoes shallots] done
# ingredient_array = %w[apple orange basil spinach avocado] done
# ingredient_array = %w[rice butter cheese onion corn] done
# ingredient_array = %w[lamb shrimp bacon coconut beets] done
# ingredient_array = %w[pasta sphaghetti ravioli linguini penne] done
ingredient_array = %w[steak burger sandwhich]


ingredient_array.each do |ingredient|

  base_url = "https://api.edamam.com/search?q=#{ingredient}&app_id=0bc71582&app_key=28c7d1686792de154523a2e314dc54c3&from=0&to=100"
  data = RestClient.get(base_url)
  full_data = JSON.parse(data)
  recipe_data = full_data['hits']

  recipe_data.each do |recipe|
    Recipe.find_or_create_by(name: recipe['recipe']['label']) do |our_recipe|
      our_recipe.url = recipe['recipe']['url']
      our_recipe.image = recipe['recipe']['image']
      our_recipe.ingredients = recipe['recipe']['ingredientLines']
    end
  end
end
