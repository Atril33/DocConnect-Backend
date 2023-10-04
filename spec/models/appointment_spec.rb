require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:each) do
    Specialization.delete_all
    Doctor.delete_all
    User.delete_all
    @specialization = Specialization.create(name: 'Cardiology')
    @doctor = Doctor.create(
      name: Faker::Name.unique.name,
      time_available_from: Time.zone.parse('09:00:00'),
      time_available_to: Time.zone.parse('17:00:00'),
      bio: Faker::Lorem.paragraph,
      fee_per_appointment: Faker::Number.decimal(l_digits: 2),
      specialization: @specialization
    )
    @user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      password: 'admin1234',
      password_confirmation: 'admin1234',
      confirmed_at: Time.now,
      jti: Faker::Alphanumeric.alpha(number: 10)
    )
  end

  it 'validates the correct creation of appointments' do
    appointment = Appointment.new(
      appointment_date: Faker::Date.forward(days: 30),
      appointment_time: Faker::Time.between(from: Time.zone.parse('09:00:00'), to: Time.zone.parse('17:00:00')),
      duration: Faker::Number.between(from: 15, to: 120),
      user: @user,
      doctor: @doctor
    )
    expect(appointment).to be_valid
  end

  it 'validates the presence of user' do
    appointment = Appointment.new(
      appointment_date: Faker::Date.forward(days: 30),
      appointment_time: Faker::Time.between(from: Time.zone.parse('09:00:00'), to: Time.zone.parse('17:00:00')),
      duration: Faker::Number.between(from: 15, to: 120),
      user: nil,
      doctor: @doctor
    )
    expect(appointment).to_not be_valid
  end

  it 'validates the presence of doctor' do
    appointment = Appointment.new(
      appointment_date: Faker::Date.forward(days: 30),
      appointment_time: Faker::Time.between(from: Time.zone.parse('09:00:00'), to: Time.zone.parse('17:00:00')),
      duration: Faker::Number.between(from: 15, to: 120),
      user: @user,
      doctor: nil
    )
    expect(appointment).to_not be_valid
  end
end
