class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @amount_of_food_to_buy = @recipe.recipe_foods.length
    @total_value_of_food_needed = 0
    @recipe.recipe_foods.each do |recipe_food|
      total_value = recipe_food.quantity * recipe_food.food.price
      @total_value_of_food_needed += total_value
    end
  end
end
