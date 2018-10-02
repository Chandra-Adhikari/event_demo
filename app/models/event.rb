class Event < ApplicationRecord

	has_many :user_events, dependent: :destroy
	has_many :users, through: :user_events

	def save_user_events(params)
	    self.user_events.destroy_all
	    params[:user_id].each do |f|
	      self.user_events.find_or_create_by(user_id: f)
	    end if params[:user_id].present?
	end
end
