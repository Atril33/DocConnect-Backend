require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates that name is not necessary' do
    user = User.new(
      name: nil,
      email: Faker::Internet.unique.email,
      password: 'admin1234',
      password_confirmation: 'admin1234',
      confirmed_at: Time.now,
      jti: Faker::Alphanumeric.alpha(number: 10)
    )
    expect(user).to be_valid
  end

  it 'validate presence of email' do
    user = User.new(
      name: Faker::Name.name,
      email: nil,
      password: 'admin1234',
      password_confirmation: 'admin1234',
      confirmed_at: Time.now,
      jti: Faker::Alphanumeric.alpha(number: 10)
    )
    expect(user).to_not be_valid
  end

  it 'validate same password and password_confirmation' do
    user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      password: 'admin1234',
      password_confirmation: 'admin12345',
      confirmed_at: Time.now,
      jti: Faker::Alphanumeric.alpha(number: 10)
    )
    expect(user).to_not be_valid
  end
end
