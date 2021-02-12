class SessionsController < ApplicationController

    def omniauth
        byebug
        user = User.from_omniauth(auth)
        if user.save
            session[:user_id] = user.id 
            redirect_to new_event_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to 'login'
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end

end
