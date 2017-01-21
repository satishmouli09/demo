class User < ApplicationRecord
  has_many :bookings
  validates :phone_number, presence: true, uniqueness: true

  def current_bookings
    self.bookings.where("end_time > ? AND canceled = ?", DateTime.now,false)
  end
end
