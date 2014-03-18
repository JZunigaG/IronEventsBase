class CommentsController < ApplicationController

	def create

		@event = Event.find(params[:event_id])

		@comment = @event.comments.build comment_params

		@comment.user = current_user
		

		if @comment.save

			redirect_to @event,notice: "Comment added"

		else

			redirect_to @event,alert: "Comment not added"
	
		end
	end


	private

		def comment_params

			params.require(:comment).permit(:body)

		end
end
