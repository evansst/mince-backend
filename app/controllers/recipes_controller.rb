class RecipesController < ApplicationController
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
