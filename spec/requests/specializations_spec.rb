require 'rails_helper'

RSpec.describe "Specializations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/specializations/index"
      expect(response).to have_http_status(:success)
    end
  end

end
