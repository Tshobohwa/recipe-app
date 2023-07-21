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

  resources :users do
    resources :foods
    resources :recipes
    resources :public_recipes
  end

  resources :foods
  resources :recipes
  resources :public_recipes

  get'/shopping_list', to: 'shopping_lists#index'
  
  get '/public_recipes', to: 'public_recipes#index'
  get '/public_recipes/index', to: 'public_recipes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  delete 'foods/:id', to: 'foods#delete', as: 'delete_food'
end
