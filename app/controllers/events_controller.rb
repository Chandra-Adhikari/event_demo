class EventsController < ApplicationController
  before_action :require_user
  before_action :find_event, except: [:index,:new,:create]

  def index
  	if params[:search].present?
      if params[:search][:user_id].present?
  		@user = User.find_by(id: params[:search][:user_id])
  		@events = @user.events.order("event_time asc")
    else
      @events = Event.all.order("event_time asc")
      
    end
  	else
  		@events = Event.all.order("event_time asc")
  	end
  end

  def new
  	@event = Event.new
  end

  def create
		@event = Event.new(event_params)
		if @event.save
			@event.save_user_events(params)
			EventJob.perform_later(params[:user_id],@event)
			flash[:notice] = "You have created an event successfully."
          	redirect_to events_path 
		else
			render 'new'
			flash[:error] = "You are unable create an event.", @event.errors.full_messages
		end
	end

	def edit
	  
	end

	def update
	  if @event.update_attributes(event_params)
	  	@event.save_user_events(params)
	  	redirect_to events_path,:notice => 'Event have updated successfully.'
	  else
	  	redirect_to edit_event_path
	    flash[:alert] = @event.errors.full_messages
	  end
	end
  
  def show
  end

  def destroy
  	@event.destroy
  	redirect_to events_path,:notice => "Event deleted successfully."
  end

  private
  	def find_event
  		@event = Event.find_by(id: params[:id])
  		redirect_to events_path,"Event Not found." unless @event.present?  			
  	end

  	def event_params
	  params.require(:event).permit(:title,:description, :event_time)
	end
end
