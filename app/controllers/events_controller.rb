class EventsController < ApplicationController

	before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

	before_action :set_event,only: [:edit,:update,:destroy,:new_comment]



	def index

		@events = Event.all

		respond_to do |format|

			format.html

			format.json

		end
	end


	def show

		@event = Event.friendly.find(params[:id])

	end


	def new

		@event = current_user.events.build

	end


	def create

		@event = current_user.events.build(create_params)

		authorize @event

		if @event.save

			redirect_to @event

		else

			render :new

		end
	end


	def edit

		authorize @event

	end


	def update

		authorize @event

		if @event.update update_params
		
			redirect_to @event, notice: "#{@event.name} updated"

		else
			render 'edit'
		end

	end


	def destroy

		authorize @event

		@event.destroy

		redirect_to events_path, notice: "#{@event.name} was removed"
	end


	def today

		@events = Event.for_today

		render 'index'

	end


	def next_week

		@events = Event.next_week

		render 'index'

	end


	def mine

		if current_user

			@events = current_user.events

			render 'index'

		else
			redirect_to events_path
		end
	end




	private

		def set_event

			@event = Event.friendly.find(params[:id])

		end


		def create_params

			params.require(:event).permit(*policy(@event).permitted_attributes)

		end


		def update_params

			# el asterisco convierte el array a los valores separados por coma
			# en el metodo permitted_attributes se pasa el metodo para la conversion
			# del precio a centimos para BD
			params.require(:event).permit(*policy(@event).permitted_attributes)

		end

end
