class User < ActiveRecord::Base
	attr_accessible :created_at, :first_tweet, :latest_tweet, :num_followers, :num_friends, :num_tweets, :profile_link, :user_id, :username

	#A method to grab user info from Twitter
	def self.get_user_info
		
		username = params[:username]
		user = Twitter.user(username)

		User.create!({
			:created_at => user.created_at,
			:first_tweet => "still figuring this out",
			:latest_tweet => user.status.text,
			:num_followers => user.followers_count,
			:num_friends => user.friends_count,
			:num_tweets => user.statuses_count,
			:profile_link => user.profile_image_url_https(size = :normal),
			:user_id => user.id,
			:username => username,
		})
	end
end