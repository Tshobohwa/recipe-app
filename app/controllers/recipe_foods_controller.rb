class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_id = params[:recipe_id]
    food_name = recipe_food_params[:food_name]
    quantity = recipe_food_params[:quantity]
    food = Food.find_by(name: food_name)

    return redirect_to new_recipe_recipe_food_path, notice: "No food with name: #{food_name}" unless food

    food_recipe

    recipe_food = RecipeFood.new(recipe_id: @recipe_id, food_id: food.id, quantity:)
    if recipe_food.save
      redirect_to show_recipe_path(recipe_id), notice: 'Ingredient added successfully.'
    else
      render :new, notice: 'An error occurred while adding the ingredient'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_name, :quantity)
  end
end
