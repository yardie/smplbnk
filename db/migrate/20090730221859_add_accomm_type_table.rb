class AddAccommTypeTable < ActiveRecord::Migration
  def self.up
    create_table :accomm_types do |t|
      t.string :name
      t.text :description
      t.integer :total
    end
  end

  def self.down
    drop_table :accomm_types
  end
end
