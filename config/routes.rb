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


  resources :recipes
  resources :foods
  resources :public_recipes, only: [:index]

  get '/recipes/:id', to: 'recipes#show', as: 'recipes_show'

  get'/shopping_list', to: 'shopping_lists#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  delete 'foods/:id', to: 'foods#delete', as: 'delete_food'
end
