class AccommContain < ActiveRecord::Base

  belongs_to :contained_in, :class_name => "AccommType", :foreign_key => "contained_in_id"
  belongs_to :contained_item, :class_name => "AccommType", :foreign_key => "contained_item_id"

end
