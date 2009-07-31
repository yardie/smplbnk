class Booking < ActiveRecord::Base

  has_many :accomms
  has_many :accomm_types, :through => :accomms

  def self.availability(date)
    todaysBookings = find(:all, :conditions => ['arrival_date <= ? and departure_date > ?', date, date])

    # TODO for each Accommodation Type set its availability to its total in a hash, then subtract the relevant Accommodation Type quantity using todaysBookings

    accommAvail = {}
    AccommType.find(:all).each do |acctypes|
      accommAvail[acctypes.id] = acctypes.total
    end

    todaysBookings.each do |tBook|
      tBook.accomms.find(:all).each do |tBAccs|
        accommAvail[tBAccs.accomm_type_id] -= tBAccs.accomm_quantity
      end
    end
   
   accommAvail
  end

end
