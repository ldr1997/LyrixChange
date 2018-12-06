class HomeController < ApplicationController
	before_action :user_logged_in
	def index
		@demos = Demo.all
	end
end
