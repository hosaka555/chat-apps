class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :require_login

  protected

  def not_authenticated
    redirect_to signup_path
  end
end
