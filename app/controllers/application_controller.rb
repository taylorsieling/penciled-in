class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?
    helper_method :authorized 
    helper_method :authorized_to_edit

    skip_before_action :verify_authenticity_token
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
            flash[:message] = "Please login to view that page."
            redirect_to login_path
        end
    end

    def check_if_logged_in
        redirect_to user_path(current_user) if logged_in?
    end

end
