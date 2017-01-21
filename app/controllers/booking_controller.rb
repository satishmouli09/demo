class BookingController < ApplicationController

  def list
    user_params = params["user"].symbolize_keys
    @user = User.find_by(:phone_number => user_params[:phone_number])
    if @user
      @bookings = @user.current_bookings
    end
  end

  def show
    @booking_details = {:bike_id => params["booking_details"]["bike_id"], :booking_id => params["booking_details"]["booking_id"]}
  end

  # def user_bookings
  # end

  def create
    booking_details = eval(params["booking_details"])
    @booking = Booking.new(booking_details)
    @booking.save!

    render plain: "Thanks!! Your booking has been done.."
  end

  def cancel
    @booking = Booking.find(params["booking_id"])
    if @booking.cancelation_eligible?
      @booking.cancel
      render plain: "Your booking has been canceled.."
    else
      render plain: "Your Booking can't be canceled!!"
    end
  end

  def extend
    @extended_start_time = params["extension"]["start_time"]
    @extended_end_time = params["extension"]["end_time"]
    @booking_id = eval(params["booking_details"])[:booking_id]
    @booking = Booking.find(@booking_id)
    if  @booking.extension_eligible?(@extended_start_time, @extended_end_time)
      @booking.extend_booking(@extended_start_time, @extended_end_time)
      render plain: "Booking extended"
    else
      render plain: "Sorry! Booking can't be extended"
    end
  end
end