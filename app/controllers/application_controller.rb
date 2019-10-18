class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :user_signed_in?, :current_user, :authorize_user!

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def authenticate_user!
    unless user_signed_in?
      flash[:alert] = "You must be signed-in"
      redirect_to new_session_path
    end
  end

  def authorize_user!
    resource = instance_variable_get("@#{controller_name.singularize}")

    unless can?(:manage, resource)
      flash[:alert] = "You are not allowed to #{action_name} #{controller_name}"
      redirect_to root_path
    end
  end


end
