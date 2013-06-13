class UsersController < ApplicationController
  def show_bio
  	@user = User.first
  end
end
