class RsvpsController < ApplicationController

    before_action :set_rsvp, only: [:show, :edit, :update, :destroy]
    # helper_method :find_event
    helper_method :set_rsvp

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
      byebug
      if @rsvp.save
        byebug
        redirect_to rsvps_path
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
        params.require(:rsvp).permit(:status, :number_of_attendee, :user_id, :event_id)
    end

    # def find_event
    #   @event = Event.find_by_id(params[:id])
    # end

end


