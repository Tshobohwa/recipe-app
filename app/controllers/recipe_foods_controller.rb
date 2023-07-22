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

    @existing_recipe_food = RecipeFood.find_by(food_id: food.id, recipe_id: @recipe_id)

    if @existing_recipe_food.present?
      @existing_recipe_food.update(quantity: @existing_recipe_food.quantity.to_f + quantity.to_f)
      redirect_to recipe_path(@recipe_id), notice: 'Ingredient updated successfully successfully.'
    else
      recipe_food = RecipeFood.new(recipe_id: @recipe_id, food_id: food.id, quantity:)
      return render :new, notice: 'An error occurred while adding the ingredient' unless recipe_food.save

      redirect_to recipe_path(@recipe_id), notice: 'Ingredient added successfully.'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    food_name = recipe_food_params[:food_name]
    quantity = recipe_food_params[:quantity]
    food = Food.find_by(name: food_name)

    if @recipe_food.update(food_id: food.id, quantity:)
      redirect_to recipe_path(params[:recipe_id]), notice: 'Ingredient updated successfully'
    else
      render :edit, notice: 'An error occurred while updating the ingredient'
    end
  end

  def destroy
    recipe_food_id = params[:id]
    recipe_id = params[:recipe_id]
    if RecipeFood.destroy(recipe_food_id)
      redirect_to recipe_path(recipe_id), notice: 'recipe food removed successfuly!'
    else
      redirect_to recipe_path(recipe_id), notice: 'An error occured while removing the recipe food!'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_name, :quantity)
  end
end
