class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    def index
        @user = current_user
        @rsvps = current_user.rsvps
    end

    def show
    end

    def new
        if params[:event_id] && !Event.exists?(params[:event_id])
            redirect_to events_path, alert: "Event not found."
        else
            @event = Event.find_by_id(params[:event_id])
            byebug
            @rsvp = @event.rsvps.build
        end
    end

    def create
        
        @rsvp = @event.rsvps.build(rsvp_params)
        byebug
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


def new
    if params[:chocolate_id] && !Chocolate.exists?(params[:chocolate_id])
      redirect_to chocolates_path, alert: "Chocolate not found."
    else
      @chocolate = Chocolate.find_by_id(params[:chocolate_id])
      @review = @chocolate.reviews.build
    end
  end

  def create
    @chocolate = Chocolate.find_by_id(params[:chocolate_id])
    @review = @chocolate.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to chocolate_path(@review.chocolate)
    else
      render :new
    end
  end