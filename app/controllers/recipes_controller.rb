class RecipesController < ApplicationController
    def index
        if params["name"]
            @recipes = Recipe.where(name: params["name"])
            render json: @recipes
        else
            @recipes = Recipes.all
            render json: @recipes
        end
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
