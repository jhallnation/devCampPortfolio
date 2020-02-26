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

  # checked if logged in
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

  #to kill user session
  def destroy
    user = User.find_by_email(request.headers['jhUserEmail'])
    if user.present? == false
      render json: { errors: { 'email' => ['is invalid'] } }, status: :bad_request
    else
      user.reset_authentication_token!
      render json: { 'logged_in': false }, status: :ok
    end
  end

end
