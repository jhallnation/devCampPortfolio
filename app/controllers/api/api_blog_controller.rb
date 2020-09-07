class Api::ApiBlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :destroy_image]
  before_action :set_blog, only: [:blog_post, :update, :destroy, :destroy_image]

  # GET /blog
  def blog
    @blogs = Blog.all.page(params[:page]).per(10).order("created_at DESC")

    render json: { blogs: @blogs, meta: { total_pages: @blogs.total_pages, total_blogs: Blog.count } }
  end

  def blog_post
    render json: @blog
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: { 'new_edit_blog': true }
    else
      render json: { 'new_edit_blog': false }
    end
  end

  def destroy
    #To remove images from s3
    @blog.remove_main_image!

    if @blog.destroy
      render json: { 'delete_blog_post': true }
    else
      render json: { 'delete_blog_post': false }
    end
  end

  def update
    if @blog.update(blog_params)
      render json: { 'new_edit_portfolio': true, 'blog': @blog }
    else
      render json: { 'new_edit_portfolio': false }
    end
  end

  def destroy_image
    if request.headers['imageToDelete'] == 'main_image'
      @blog.remove_main_image!
      @blog.save
      render json: { 'delete_blog_image': true }
    else
      render json: { 'delete_blog_image': false }
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
    params.require(:blog).permit(:title, :body, :topic_id, :status, :main_image)
  end

  def set_blog
    @blog = Blog.find(request.headers['blogPostID'])
  end
end