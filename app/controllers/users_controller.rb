class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user, include: %i[recipes shopping_list]
  end

  def create
    @user = User.create(
      name: params[:name],
      user_name: params[:username]
    )
    ShoppingList.create(user_id: @user.id)

    redirect_to("http://localhost:3001/?user_id=#{@user.id}")
  end

  def destroy
    @user = User.find(params[:id])
    @user.shopping_list.destroy
    @user.recipe_cards.destroy_all
    @user.destroy

    redirect_to('http://localhost:3001?user_id=null')
  end

  def update
    @user = User.find(params[:id])

    if params[:delete]
      @user.shopping_list.ingredients.delete(params[:shopping_list])
    else
      @user.shopping_list.ingredients << params[:shopping_list]
    end
    @user.shopping_list.save!
    
    render json: @user, include: %i[recipes shopping_list]
  end
end
