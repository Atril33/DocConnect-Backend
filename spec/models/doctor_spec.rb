require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:each) do
    Specialization.delete_all
    @specialization = Specialization.new(name: 'Cardiology')
  end

  it 'validates that name is not necessary' do
    doctor = Doctor.new(
      name: nil,
      time_available_from: Time.zone.parse('09:00:00'),
      time_available_to: Time.zone.parse('17:00:00'),
      bio: Faker::Lorem.paragraph,
      fee_per_appointment: Faker::Number.decimal(l_digits: 2),
      specialization: @specialization
    )
    expect(doctor).to be_valid
  end

  it 'validates that bio is not necessary' do
    doctor = Doctor.create(
      name: Faker::Name.unique.name,
      time_available_from: Time.zone.parse('09:00:00'),
      time_available_to: Time.zone.parse('17:00:00'),
      bio: nil,
      fee_per_appointment: Faker::Number.decimal(l_digits: 2),
      specialization: @specialization
    )
    expect(doctor).to be_valid
  end

  it 'validates the presence of specialization' do
    doctor = Doctor.create(
      name: Faker::Name.unique.name,
      time_available_from: Time.zone.parse('09:00:00'),
      time_available_to: Time.zone.parse('17:00:00'),
      bio: Faker::Lorem.paragraph,
      fee_per_appointment: Faker::Number.decimal(l_digits: 2),
      specialization: nil
    )
    expect(doctor).to_not be_valid
  end
end
