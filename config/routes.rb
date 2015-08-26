Rails.application.routes.draw do

  resources :ideas, only: [:create, :destroy]
  
  root 'ideas#index'
end
