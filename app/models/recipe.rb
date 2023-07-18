class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many: :recipe_foods, class_name: 'RecipeFood', foreign_key: :recipe_id: :destroy
  has_many: :foods, through: :recipe_foods

  validates :name, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: { greater_than_or_equal_to:0 }
  validates :public, inclusion: [true, false]
end
