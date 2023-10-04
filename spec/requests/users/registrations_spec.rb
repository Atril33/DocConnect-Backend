require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'users/registrations', type: :request do
  describe 'POST/SIGNUP' do
    context 'with valid parameters' do
      before do
        post '/signup', params:
                          { user: {
                            name: 'tester_111',
                            email: 'mail444@mail.com',
                            password: '12345678',
                            password_confirmation: '12345678'
                          } }
      end

      it 'returns the name' do
        expect(json['data']['name']).to eq('tester_111')
      end

      it 'returns the email' do
        expect(json['data']['email']).to eq('mail444@mail.com')
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters email' do
      before do
        post '/signup', params:
                          { user: {
                            name: 'tester_111',
                            email: 'mail444@mail.com',
                            password: nil,
                            password_confirmation: '12345678'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid parameters password' do
      before do
        post '/signup', params:
                          { user: {
                            name: 'tester_111',
                            email: nil,
                            password: '12345678',
                            password_confirmation: '12345678'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
