class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'Account created successfully. Please sign in.' }, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
