class Api::V1::SpecializationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @specializations = Specialization.all
  end
end
