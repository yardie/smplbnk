class CreateAccommContains < ActiveRecord::Migration
  def self.up
    create_table :accomm_contains do |t|
      t.integer :contained_in_id
      t.integer :contained_item_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :accomm_contains
  end
end
