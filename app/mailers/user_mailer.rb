class UserMailer < ApplicationMailer

	def event_notifier(users, event)
		@event = event
		users.each do |user|
			@user = user
			mail(:to => @user.email, :subject => "Event Notifier")
		end
	end
end
