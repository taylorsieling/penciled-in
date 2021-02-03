class Category < ApplicationRecord
    has_many :events
    validates :name, presence: true
    accepts_nested_attributes_for :events
end
