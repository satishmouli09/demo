class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  def cancelation_eligible?
    (self.start_time > DateTime.now) ? true : false
  end

  def cancel
    self.canceled = true
    self.save!
  end

  def extension_eligible?(start_time, end_time)
    (self.pre_extension_eligible?(start_time) && self.post_extension_eligible?(end_time)) ? true : false
  end

  def pre_extension_eligible?(start_time)
    return true if self.start_time == start_time
    bookings = Booking.joins(:bike).where("(start_time NOT between ? and ?) && (end_time NOT between ? and ?) && bike_id = ? && bookings.id != ?
                                            && !canceled", start_time, self.start_time, start_time, self.start_time, self.bike_id, self.id)
    return (bookings.present? ? true : false)
  end

  def post_extension_eligible?(end_time)
    return true if self.end_time == end_time
    bookings = Booking.joins(:bike).where("(start_time NOT between ? and ?) && (end_time NOT between ? and ?) && bike_id = ? && bookings.id != ?
                                            && !canceled", self.end_time, end_time, self.end_time, end_time, self.bike_id, self.id)
    return (bookings.present? ? true : false)
  end

  def extend_booking(start_time, end_time)
    self.start_time = start_time
    self.end_time = end_time
    self.save!
  end

  def is_canceled?
    self.canceled
  end
end
