class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]
    before_action :set_event, only: [:edit]

    def index
      @user = current_user
      @rsvps = current_user.rsvps
    end

    def show
    end

    def new
        @rsvp = Rsvp.new(event_id: params[:event_id], user_id: current_user.id)
        @event = @rsvp.event
    end

    def create
      @rsvp = Rsvp.new(rsvp_params)
      @rsvp.user_id = current_user.id
      @event = @rsvp.event
      if @rsvp.save
        redirect_to rsvps_path
      else
        render :new
      end
    end

    def edit
    end
    
    def update
      if @rsvp.update(rsvp_params)
        redirect_to event_path(@rsvp.event)
      else
        render "new"
      end
    end

    def destroy
    end

    private

    def set_rsvp
        @rsvp = Rsvp.find(params[:id])
    end

    def rsvp_params
        params.require(:rsvp).permit(:status, :number_of_attendees, :user_id, :event_id)
    end

    def set_event
      @event = Event.find_by_id(params[:id])
    end

end