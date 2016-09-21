class InvitesController < ApplicationController

	def create
		@event = Event.find(params[:invite][:attended_event_id])
		current_user.invites.create(attended_event_id: @event.id)
		flash[:info] = 'You are now listed as an attendee to this event'
		redirect_to @event
	end

	def destroy
		@invite = Invite.find(params[:id])
		current_user.invites.destroy(@invite)
		flash[:info] = 'You have withdrawn from an event'
		redirect_to current_user
	end

end