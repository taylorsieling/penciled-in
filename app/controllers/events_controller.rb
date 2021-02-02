class EventsController < ApplicationController

    before_action :set_event, only: [:show]

    def index
        @events = Event.ordered_by_date
    end

    def show
    end

    def new
        @event = Event.new
    end

    def create
        byebug
        @event = current_user.events.build(event_params)
        if @event.save
            byebug
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location)
    end


end
