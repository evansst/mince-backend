class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  def show
    @recipe = Recipe.find(index[:id])

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
