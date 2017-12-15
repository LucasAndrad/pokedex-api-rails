require 'rails_helper'
include AuthenticationHelper

RSpec.describe AuthenticationController, type: :controller do
	describe 'Authentication controller methods' do
		before(:each) do
			@user = User.create(name: 'Ash Katchum', email: 'ash@email.com', password: '123456', age: 10)
		end

		it 'Should authenticate an User' do
			post :authenticate, params: { 'email' => @user.email, 'password' => @user.password }
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:created)
			expect(json["auth_token"].length).to be > (20)
		end

	end
end