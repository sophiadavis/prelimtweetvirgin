class User < ActiveRecord::Base
	attr_accessible :created_at, :first_tweet, :latest_tweet, :num_followers, :num_friends, :num_tweets, :profile_link, :user_id, :username, :timeoflasttweet

	#A method to grab user info from Twitter
	def self.get_user_info username
		
		user = Twitter.user(username)

		User.create!({
			:created_at => user.created_at,
			:first_tweet => " 'Still figuring out how to get this.' ~Sophia ",
			:latest_tweet => user.status.text,
			:num_followers => user.followers_count,
			:num_friends => user.friends_count,
			:num_tweets => user.statuses_count,
			:profile_link => user.profile_image_url_https( size = :bigger ),
			:user_id => user.id,
			:username => username,
			:timeoflasttweet => user.status.created_at,
		})
	end
end