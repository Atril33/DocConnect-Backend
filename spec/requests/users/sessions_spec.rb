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

    context 'with invalid parameters password' do
      before do
        post '/login', params:
                          { user: {
                            email: nil,
                            password: '12345678'
                          } }
      end

      it 'returns an unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
