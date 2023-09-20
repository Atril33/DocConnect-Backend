class SpecializationsController < ApplicationController
  before_action :set_specialization, only: %i[show update destroy]

  # GET /specializations
  # GET /specializations.json
  def index
    @specializations = Specialization.all
  end

  # GET /specializations/1
  # GET /specializations/1.json
  def show; end

  # POST /specializations
  # POST /specializations.json
  def create
    @specialization = Specialization.new(specialization_params)

    if @specialization.save
      render :show, status: :created, location: @specialization
    else
      render json: @specialization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specializations/1
  # PATCH/PUT /specializations/1.json
  def update
    if @specialization.update(specialization_params)
      render :show, status: :ok, location: @specialization
    else
      render json: @specialization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specializations/1
  # DELETE /specializations/1.json
  def destroy
    @specialization.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_specialization
    @specialization = Specialization.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def specialization_params
    params.fetch(:specialization, {})
  end
end
