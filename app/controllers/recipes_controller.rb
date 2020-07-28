class RecipesController < ApplicationController
  def index
    @recipes = if params['name']
                # Recipe.where(name: params['name'])
                Recipe.where("name LIKE ?", "%" + params['name'].downcase + "%")
              else
                Recipe.all.sample(9)
              end

    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])

    render json: @recipe
  end

  def create
    @recipe = Recipe.create(
      name: params[:name],
      url: params[:url],
      image: params[:image],
      ingredients: params[:ingredients]
    )

    redirect_to("http://localhost:3001/recipe.html?id=#{@recipe.id}")
  end
end
