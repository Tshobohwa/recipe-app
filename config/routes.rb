Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "users#index", as: :authenticated_root
    end
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :foods
  resources :recipes do
    resources :recipe_foods
  end
  resources :public_recipes

  get'recipes/:id/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  delete 'foods/:id', to: 'foods#delete', as: 'delete_food'
  delete "/recipes/:recipe_id/recipe_foods/:id", to: 'recipe_foods#destroy', as: 'delete_recipe_food'
  post '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#update', as: :update_recipe_food
end
