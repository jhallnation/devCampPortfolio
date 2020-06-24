class Api::ApiPortfolioController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :edit]

  # GET /portfolio
  def portfolio
    @portfolio_items = Portfolio.order('created_at DESC')

    render json: @portfolio_items
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      render json: { 'new_portfolio': true }
    else
      render json: { 'new_portfolio': false }
    end
  end

  private
 
  def require_login
    puts '#######require_login############'
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
                                       :work_type,
                                       technologies_attributes: [:id, :name, :_destroy]
                                       )
  end
end
