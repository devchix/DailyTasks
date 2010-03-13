class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  private
    # For right now, using rails default session
    def current_user_session
      @current_user_session = session
    end

    def current_user
      return session[:user] if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
