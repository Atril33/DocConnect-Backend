class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments.includes(doctor: :specialization).all
  end

  def show
    render json: @appointment
  end

  def create    
    appointment = current_user.appointments.build(appointment_params)

    if appointment.save
      render json: appointment, status: :created
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: @appointment, status: :ok
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @appointment.destroy
      render json: { message: 'Appointment was successfully destroyed' }, status: :ok
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end  

  private


  def set_appointment
    @appointment = Appointment.find(params[:id])
  end


  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :duration, :user_id, :doctor_id)
  end
end
