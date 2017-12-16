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
			@user = User.create(name: 'Ash Katchum', email: 'ash@email.com', password: '123456', age: 10)
			@charmeleon = Pokemon.find_by(name: 'Charmeleon')
			@pokemon_catched = PokemonCatched.create(pokemon_id: @charmeleon.id, user_id: @user.id, level: 29)
		end

		it 'Should create a new user' do
			post :create, params: { user: { name: 'Gary Oak', email: 'gary@email.com', password: '123456', age: 10 }}
			users = User.count
			user = User.second
			expect(users).to be(2)
			expect(user.name).to eq('Gary Oak')
			expect(response).to have_http_status(:created)
		end

		it 'Should not create a new user' do
			post :create, params: { user: { name: 'Gary Oak', email: 'gary', password: '123456', age: 10 }}
			json = JSON.parse(response.body)
			expect(json['email'][0]).to eq('Use a valid email')
		end

		it 'Should not show an existing user' do
			get :show, params: { id: @user.id }
			json = JSON.parse(response.body)
			expect(json['error']).to eq('Not Authorized')
		end
		
		it 'Should show the existing user' do
			subject.class.skip_before_action :authenticate_request
			get :show, params: { id: @user.id }
			json = JSON.parse(response.body)
			expect(json['name']).to eq('Ash Katchum')
		end

		it 'Should show all Users' do
			get :index
			json = JSON.parse(response.body)
			expect(json.length).to be(1)
			expect(json[0]['name']).to eq('Ash Katchum')
		end

		it 'Should show Users pokemons' do
			get :show_pokemons, params: { id: @user.id }
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:ok)
			expect(json[0]['pokemon_id']).to be(@charmeleon.id)
		end

		it 'Should update User with id = 1' do
			put :update, params: { id: @user, user: { name: 'Ash Katchum Master', email: 'ash@email.com', password: '123456', age: 10 }}
			json = JSON.parse(response.body)
			expect(json['name']).to eq('Ash Katchum Master')
		end
		:unprocessable_entity

		it 'Should not update User with id = 1' do
			@user.skip_password_validation = true
			put :update, params: { id: @user, user: { name: 'Ash Katchum Master', email: 'ash', password: '123456', age: 10 }}
			json = JSON.parse(response.body)
			expect(json['email'][0]).to eq('Use a valid email')
		end

		it 'Should destroy the existing user' do
			all_users = User.count
			delete :destroy, params: { id: @user }
			expect(User.count).to be(all_users-1)
		end

	end
end
