class Api::ApiBlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :require_login, only: [:destroy, :new, :create, :update, :edit]

  # private
 
  # def require_login
  #   unless logged_in?
  #     need to decide error message to respond and in react if it will redirect to error page, index, or display message on screen
  #   end
  # end
end