class Api::ApiAuthenticationController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  #for user login

  def create
    user = User.find_by_email(params[:email])

    puts '##############'
    puts user.role
    puts '##############'

    if user && user.valid_password?(params[:password]) && user.role == :site_admin
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unauthorized
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
