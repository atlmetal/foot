Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # resources :players, only: [:index, :show, :create, :update]
  resources :players
  resources :clubs
  resources :federations

  #peticion GET /index al controlador health, metodo health
  get '/health', to: 'health#health'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
