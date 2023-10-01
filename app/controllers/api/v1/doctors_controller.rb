class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:create]

  def index
    @doctors = Doctor.all.includes(:appointments)
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
      render json: @doctor, status: :created
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
    params.require(:doctor).permit(:name, :time_available_from, :time_available_to, :bio, :fee_per_appointment, :photo).merge(specialization_id: @specialization.id)
  end

  def authorize_admin
    user = current_user
    user_json = UserSerializer.new(user).as_json
    puts "Serialized User JSON: #{user_json}"
    unless current_user && current_user.role == 'admin'
      render json: { error: 'Only admins can create doctors' }, status: :unauthorized
    end
  end
end
