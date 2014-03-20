class TweetWorker

	include Sidekiq::Worker


	def perform(event_id,user_id)

		user = User.find(user_id)

		event = Event.find(event_id)

		post_tweet(user,event)
	end


	def post_tweet(user,event)

		"#{user.name} is going to #{event.title}"

	end

end