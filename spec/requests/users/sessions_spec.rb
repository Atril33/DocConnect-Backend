require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'users/sessions', type: :request do
  describe 'POST/SIGNIN' do
    context 'with valid parameters' do
      before do
        post '/signup', params:
                          { user: {
                            name: 'tester_222',
                            email: 'mail555@mail.com',
                            password: '12345678',
                            password_confirmation: '12345678'
                          } }
        post '/login', params:
                          { user: {
                            email: 'mail555@mail.com',
                            password: '12345678'
                          } }
      end

      it 'returns a found status' do
        expect(response).to have_http_status(:found)
      end
    end

    context 'correctly  params limits for login' do
      before do
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
      end

      it 'returns an ok entity for login' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'incorrect password limits for login' do
      before do
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
                            password: 'admin12345'
                          } }
      end

      it 'returns an unprocessable_entity entity for login' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
