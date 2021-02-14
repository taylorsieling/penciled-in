class EventsController < ApplicationController

    before_action :set_event, only: [:index, :show, :edit, :update, :destroy]
    before_action :find_category, only: [:new, :create, :update]

    def index
        if params[:category_id] && @category
            @events = @category.events.ordered_by_date.future
        else
            @events = Event.all.ordered_by_date.future
        end
    end

    def show
    end

    def new
        byebug
        if params[:category_id] && @category
            @event = @category.events.build
        else
            @event = Event.new
            @event.build_category
        end
    end

    def create
        if @category
            @event = @category.events.build(event_params)
            @event.user = current_user
        else
            @event = current_user.events.build(event_params)  
        end
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        @category
        if @event.update(event_params)
            byebug
            redirect_to event_path(@event)
        else
            render "new"
        end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    def most_popular
        @events = Event.most_rsvps.future.ordered_by_date.limit(3)
    end

    def happening_today
        @events = Event.happening_today
    end

    def past_events
        @events = Event.past.ordered_by_date
    end

    private

    def set_event
        @event = Event.find_by_id(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, :category_id, category_attributes: [:name])
    end

    def find_category
        @category = Category.find_by_id(params[:category_id])
    end

end
