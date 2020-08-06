class Api::ApiBlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :require_login, only: [:destroy, :new, :create, :update, :edit]
    before_action :set_portfolio, only: [:blog_post]

  # GET /blog
  def blog
    @blogs = Blog.order('created_at DESC')

    render json: @blogs
  end

  def blog_post
    render json: @blog_post
  end

  private
 
  # def require_login
  #   unless logged_in?
  #     need to decide error message to respond and in react if it will redirect to error page, index, or display message on screen
  #   end
  # end

  def set_portfolio
    @blog_post = Blog.find(request.headers['blogPostID'])
  end
end