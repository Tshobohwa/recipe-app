class PublicRecipesController < ApplicationController
  def index
    begin
      @public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
    rescue StandardError => e
      flash.now[:error] = "There is no data or An error occurred: #{e.message}"
      @public_recipes = []
    end
  end
end
