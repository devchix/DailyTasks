class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user

  private
    # For right now, using rails default session
    def current_user
      return session[:user] || User.new
    end
end
