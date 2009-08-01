class Booking < ActiveRecord::Base

  has_many :accomms
  has_many :accomm_types, :through => :accomms

  def self.availability(date)
  
    # TODO implement check on status - only include confirmed? include penciled? - or rather store bookings in a hash of different statuses - only refreshed when a bookings are added, changed, etc...? Then calculate availability from elements - thus more maleable

    # TODO no persistence! - people who have booked individual bunks may have to be moved!
  
    # TODO can this be changed to find_all_by_arrival_date_and_departure_date(...) <- what goes in here - RailsCasts 3 & 15
    @todaysBookings = find(:all, :conditions => ['arrival_date <= ? and departure_date > ?', date, date], :order => "arrival_date, departure_date")

    # for each Accommodation Type set its availability to its total in a hash, then subtract the relevant Accommodation Type quantity using todaysBookings

    # TODO tried @totalAccTypes ||= AccommType.getTotals but accommAvail = @totalAccTypes is associated by reference, not copy values - adds extra load on db at present
    accommAvail = {}
    accommAvail = AccommType.getTotals


    @todaysBookings.each do |tBook|
      tBook.accomms.find(:all).each do |tBAccs|

        accommAvail[tBAccs.accomm_type_id] -= tBAccs.accomm_quantity
      
        # TODO contItems could be cleaned up quite a lot
        # if this accommodation type contains a number of other accommodation types (bunkrooms contain a number of bunks), then subtract that quantity from that accommodation type - if it is in tBAccs then it has been booked!
        contItems = AccommContain.find(:all, :conditions => {:contained_in_id => tBAccs.accomm_type.id})
        contItems.each do |cI|
          unless cI.nil?
            accommAvail[cI.contained_item_id] -= cI.quantity
          end
        end

        #TODO is this going to be erroneous if the total bunks available haven't been calculated yet? - move this (and previous) to post calc?
        # if this accommodation type is contained by others, work out if they are still available (bunkrooms from bunks)
        contIns = AccommContain.find(:all, :conditions => {:contained_item_id => tBAccs.accomm_type.id})
        contIns.each do |cIs|
          unless cIs.nil?
            if accommAvail[tBAccs.accomm_type.id] < cIs.quantity
              accommAvail[cIs.contained_in_id] -= 1 unless accommAvail[cIs.contained_in_id] <= 0
            end
          end
        end

      end
    end
   
   accommAvail
  end
  
  def self.availRange(fromDate = Date.today,toDate = fromDate + 21.days)
  
    # build an availability matrix
  
    # TODO implement as a collection of AccommSpace objects rather than a hash?
  
    ranged = {}
    fromDate.upto(toDate) do |selDate|
      ranged[selDate] = Booking.availability(selDate)
    end
    # TODO not sure why need to sort...
    ranged.sort
  end

end
