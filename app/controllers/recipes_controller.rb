class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).all
    @user = @current_user
  end

  def new
    @user = @current_user
    @recipe = Recipe.new
  end

  def create
    @user = @current_user
    @recipe = @user.recipes.build(recipe_param)

    if @recipe.save
      redirect_to user_recipes_path, notice: 'User successfully created'
    else
      flash.now[:error] = @recipe.errors.full_messages.to_sentence
      render :new
    end
    p @recipe.errors.full_messages.to_sentence
  end

  def show
    @user = @current_user
    @recipe = Recipe.includes(:user).find(params[:id])
    render :show
  end

  def destroy
    @recipe = @current_user.recipes.find(params[:id])

    if @recipe.destroy
      redirect_to user_recipes_path(@current_user, @recipe), notice: 'User was successfully destroyed'
    else
      p @recipe.errors.full_messages
    end
  end

  private

  def recipe_param
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
