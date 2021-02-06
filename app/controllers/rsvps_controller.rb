class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    def index
        @rsvps = current_user.rsvps.all
    end

    def show
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @rsvp = @category.rsvps.build
        else
            @rsvp = rsvp.new
            @rsvp.build_category
        end
    end

    def create
        @rsvp = current_user.rsvps.new(rsvp_params)
        byebug
        if @rsvp.save
            redirect_to rsvp_path(@rsvp)
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @rsvp.update(rsvp_params)
            redirect_to rsvp_path(@rsvp)
        else
            render "new"
        end
    end

    def destroy
        @rsvp.destroy
        redirect_to rsvps_path
    end

    private

    def set_rsvp
        @rsvp = rsvp.find(params[:id])
    end

    def rsvp_params
        params.require(:rsvp).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, category_attributes: [:name])
    end
end
