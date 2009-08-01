class BookingsController < ApplicationController

  # GET /bookings
  # GET /bookings.xml
  def index
    @bookings = Booking.all
    @availMatrix = Booking.availRange(Date.new(2009, 7, 27),Date.new(2009, 8, 7))
    @displayAccommTypes = AccommType.find(:all)
    
#    fromdate = Date.new(2009, 7, 20)
#    todate = Date.new(2009, 8, 4)
#    @daylity = {}
#    fromdate.upto(todate) do |cd|
#      @daylity[cd] = Booking.availability(cd)
#    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        flash[:notice] = 'Booking was successfully created.'
        format.html { redirect_to(@booking) }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        flash[:notice] = 'Booking was successfully updated.'
        format.html { redirect_to(@booking) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to(bookings_url) }
      format.xml  { head :ok }
    end
  end

end
