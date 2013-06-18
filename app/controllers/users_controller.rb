class UsersController < ApplicationController

	before_filter :get_user, :only => [:show]
	
	def get_user
		begin
			@user = User.get_user_info params[:username]
		rescue
			@user = nil
			#flash[:notice] = "That is not a valid username."
			#redirect_to root_url, :alert => "That is not a valid username."
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
	
		#if @user.over3200 == true
			render :show
		#else
		#	render :under3200_show_bio

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