require 'spec_helper'

describe User do

	before do
    	@user = User.create!(name: "Jose Rizal", 
    						email: "jose@rizal.com", 
    						password: "makata", 
    						age: 35,
    						gender: "male",
    						city: "LA",
    						state: "CA")
  	end


	it "should require a name" do
  	User.new(:name => "").should_not be_valid
	end


	it "should require age" do
  	User.new(:age => "").should_not be_valid
	end

	it "should require gender" do
  	User.new(:gender => "").should_not be_valid
	end

	it "should require a city" do
  	User.new(:city => "").should_not be_valid
	end

	it "should require a state" do
  	User.new(:state => "").should_not be_valid
	end

    it "should have a unique email" do
        @otheruser = User.new(email: "jose@rizal.com")
        @otheruser.save
        expect(@otheruser).to be_invalid
    end

    it "should have a real email" do
        @otheruser = User.new(name: "Andres Bonifacio", email: "andresbonifacio.com")
        @otheruser.save
        expect(@otheruser).to_not be_persisted
    end


end

	
	

