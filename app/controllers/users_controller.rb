class UsersController < ApplicationController

  def show_bio
  	@user = User.get_user_info params[:username]
  end
  
  #def user_not_found
  	#
  #end
  
end
