class KiosksController < ApplicationController
  # GET /kiosks
  # GET /kiosks.xml
  def index
    @kiosks = Kiosk.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kiosks }
    end
  end

  # GET /kiosks/1
  # GET /kiosks/1.xml
  def show
    if @client.authorized?
      @kiosk = Kiosk.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @kiosk }
      end
    else
      redirect_to connent_url
    end
  end

  # GET /kiosks/new
  # GET /kiosks/new.xml
  def new
    @kiosk = Kiosk.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kiosk }
    end
  end

  # GET /kiosks/1/edit
  def edit
    @kiosk = Kiosk.find(params[:id])
  end

  # POST /kiosks
  # POST /kiosks.xml
  def create
    @kiosk = Kiosk.new(params[:kiosk])

    respond_to do |format|
      if @kiosk.save
        format.html { redirect_to(@kiosk, :notice => 'Kiosk was successfully created.') }
        format.xml  { render :xml => @kiosk, :status => :created, :location => @kiosk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kiosk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kiosks/1
  # PUT /kiosks/1.xml
  def update
    @kiosk = Kiosk.find(params[:id])

    respond_to do |format|
      if @kiosk.update_attributes(params[:kiosk])
        format.html { redirect_to(@kiosk, :notice => 'Kiosk was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kiosk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kiosks/1
  # DELETE /kiosks/1.xml
  def destroy
    @kiosk = Kiosk.find(params[:id])
    @kiosk.destroy

    respond_to do |format|
      format.html { redirect_to(kiosks_url) }
      format.xml  { head :ok }
    end
  end
end
