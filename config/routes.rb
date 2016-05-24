Rails.application.routes.draw do
  
  resources :wikis
  resources :charges, only: [:new, :create]

  get 'about'=> 'welcome#about'

  devise_for :users 
  resources :users, only: :show
  root 'welcome#index'
  
  get 'registration_edit' =>'registrations#edit'
  
  
end
