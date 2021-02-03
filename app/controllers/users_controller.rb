class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def index
    end

    def show
        if session[:user_id] != @user.id
            redirect_to root_path
        end
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        byebug
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @errors = @user.errors
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