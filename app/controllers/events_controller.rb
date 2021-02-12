class EventsController < ApplicationController

    before_action :set_event, only: [:show, :edit, :update, :destroy]
    helper_method :readable_date, :readable_time

    def index
        @events = Event.ordered_by_date
    end

    def show
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @event = @category.events.build
        else
            @event = Event.new
            @event.build_category
        end
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

    def destroy
        @event.destroy
        redirect_to events_path
    end

    def most_popular
        @events = Event.most_popular
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :location, category_attributes: [:name])
    end

    # def readable_date
    #     strftime("%b %d, %Y")
    # end

    # def readable_time
    # end

end
