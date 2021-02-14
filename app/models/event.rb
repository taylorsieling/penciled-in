class Event < ApplicationRecord
    has_many :rsvps, dependent: :destroy
    has_many :users, through: :rsvps
    belongs_to :user
    belongs_to :category
    accepts_nested_attributes_for :category

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, presence: true

    scope :ordered_by_date, -> { order(start_date: :asc) }
    scope :future, -> { where("end_date >= ?", Date.today)}
    scope :most_rsvps, -> {left_outer_joins(:rsvps).group("events.id").order("sum(rsvps.number_of_attendees) DESC")}
    scope :happening_today, -> {where(:start_date => Date.today)}
    # scope :future, -> (end_date) { where('end_date < ?', Date.today) }
    # scope :future, -> {where(:end_date => ?, Date.current)}


    # def self.ordered_by_date
    #     self.order(start_date: :asc)
    # end

    # def self.future
    #     self.where(end_date: > Date.today)
    # end

    def category_attributes=(attr)
        if !attr[:name].blank?
            self.category = category.find_or_create_by(name: attr[:name])
            self.category.update(category)
        end 
    end 

end
