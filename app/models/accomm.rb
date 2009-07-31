class Accomm < ActiveRecord::Base

  belongs_to :booking
  belongs_to :accomm_types

end
