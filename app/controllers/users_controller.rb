class UsersController < ApplicationController

	before_filter :get_user
	
	def get_user
		begin
			@user = User.get_user_info params[:username]
		rescue
			@user = nil
			return
		end
		
		count = @user.num_tweets
		
		if count > 3200
			@user.over3200 = true
			@user.latest_tweet = Twitter.user(@user.username).status.text
			@user.timeoflasttweet = Twitter.user(@user.username).status.created_at
			@user.save
		elsif count == 0
			return
		else
			@user.over3200 = false
			@user.first_tweet = User.get_first_tweet @user.username
			@user.latest_tweet = Twitter.user(@user.username).status.text
			@user.timeoflasttweet = Twitter.user(@user.username).status.created_at
			@user.save
		end
	end
	
	def show
		if params[:username].strip == ""
			#render :js => "alert('hello')"  # why didn't this work?s
			render :incomplete
		elsif @user
			render :show
		else
			render :user_not_found
		end
	end
end
