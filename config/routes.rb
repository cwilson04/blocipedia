Rails.application.routes.draw do
  
  resources :wikis do
    resources :collaborators, only: [:destroy, :create]
  end
  resources :charges, only: [:new, :create]

  get 'about'=> 'welcome#about'

  devise_for :users 
  resources :users, only: :show
  root 'welcome#index'
  
  get 'registration_edit' =>'registrations#edit'
  put 'downgrade' => 'users#downgrade'
  
  
end
