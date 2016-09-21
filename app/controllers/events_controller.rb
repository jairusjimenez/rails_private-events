class EventsController < ApplicationController

	def index
		@upcoming = Event.upcoming
		@past = Event.past
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Successfully created event"
			redirect_to @event
		else
			flash.now[:danger] = 'Something went wrong!'
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
		@attendees = @event.attendees.all
	end

	private

		def event_params
			params.require(:event).permit(:name, :location, :date)
		end

end