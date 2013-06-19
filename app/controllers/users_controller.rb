class UsersController < ApplicationController

	before_filter :get_user, :only => [:show]
	
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
			@user.save
		else
			@user.over3200 = false
			@user.save
		end
	end
	
	def show
		if params[:username].strip == ""
			render :incomplete
		elsif @user
			render :show
		else
			render :user_not_found
		end
	end
end
