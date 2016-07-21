class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
end
