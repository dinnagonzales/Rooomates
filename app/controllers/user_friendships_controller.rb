class UserFriendshipsController < ApplicationController
	before :authenticate_user

	def new
		unless params[:friend_id]
			flash[:error] = "Friend required"
	end
end
