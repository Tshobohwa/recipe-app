Rails.application.routes.draw do
  get 'pages/hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  delete 'foods/:id', to: 'foods#delete', as: 'delete_food'
end
