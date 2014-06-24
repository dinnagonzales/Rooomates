class StaticPageController < ApplicationController
  def home
  	@user = User.new
  end
end
