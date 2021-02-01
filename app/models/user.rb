class User < ApplicationRecord
    has_secure_password
    has_many :events
    has_many :rsvps
    has_many :event_rsvps, through: :rsvps, source: :event

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response["provider"]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end

end
