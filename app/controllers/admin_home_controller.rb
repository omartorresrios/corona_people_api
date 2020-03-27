class AdminHomeController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def get_user
    render json: current_user
  end

  def is_admin?
    current_user.is_admin?
  end

  def create
    if is_admin?
      citizen = Citizen.new(citizen_params)
      if citizen.save
        render json: citizen, status: 201
      else
        logger.debug "citizen can't create because : #{citizen.errors.full_messages}"
        render json: { errors: citizen.errors.full_messages }, status: 422
      end
    end
  end

  private
    def citizen_params
      params.permit(:avatar, :name, :dni, :district, :infraction)
    end

    def set_user
     @user = User.find_by(id: params[:id])
   end
end
