Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas, only: [:create, :edit, :update, :destroy]
  
  post '/increase', to: 'ideas#increasequal'
  post '/decrease', to: 'ideas#decreasequal'
end
