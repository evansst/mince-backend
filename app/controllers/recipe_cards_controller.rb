class RecipeCardsController < ApplicationController
  def index
    @recipe_cards = RecipeCard.all

    render json: @recipe_cards
  end

  def show
    @recipe_card = RecipeCard.find(params[:id])

    render json: @recipe_card
  end

  def create
    @recipe_card = RecipeCard.create(
      user_id: params[:user_id],
      recipe_id: params[:recipe_id]
    )

    redirect_to("http://localhost:3001/user.html?user_id=#{@user.id}")
  end

  def destroy
    @recipe_card = RecipeCard.find(params[:id])
    @recipe = Recipe.find(@recipe_card.recipe_id)
    @recipe_card.destroy

    render json: { message: "#{@recipe.name} has been removed from your favorites!" }
  end
end
