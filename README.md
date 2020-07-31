# Mince. 


## Table of Contents
* [About](#about-mince)
* [Video](#mince-walkthrough-video)
* [Techonologies](#technologies)
* [Setup](#setup)
* [Code Examples](#code-examples)
* [Features](#mince-features)
* [Status](#status)
* [Why mince](#why-mince)
* [Contact](#contact)
* [License](#license)

## About Mince
Mince is a full-stack web application that pulls from over 5,000 existing recipes through the utilization of RESTful APIs. Users can type in a certain type of dish they are looking for such as "chicken" and be taken to all the chicken recipes available. If logged in, the user can also create a list of their favorite recipes and shopping list! When they are ready to make the meal, users have the option of viewing the entire recipe guide for step-by-step guidance.


## Mince Walkthrough Video
<!-- [Mince Walkthrough](https://youtu.be/eMHFxcF2l08) -->

## Technologies
* Ruby - version 2.6.1
* Rails - version 6.0.3
* PostgreSQL - version 12.3
* HTML5 / CSS3

## Setup

1. Fork and clone this repository.  
1. Visit (https://developer.edamam.com) and sign up for a developer api key.
1. Insert your app_id and app_key into the search URL in mince/back-end/db/seeds.rb
1. Run ~ bundle
1. Start your Postgresql server with ~ pg_ctl -D /usr/local/var/postgres start  
1. Refer to (https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)  for troublshooting.
1. Run ~ rails db:{create,migrate,seed}
1. Run ~ rails s to start your rails server.
1. Refer to the front-end README for the rest of your setup!




## Code Examples

```
  def index
    @recipes = if params['name']
                 Recipe.where('lower(name) LIKE ?', "%#{params['name'].downcase}%")
               elsif params['sample']
                 Recipe.all.sample(params['sample'].to_i)
               elsif params['ingredient']
                 Recipe.where('ANY(ingredients) ILIKE :ingredient', "%#{params['ingredient']}%")
               else
                 Recipe.all
               end

    render json: @recipes
  end
```

```
  search_array.each do |search_term|
    base_url1 = "https://api.edamam.com/search?q=#{search_term}&app_id=#{app_id}&app_key=#{app_key}&from=0&to=100"

    data1 = RestClient.get(base_url1)

    recipe_data = JSON.parse(data1)['hits']

    recipe_data.each do |recipe|
      Recipe.find_or_create_by(name: recipe['recipe']['label'].titlecase) do |our_recipe|
        our_recipe.url = recipe['recipe']['url']
        our_recipe.image = recipe['recipe']['image']
        our_recipe.ingredients = recipe['recipe']['ingredientLines']
      end
    end
    p "search term #{counter} added to seeds! #{Recipe.all.count} recipes in the DB"

    counter += 1

    sleep(13) unless search_term == search_array.last
  end
```

## Mince Features
* Display sample of recipes from 5,000
* Filter through recipes through the search bar
* Go to full recipe page for step by step instruction on how to make the dish
* If logged-in, create a list of favorite recipes
* If logged-in, add items to user's shopping list based on recipe ingredients


To-Do List:
* Increase data size to provide up to 10k+ recipes
* Add 'viewed' tag to allow the user to know which recipes have already been viewed

## Status
Completed.

This app is built to carry out the CRUD framework

## Why Mince?
We created this app based on our own affinity for cooking and finding new recipes to use. We wanted this app to be personalized and flexible and uncomplicated for some apps on the market tend to look busy and not as easy to use.

## Contact
Created by [Sam Evans](https://www.linkedin.com/in/evansst/) and [Nyaradzo Bere](http://www.linkedin.com/in/nyaradzo-bere)

## License
[View Here](License.txt)