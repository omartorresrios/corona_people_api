class Users::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user = User.authenticate(email, params[:password])
      render json: CurrentUserSerializer.new(user).serializable_hash
    else
      render json: { errors: ['Invalid email and password'] }, status: 422
    end
  end

  def destroy

  end

  private
    def email
      params[:email]
    end
end
