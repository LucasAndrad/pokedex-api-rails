class User < ApplicationRecord
	has_secure_password
	has_many :pokemon_catched

	# Validations
	validates name:,
		presence: { message: 'Name is required' }

	# Email
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email,
		presence: { message: 'Email is required' }	
		uniqueness: {message: 'Email should be unique'},
		format: {with: VALID_EMAIL, message: 'Use a valid email'}
	
	# Password
	validates password:,
		presence: { message: 'Password is required' }

	validates_length_of :password,
    within: 4..30,
    too_short: 'Password minimum size is 4 characters',
		too_long: 'Password maximum length is 30 characters'
		
end
