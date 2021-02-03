class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update]

    def index
        @categories = Category.all
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = new(category_params)
        if @category.save
            redirect_to category_path(@Category)
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @category.update(category_params)
            redirect_to category_path(@category)
        else
            render "new"
        end
    end

    private

    def set_Category
        @category = category.find(params[:id])
    end

    def Category_params
        params.require(:category).permit(:name)
    end

end
