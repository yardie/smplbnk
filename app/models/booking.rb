class Booking < ActiveRecord::Base

  def self.availability(date)
    bunksAvailable = 10
    todaysBunks = find(:all, :conditions => ['arrival_date <= ? and departure_date > ?', date, date])
    todaysBunks.each do |tBunks|
      bunksAvailable = bunksAvailable - tBunks.bunks
    end
    bunksAvailable
  end

end
