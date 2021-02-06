class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
        @rsvp = Rsvp.new(event_id: params[:event_id], user_id: current_user.id)
    end

    def create
        @rsvp = Rsvp.new(rsvp_params)
        if @rsvp.save
            @event = Event.find(@comment.event_id)
            redirect_to event_path(@event)
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

    def set_rsvp
        @rsvp = rsvp.find(params[:id])
    end

    def rsvp_params
        params.require(:rsvp).permit(:status, :number_of_attendee)
    end
end
