class Api::ApiBlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:create]
  before_action :set_portfolio, only: [:blog_post]

  # GET /blog
  def blog
    @blogs = Blog.all.page(params[:page]).per(10).order("created_at DESC")

    render json: { blogs: @blogs, meta: { total_pages: @blogs.total_pages, total_blogs: Blog.count } }
  end

  def blog_post
    render json: @blog_post
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: { 'new_edit_blog': true }
    else
      render json: { 'new_edit_blog': false }
    end
  end

  private
 
  def require_login
    user = User.find_by_email(request.headers['jhUserEmail'])
    if user.present? == false
      render json: { 'logged_in': false }
    else 
      if user.authentication_token == request.headers['Authorization']
        return true
      else
        render json: { 'logged_in': false }
      end
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end

  def set_portfolio
    @blog_post = Blog.find(request.headers['blogPostID'])
  end
end