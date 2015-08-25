Rails.application.routes.draw do

  resources :ideas, only: [:create]
  
  root 'ideas#index'
end
