class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.date :arrival_date
      t.date :departure_date
      t.integer :bunks
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
