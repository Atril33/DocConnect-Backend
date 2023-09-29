class Api::V1::SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.all
  end
end
