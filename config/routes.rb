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

  # API ROUTES

  # api portfolio routes
  get 'api/portfolio', to: 'api/api_portfolio#portfolio'
  get 'api/portfolio/item', to: 'api/api_portfolio#portfolio_item'
  post 'api/portfolio/new', to: 'api/api_portfolio#create'
  delete 'api/portfolio/delete', to: 'api/api_portfolio#destroy'
  patch 'api/portfolio/edit', to: 'api/api_portfolio#update'
  delete 'api/portfolio/delete-image', to: 'api/api_portfolio#destroy_image'

  #blog
  get 'api/blog', to: 'api/api_blog#blog'
  get 'api/blog/post', to: 'api/api_blog#blog_post'
  delete 'api/blog/delete', to: 'api/api_blog#destroy'
  post 'api/blog/new', to: 'api/api_blog#create'
  patch 'api/blog/edit', to: 'api/api_blog#update'
  delete 'api/blog/delete-image', to: 'api/api_blog#destroy_image'

  #sports blog
  get 'api/sports-blog', to: 'api/api_sports_blog#sports_blog'
  get 'api/sports-blog/post', to: 'api/api_sports_blog#sports_blog_post'
  delete 'api/sports-blog/delete', to: 'api/api_sports_blog#destroy'
  post 'api/sports-blog/new', to: 'api/api_sports_blog#create'
  patch 'api/sports-blog/edit', to: 'api/api_sports_blog#update'
  delete 'api/sports-blog/delete-image', to: 'api/api_sports_blog#destroy_image'

  #api authentication routes
  devise_scope :user do
    post 'api/login', to: 'api/api_authentication#create'
    get 'api/logged_in', to: 'api/api_authentication#logged_in'
    delete 'api/logout', to: 'api/api_authentication#destroy'
  end

  get 'api/logout', to: 'api#destroy'

  # END OF API ROUTES

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
 
end