Rails.application.routes.draw do
  get 'recentpost/show'
  root to: "articles#index"
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  #Login routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #category controller
  resources :categories, except: [:destroy]

end
