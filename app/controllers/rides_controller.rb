class RidesController < ApplicationController
  def new
    @ride = Ride.find_or_create_by(ride_params)
    msg = @ride.take_ride
    redirect_to user_path(@ride.user), notice: msg
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
