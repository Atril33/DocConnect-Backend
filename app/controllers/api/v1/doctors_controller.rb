class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:create, :destroy]

  def index
    @doctors = Doctor.all.includes(:appointments)
  end

  def show
    @doctors = Doctor.all
    @doctor = @doctors.find(params[:id])
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
    @doctor = Doctor.find_by(id: params[:id])

    if @doctor
      if @doctor.destroy
        render json: { message: 'Doctor was successfully destroyed' }, status: :ok
      else
        render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Doctor not found' }, status: :not_found
    end
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
