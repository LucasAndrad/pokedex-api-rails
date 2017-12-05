class ApplicationController < ActionController::API
	include AuthenticationHelper
	attr_reader :current_user
	
end