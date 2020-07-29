# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# RECIPE SEEDS
# Add as many terms as you like to this array, and it should still work.  Just add a word without any commas

# Recipe.destroy_all

search_array = %w[bread flour sugar milk eggs beef chicken pork turkey fish potatoes onions garlic tomatoes shallots
                  apple orange basil spinach avocado rice butter cheese onion corn lamb shrimp bacon coconut beets
                  pasta sphaghetti ravioli linguini penne steak burger sandwhich noodles chicken beef broccoli soy
                  breakfast lunch dinner]

# counter = 1

# search_array.each do |search_term|
#   base_url1 = "https://api.edamam.com/search?q=#{search_term}&app_id=0bc71582&app_key=28c7d1686792de154523a2e314dc54c3&from=0&to=100"
#   base_url2 = "https://api.edamam.com/search?q=#{search_term}s&app_id=0ea652a3&app_key=01e1c856909da6cd7fed1505d85975a9&from=0&to=100"

#   data1 = RestClient.get(base_url1)
#   data2 = RestClient.get(base_url2)

#   recipe_data = JSON.parse(data1)['hits'] + JSON.parse(data2)['hits']

#   recipe_data.each do |recipe|
#     Recipe.find_or_create_by(name: recipe['recipe']['label'].titlecase) do |our_recipe|
#       our_recipe.url = recipe['recipe']['url']
#       our_recipe.image = recipe['recipe']['image']
#       our_recipe.ingredients = recipe['recipe']['ingredientLines']
#     end
#   end
#   p "search term #{counter} added to seeds! #{Recipe.all.count} recipes in the DB"
#   counter += 1
#   sleep(13) unless search_term == search_array.last
# end

# USER SEEDS

RecipeCard.destroy_all
ShoppingList.destroy_all
User.destroy_all

10.times do
  name = Faker::Name.name
  user = User.create(
    name: name,
    user_name: Faker::Internet.username(specifier: name, separators: %w[. _ -])
  )
  ShoppingList.create(user_id: user.id)
  3.times do
    RecipeCard.create(
      user_id: user.id,
      recipe_id: Recipe.all.sample.id
    )
  end

  user.recipes.each do |recipe|
    user.shopping_list.ingredients += recipe.ingredients
  end
  user.shopping_list.save!
end
