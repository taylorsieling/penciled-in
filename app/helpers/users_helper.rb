module UsersHelper

    def rsvpd?(event)
        current_user.event_rsvps.include?(event)
    end

end
