class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event

    scope :is_attending, -> { where(status: "Attending") }
    scope :is_interested, -> { where(status: "Interested") }
    scope :is_declined, -> { where(status: "Declined") }
end
