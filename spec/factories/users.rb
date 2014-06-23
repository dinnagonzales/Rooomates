require 'factory_girl'

FactoryGirl.define do
	
  factory :user do
    name "John"
    age  "Doe"
    gender "male"
    city "Los Angeles"
    state "CA"
    email "user@user.com"
    password_digest "adsfsadfasd"
  end




end
