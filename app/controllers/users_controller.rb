class UsersController < ApplicationController

	before_filter :get_user, :only => [:show]
	
	def get_user
		
		@user = User.get_user_info params[:username]
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
	
		if @user.over3200 == true
			render :over3200_show_bio
		else
			render :under3200_show_bio
		end
	end
end

	#def user_not_found
	#
	#end











=begin   # original code
	def show_bio
	@user = User.get_user_info params[:username]
	end

	#def user_not_found
	#
	#end

	end
=end