class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_admin
    if session[:username]
      Current.admin = Admin.find_by(username: session[:username])
    else
      redirect_to adminaccess_path
    end
  end

  private

  # Sets the current logged-in user for the session
  def set_current_user
    @current_user = User.find_by(username: session[:user_username]) if session[:user_username]

    # Log current user information
    if @current_user
      Rails.logger.info "Current user: #{@current_user.username}"
    else
      Rails.logger.info "No user logged in."
    end
  end

  # Redirects to login if no user is logged in
  def authenticate_user!
    unless @current_user
      flash[:alert] = "You must be logged in to perform this action."
      redirect_to login_path
    end
  end
end
