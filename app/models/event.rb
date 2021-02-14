class Event < ApplicationRecord
    has_many :rsvps, dependent: :destroy
    has_many :users, through: :rsvps
    belongs_to :user
    belongs_to :category
    accepts_nested_attributes_for :category

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, presence: true

    scope :ordered_by_date, -> { order(start_date: :asc) }
    scope :future, -> { where("end_date >= ?", Date.today)}
    scope :past, -> { where("end_date <= ?", Date.today)}
    scope :most_rsvps, -> {left_outer_joins(:rsvps).group("events.id").order("sum(rsvps.number_of_attendees) DESC")}
    scope :happening_today, -> {where(:start_date => Date.today)}

    def category_attributes=(attr)
        if !attr[:name].blank?
            self.category = Category.find_or_create_by(name: attr[:name])
        end 
    end 

end
