class Users::RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: CurrentUserSerializer.new(user).serialized_json, status: 201
    else
      logger.debug "user can't create because : #{user.errors.full_messages}"
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password)
    end
end
