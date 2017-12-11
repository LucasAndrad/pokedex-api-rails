require 'rails_helper'
include AuthenticationHelper

RSpec.describe UsersController, type: :controller do
	describe 'Users controller test' do
		before(:each) do
			Pokemon.create([
				{ number:4, name: 'Charmander', type_1: 'Fire', type_2: '', total:309, hp:39, 
					attack: 52, defense: 43, sp_atk: 60, sp_def: 50, speed: 65, generation: 1, 
					legendary:0, image: '0004.png' },
				{ number: 5, name: 'Charmeleon', type_1: 'Fire', type_2: '', total: 405, hp: 58, 
					attack: 64, defense: 58, sp_atk: 80, sp_def: 65, speed: 80, generation: 1, 
					legendary:0, image: '0005.png' },
				{ number: 6, name: 'Charizard', type_1:' Fire', type_2: 'Flying', total: 534, hp: 78, 
					attack: 84, defense: 78, sp_atk: 109, sp_def: 85, speed: 100, generation: 1, 
					legendary: 0, image: '0006.png' }
		])
		@user = User.create([
			{ name: 'Ash Katchum', email: 'ash@email.com', password: '123456', age: 10 }
		])
		end

		it 'Should create a new user' do
			post :create, params: { user: { name: 'Gary Oak', email: 'gary@email.com', password: '123456', age: 10 }}
			users = User.count
			user = User.second
			expect(users).to be(2)
			expect(user.name).to eq('Gary Oak')
		end

	end
end
