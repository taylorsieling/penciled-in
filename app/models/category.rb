class Category < ApplicationRecord
    has_many :events
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    accepts_nested_attributes_for :events

    scope :alphabetical, -> { order(name: :asc) }

end
