class AuthenticationController < ApplicationController
	include AuthenticationHelper

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }, status: :created
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end