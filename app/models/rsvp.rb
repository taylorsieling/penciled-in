class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event

    validates :event_id, uniqueness: { scope: :user_id,
    message: "You have already RSVP'd to this event." }

    scope :is_attending, -> { where(status: "Attending") }
    scope :is_interested, -> { where(status: "Interested") }
    scope :is_declined, -> { where(status: "Declined") }
    scope :rsvpd, -> { where(event_id: params[:event_id], user_id: current_user.id)}
end
