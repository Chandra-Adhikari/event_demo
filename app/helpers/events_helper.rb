module EventsHelper

	def options_for_user_select
		User.all.order("name asc").map{|user| [user.name, user.id]}
	end
end
