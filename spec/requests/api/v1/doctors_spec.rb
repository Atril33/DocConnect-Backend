require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  include Devise::Test::IntegrationHelpers
  context 'API ENDPOINT Get all doctos' do
    before do
      create_env
    end

    it 'Cannot get all doctors without JWT' do
      get '/api/v1/doctors'
      expect(response).to have_http_status(:found)
    end

    it 'Cannot create doctor without admin role' do
      post '/api/v1/doctors', params: {
        name: Faker::Name.unique.name,
        time_available_from: Time.zone.parse('09:00:00'),
        time_available_to: Time.zone.parse('17:00:00'),
        bio: Faker::Lorem.paragraph,
        fee_per_appointment: Faker::Number.decimal(l_digits: 2),
        specialization: @specialization
      }, headers: { Authorization: @authorization }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  def create_env
    User.create(
      name: 'tester_333',
      email: 'mail666@mail.com',
      password: 'admin1234',
      password_confirmation: 'admin1234',
      confirmed_at: Time.now,
      jti: Faker::Alphanumeric.alpha(number: 10)
    )
    post '/login', params:
                      { user: {
                        email: 'mail666@mail.com',
                        password: 'admin1234'
                      } }
    @authorization = response.headers['Authorization']
    @spec = Specialization.create(name: 'Cardiology')
  end
end
