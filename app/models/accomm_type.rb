class AccommType < ActiveRecord::Base

  has_many :accomms
  has_many :bookings, :through => :accomms
  has_many :accomm_contains
  
  def self.getTotals
    accommTotals = {}
    find(:all).each do |acctypes|
      accommTotals[acctypes.id] = acctypes.total
    end
    accommTotals
  end
  
end
