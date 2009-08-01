class AccommType < ActiveRecord::Base

  belongs_to :accomm
  
  def self.getTotals
    accommTotals = {}
    find(:all).each do |acctypes|
      accommTotals[acctypes.id] = acctypes.total
    end
    accommTotals
  end
  
end
