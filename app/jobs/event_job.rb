class EventJob < ApplicationJob
  queue_as :high_priority

  def perform(user_id, event)
      @users = User.where(id: user_id)
      UserMailer.event_notifier(@users,event).deliver_now
  end
end
