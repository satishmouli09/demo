class BikeController < ApplicationController

  def show
    @params = {:bike_id => params["bike_id"], :user_id => params["user_id"],
               :start_time => params["start_time"], :end_time => params["end_time"]}
    @bike = Bike.find(params["bike_id"])
  end

  def list
    @booking_details = {:user_id => params["user_id"], :start_time => params["booking"]["start_time"],
                        :end_time => params["booking"]["end_time"]}
    @bikes = Bike.available_bikes(@booking_details)
  end

  def booking_check
    @user_id = params["user_id"]
  end

end
