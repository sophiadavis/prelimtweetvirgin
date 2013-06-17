class UsersController < ApplicationController

  def show_bio
  	@user = User.get_user_info params[:username]
  end
  
  def no_such_user
  	
  end
  
end
