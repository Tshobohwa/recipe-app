class ShoppingListsController < ApplicationController
    def index
        @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    end
end
