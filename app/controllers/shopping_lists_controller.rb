class ShoppingListsController < ApplicationController
    def index
        @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
        # @recipe_foods = RecipeFood.includes(:food, :recipe).where(recipes: { user: current_user })
        # foods = 
    end
end
