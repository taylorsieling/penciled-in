class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event

    validates :user_id, uniqueness: { scope: :event_id,  message: "You have already RSVP'd to this event." }

    scope :is_attending, -> { where(status: "Attending") }
    scope :is_interested, -> { where(status: "Interested") }
    scope :is_declined, -> { where(status: "Declined") }
    scope :rsvpd, -> (event, user) { where(event_id: event, user_id: user)}

end
