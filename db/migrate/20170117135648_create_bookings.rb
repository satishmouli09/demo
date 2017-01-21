class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.column :user_id, :integer
      t.column :bike_id, :integer
      t.column :start_time, :datetime, :null => false
      t.column :end_time, :datetime, :null => false
      t.column :canceled, :boolean, :default => false
      t.column :status, :integer
      t.timestamps
    end
  end
end
