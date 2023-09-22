class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
 # before_action :authenticate_user!

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctors = Doctor.all
    @doctor = @doctors.find(params[:id])
    render json: @doctor
  end

  def create
    @specialization = Specialization.find(params[:specialization_id])
    @doctor = @specialization.doctors.new(doctor_params)
  
    if @doctor.save
      render :show, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :time_available_from, :time_available_to, :bio, :fee_per_appointment).merge(specialization_id: @specialization.id)
  end  
end
