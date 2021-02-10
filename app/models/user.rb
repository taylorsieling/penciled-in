class User < ApplicationRecord
    has_many :events
    has_many :rsvps
    has_many :event_rsvps, through: :rsvps, source: :event
    

    has_secure_password
    validates :password, :email, presence: true
    validates :email, uniqueness: true 
    validates :password, confirmation: { case_sensitive: true }


    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth["provider"]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(12)
        end
    end

end
