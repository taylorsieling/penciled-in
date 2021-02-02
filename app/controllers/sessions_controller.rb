class SessionsController < ApplicationController

    def omniauth
        user = User.from_omniauth(auth)
        if user.valid?
            byebug
            user.save
            byebug
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            render :welcome
        end
    end

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
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
