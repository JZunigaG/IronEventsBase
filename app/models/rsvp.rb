class Rsvp < ActiveRecord::Base

	belongs_to :user

	belongs_to :event



	def self.for_event_and_user event,user

		Rsvp.where(event: event,user: user)

	end


end
