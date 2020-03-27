class HomeController < ApplicationController
  # before_action :authenticate_user!

  def all_citizens
    @citizens = Citizen.all
  	render json: @citizens, status: 200
  end

end
