class Event < ApplicationRecord
    has_many :rsvps
    has_many :users, through: :rsvps
    belongs_to :user
    belongs_to :category

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, presence: true
end
