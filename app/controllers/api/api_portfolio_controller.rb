class Api::ApiPortfolioController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :destroy_image]
  before_action :set_portfolio, only: [:update, :destroy, :destroy_image]

  # GET /portfolio
  def portfolio
    @portfolio_items = Portfolio.order('created_at DESC')

    render json: @portfolio_items
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      render json: { 'new_edit_portfolio': true }
    else
      render json: { 'new_edit_portfolio': false }
    end
  end

  def destroy
    #To remove images from s3
    @portfolio_item.remove_thumb_image!
    @portfolio_item.remove_main_image!
    @portfolio_item.remove_logo!

    if @portfolio_item.destroy
      render json: { 'delete_portfolio': true }
    else
      render json: { 'delete_portfolio': false }
    end
  end

  def update
    if @portfolio_item.update(portfolio_params)
      render json: { 'new_edit_portfolio': true }
    else
      render json: { 'new_edit_portfolio': false }
    end
  end

  def destroy_image
    if request.headers['imageToDelete'] == 'thumb_image'
      @portfolio_item.remove_thumb_image!
      @portfolio_item.save
      render json: { 'delete_portfolio_image': true }
    elsif request.headers['imageToDelete'] == 'main_image'
      @portfolio_item.remove_main_image!
      @portfolio_item.save
      render json: { 'delete_portfolio_image': true }
    elsif request.headers['imageToDelete'] == 'logo'
      @portfolio_item.remove_logo!
      @portfolio_item.save
      render json: { 'delete_portfolio_image': true }
    else
      render json: { 'delete_portfolio_image': false }
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

  def portfolio_params
    params.require(:portfolios).permit(:title, 
                                       :subtitle, 
                                       :body, 
                                       :main_image,
                                       :thumb_image,
                                       :logo,
                                       :work_type,
                                       :url,
                                       :remove_main_image,
                                       :remove_thumb_image,
                                       :remove_logo,
                                       technologies_attributes: [:id, :name, :_destroy]
                                       )
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(request.headers['portfolioItemID'])
  end
end
