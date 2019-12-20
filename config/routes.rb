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

  get 'jhall_dev', to: 'pages#jhall_dev'

  resources :blogs do 
    member do
      get :toggle_status
    end
  end

  # resources :api

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
 
end
