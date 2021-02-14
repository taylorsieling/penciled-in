class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]
    before_action :authorized, except: [:new, :create]
    before_action :check_if_logged_in, only: [:new]


    def show
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Account Created Successfully"
            redirect_to user_path(@user)
        else
            @errors = @user.errors
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def set_user
        @user = current_user
    end

    def user_params
        params.require(:user).permit(:username, :password, :email, :password_confirmation)
    end

    def update_params
        params.require(:user).permit(:username, :password, :email)
    end
   
end