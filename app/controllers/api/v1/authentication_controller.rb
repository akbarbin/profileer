class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      payload = { user_id: @user.id }

      auth_token = JWT.encode(payload, ENV['HMAC_SECRET'])

      render json: { message: 'Successfully signed in', auth_token: auth_token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: 'Successfully sign out', auth_token: '' }, status: :ok
  end
end
