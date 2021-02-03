class Event < ApplicationRecord
    has_many :rsvps
    has_many :users, through: :rsvps
    belongs_to :user
    belongs_to :category

    accepts_nested_attributes_for :category

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, presence: true

    def self.ordered_by_date
        self.order(start_date: :desc)
    end

end
