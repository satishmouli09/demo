class Bike < ApplicationRecord
  has_many :bookings

  def available?(start_time, end_time)
    #TO-DO check active bookings in this time interval
  end

  def self.available_bikes(params)
    start_time = params[:start_time]
    end_time = params[:end_time]
    # Bike.joins(:bookings).where("((bookings.start_time < ? AND bookings.end_time < ?) OR (bookings.start_time > ? AND bookings.end_time > ?)) && bookings.canceled = ?", start_time, end_time, start_time, end_time, false).uniq
    unavailable_bikes = Bike.joins(:bookings).where("((bookings.start_time between ? and ?) OR (bookings.end_time between ? and ?)
                                  OR (bookings.start_time < ? and bookings.end_time > ?)) && !bookings.canceled",
                                  start_time, end_time, start_time, end_time, start_time, end_time).uniq
    unavailable_bike_ids = unavailable_bikes.pluck(:bike_id)
    return Bike.all if unavailable_bike_ids.blank?
    Bike.where("id NOT IN (?)", unavailable_bike_ids)
  end
end
