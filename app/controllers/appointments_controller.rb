class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @pets = Pet.all
    @doctors = Doctor.all
    @customers = Customer.all
  end

  # GET /appointments/1/edit
  def edit
    @pets = Pet.all
    @doctors = Doctor.all
    @customers = Customer.all
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appointments_search
      if logged_in?
        @customer = @current_user.customer
        @pets = @customer.pets
        if @pets.count <= 0
          flash[:notice] = "there is no pet registered on this account"
          redirect_to root
        else
          @appointments = @pets.collect{|x| x.appointments}.flatten
          logger.info("-----#{@appointments.inspect}")
        end
      end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
     valid =  params.require(:appointment).permit(:doctor_id, :pet_id, :customer_id, :reminder, :date_of_visit, :reason_for_visit)
      date_format = "%m/%d/%Y %I:%M %p"
      valid[:date_of_visit] = valid[:date_of_visit] != "" ? DateTime.strptime(valid[:date_of_visit], date_format) : valid[:date_of_visit]
      return valid
    end
end
