require 'spec_helper'

describe Profile do
	before do
		@user = User.create!(name: "Jose Rizal", 
    						email: "jose@rizal.com", 
    						password: "makata", 
    						age: 35,
    						gender: "male",
    						city: "LA",
    						state: "CA")

		@profile = Profile.new(
			  	 			cleanliness:5,
    						noise_tolerance:5,
    						visitors:5,
    						pets:5,
    						smoking:5,
    						sleeping_hours:5,
    						cooks:5,
    						lifestyle:5,
    						interests:5,
    						notes:5,
    						user_id: @user.id)
	end

	describe "profile should belong to user" do
		@user.profile.user_id.should == @user.id
	end


end