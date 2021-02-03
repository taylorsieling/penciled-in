class EventsController < ApplicationController

    before_action :set_event, only: [:show, :edit, :update]

    def index
        @events = Event.ordered_by_date
    end

    def show
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.new(event_params)
        byebug
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render "new"
        end
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, :category)
    end


end
