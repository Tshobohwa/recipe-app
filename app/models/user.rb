class User < ApplicationRecord
    has_many :recipes, clas_name: 'Recipe', foreign_key: :user_id: :destroy
    has_many :foods, class_name: 'Food' foreign_key: :user_id: :destroy

    validates :name, presence: true
end
