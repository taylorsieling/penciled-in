class UsersController < ApplicationController

    def index
    end

    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
   
end
