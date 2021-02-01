class UsersController < ApplicationController

    def index
    end

    def show
    end

    def new
    end

    def create 
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def current_user
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
   
end
