class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user, :logged_in?, :admin?, :authorize

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize
    redirect_to login_path unless current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user.admin
  end
end
