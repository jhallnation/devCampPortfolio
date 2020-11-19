class Api::ApiSportsBlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:destroy, :update, :destroy_image]
  before_action :set_blog, only: [:sports_blog_post, :update, :destroy, :destroy_image]

  # GET /blog
  def sports_blog
    @blogs = SportsBlog.all.page(params[:page]).per(5).order("created_at DESC")

    render json: { blogs: @blogs, meta: { total_pages: @blogs.total_pages, total_blogs: SportsBlog.count } }
  end

  def sports_blog_post
    render json: @blog
  end

  def create
    @blog = SportsBlog.new(blog_params)

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
      render json: { 'delete_blog': true }
    else
      render json: { 'delete_blog': false }
    end
  end

  def update
    if @blog.update(blog_params)
      render json: { 'new_edit_blog': true, 'blog': @blog }
    else
      render json: { 'new_edit_blog': false }
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
    params.require(:blog).permit(:title, :body, :status, :main_image)
  end

  def set_blog
    @blog = SportsBlog.find(request.headers['blogPostID'])
  end
end