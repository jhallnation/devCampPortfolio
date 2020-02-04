class Api::ApiAuthenticationController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  acts_as_token_authentication_handler_for User, fallback: :none

  #for user login

  def create
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password]) && user.role == :site_admin
      render json: user.as_json(only: [:email, :authentication_token]), status: :created
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unauthorized
    end
  end

  def logged_in
    user = User.find_by_email(request.headers['jhUserEmail'])
    if user.present? == false
      render json: { 'logged_in': false }
    else 
      user = User.find_by_email(request.headers['jhUserEmail'])
      if user.authentication_token == request.headers['Authorization']
        render json: { 'logged_in': true }
      else
        render json: { 'logged_in': false }
      end
    end
  end
  # def create
  #   @user = User.where(email: params[:email]).first
  #   puts '#############'
  #   puts @user.roles
  #   puts '#############'

  #   if @user&.valid_password?(params[:password]) && @user.site_admin == true
  #     render json: @user.as_json(only: [:email, :authentication_token]), status: :created
  #   else
  #     head(:unauthorized)
  #   end
  # end

  #to kill user session
  # def destroy
  # end

end
