Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'log_in', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'angular-items', to: 'portfolios#angular'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  
  get 'tech-news', to: 'pages#tech_news'

  # get 'jhall_dev', to: 'pages#jhall_dev'

  resources :blogs do 
    member do
      get :toggle_status
    end
  end

  # api routes

  get 'api/portfolio', to: 'api/api_portfolio#portfolio'

  # devise_scope :user do
  #   post 'api/login', to: 'api/api_authentication#create'
  #   get 'api/logged_in', to: 'api/api_authentication#logged_in'
  #   delete 'api/logout', to: 'api/api_authentication#destroy'
  # end

  # get 'api/logout', to: 'api#destroy'

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
 
end
