class ShoppingListsController < ApplicationController

    def index
        @shopping_lists = ShoppingList.all
        render json: @shopping_lists
    end
    def create
        @shopping_list = ShoppingList.create(
            user_id = params[:user_id],
            ingredients = params[:ingredients]
        )
    end

    redirect_to("http://localhost:3001/shopping_list.html?id=#{@shopping_list.id}")

    def update
        @shopping_list = ShoppingList.find(params[:id])
        @shopping_list.update(
          user_id: params[:user_id],
          ingredients: params[:ingredients]
        )
    redirect_to("http://localhost:3001/shopping_list.html?id=#{@shopping_list.id}")
end
