class User < ApplicationRecord

	has_many :user_events, dependent: :destroy
	has_many :events, through: :user_events
end
