class RsvpsController < ApplicationController


	def create

		@event = Event.friendly.find(params[:event_id])

		if Rsvp.for_event_and_user(@event,current_user).exists?

			@rsvp = Rsvp.new event: @event,user: current_user

			@rsvp.user = current_user

		
			if @rsvp.save

				redirect_to @event,notice: "Rsvp added"

			else

				redirect_to @event,alert: "Rsvp not added"
		
			end
		else
			redirect_to @event,alert: "Rsvp not added"
		end

	end


	def destroy

		@rsvp = Rsvp.find(params[:id])

		authorize @rsvp

		@rsvp.destroy

		redirect_to events_path, notice: "Rsvp was removed"

	end


end
