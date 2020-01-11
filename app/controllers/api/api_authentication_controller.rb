class Api::ApiAuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token

  #for user login
  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  #to kill user session
  # def destroy
  # end

end
