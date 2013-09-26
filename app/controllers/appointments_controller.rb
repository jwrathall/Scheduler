class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @presenter = AppointmentPresenter.new({
                      :users => User.all,
                      :business_hours => BusinessHours.new(Settings.open_time, Settings.close_time),
                      :current_date => Date.parse('2013-09-18')
                      #:current_date => Date.parse(params['date'])
                      })
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find_all_by_date(params[:date])
=begin

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
=end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end
