Rails.application.routes.draw do
  get 'users/index'
  get 'users/create'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/destroy'
  get 'recipes/index'
  get 'recipes/create'
  get 'recipes/new'
  get 'recipes/edit'
  get 'recipes/show'
  get 'recipes/destroy'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/create'
  get 'pages/hello'

  resources :users do
    resources :foods
    resources :recipes
  end

  resources :foods
  resources :recipes

  get'/shopping_list', to: 'shopping_lists#index'
  
  get '/public_recipes', to: 'public_recipes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
