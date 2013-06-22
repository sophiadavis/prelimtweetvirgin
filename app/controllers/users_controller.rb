class UsersController < ApplicationController
	
	#respond_to :html, :xml, :json
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
			if @user.protected
				@user.save
				return
			end
			@user.latest_tweet = Twitter.user(@user.username).status.text
			@user.timeoflasttweet = Twitter.user(@user.username).status.created_at
			@user.save
		elsif count == 0
			return
		else
			@user.over3200 = false
			if @user.protected
				@user.save
				return
			end
			@user.first_tweet = User.get_first_tweet @user.username
			@user.latest_tweet = Twitter.user(@user.username).status.text
			@user.timeoflasttweet = Twitter.user(@user.username).status.created_at
			@user.save
		end
	end
	
	def show
		#respond_with(@user)		
		if params[:username].strip == ""
			#render :js => "alert('hello')"  # why didn't this work?
			render :incomplete
		elsif @user
			if @user.protected
				render :protected_user
			else
				render :show
			end
		else
			render :user_not_found
		end
	end

end
