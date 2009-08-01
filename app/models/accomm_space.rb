class AccommSpace # < ActiveRecord::Base <- do I need this for belongs_to to work? will it expect a db table?

#  belongs_to :accomm_type

  attr_accessor :date, :quantity, :accomm_type_id

  def initialize(date,quantity,accomm_type_id)
    @date = date
    @quantity = quantity
    @accomm_type_id = accomm_type_id
  end

end

