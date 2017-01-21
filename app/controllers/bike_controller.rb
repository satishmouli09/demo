class BikeController < ApplicationController

  def show
    @params = {:bike_id => params["bike_id"], :user_id => params["user_id"],
               :start_time => params["start_time"], :end_time => params["end_time"]}
    puts "44444444444444444444#{@params.inspect}444444444444444"
    @bike = Bike.find(params["bike_id"])
  end

  def list
    # puts "33333333333333#{params.inspect}33333333333333"
    @booking_details = {:user_id => params["user_id"], :start_time => params["booking"]["start_time"],
                        :end_time => params["booking"]["end_time"]}
    @bikes = Bike.available_bikes(@booking_details)
  end

  def booking_check
    @user_id = params["user_id"]
  end

end
