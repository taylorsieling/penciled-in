class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    def index
        @rsvps = current_user.rsvps
    end

    def show
    end

    def new
        if params[:event_id] && !Event.exists?(params[:event_id])
            redirect_to events_path, alert: "Event not found."
        else
            @event = Event.find_by_id(params[:event_id])
            @rsvp = Rsvp.new
        end
    end

    def create
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvp.build(rsvp_params)
        @rsvp.user = current_user

        if @rsvp.save
          redirect_to event_path(@rsvp.event)
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
