class AddAccommTable < ActiveRecord::Migration
  def self.up
    create_table :accomms do |t|
      t.integer :booking_id
      t.integer :accomm_type_id
      t.integer :accomm_quantity
    end
    
    remove_column :bookings, :bunks
  end

  def self.down
    drop_table :accomms
    
    add_column :bookings, :bunks, :integer
  end
end
