class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :name
      t.text :description
    end
    remove_column :bookings, :status
    add_column :bookings, :status_id, :integer
  end

  def self.down
    remove_column :bookings, :status_id
    add_column :bookings, :status, :string
    drop_table :statuses
  end
end
