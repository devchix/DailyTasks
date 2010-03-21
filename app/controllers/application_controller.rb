class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user, :logged_in?

  # call this in before filter for actions needed to require login
  protected
    def login_required
      redirect_to root_path unless logged_in?
    end

  private
    # For right now, using rails default session
    def current_user
      session[:user] || false
    end

    def logged_in?
      current_user || false
    end
end
