class Event < ApplicationRecord
    has_many :rsvps
    has_many :users, through: :rsvps
    belongs_to :user
    belongs_to :category

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, presence: true

    accepts_nested_attributes_for :category

    def self.ordered_by_date
        self.order(start_date: :desc)
    end

    # def category_attributes=(attr)
    #     if !attr[:name].blank?
    #         self.category = category.find_or_create_by(name: attr[:name])
    #     end 
    # end 

end
