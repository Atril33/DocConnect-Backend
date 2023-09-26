class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  def index
    @appointments = Appointment.includes(doctor: :specialization).all
    render json: @appointments.to_json(include: { doctor: { include: :specialization } })
  end

  def shpw
    render json: @appointment
  end

  def create
    appointment = Appointment.new(appointment_params)

    if appointment.save
      render json: appointment, status: :created
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    if @appointment.update(appointment_params)
      render json: @appointment, status: :ok
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :duration, :user_id, :doctor_id)
  end
end
