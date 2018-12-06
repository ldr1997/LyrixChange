class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def user_logged_in
    	if !session[:user_id]
      		redirect_to login_path, notice: "ERROR: Must be logged in to see this."
    	end
    end
end
