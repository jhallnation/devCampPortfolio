class Api::ApiPortfolioController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:destroy, :new, :create, :update, :edit]

  # GET /portfolio
  def portfolio
    @portfolio_items = Portfolio.order('created_at DESC')

    render json: @portfolio_items
  end

  def new
    puts '###new###'
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
end
