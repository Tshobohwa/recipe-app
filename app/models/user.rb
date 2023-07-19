class User < ApplicationRecord
  has_many :recipes, class_name: 'Recipe', foreign_key: :user_id, dependent: :destroy
  has_many :foods, class_name: 'Food', foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
end
