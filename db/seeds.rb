# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
Appointment.destroy_all
Specialization.destroy_all
Doctor.destroy_all
User.destroy_all

# Create Specializations
specializations = []
10.times do
  specializations << Specialization.create(name: Faker::Job.unique.field)
end

# Create Doctors
doctors = []
10.times do
  doctor = Doctor.create(
    name: Faker::Name.unique.name,
    time_available_from: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    time_available_to: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    bio: Faker::Lorem.paragraph,
    fee_per_appointment: Faker::Number.decimal(l_digits: 2),
    specialization: specializations.sample
  )
  doctors << doctor
end

# Create Users
users = []
100.times do
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "admin1234",
    password_confirmation: "admin1234",
    confirmed_at: Time.now,
    jti: Faker::Alphanumeric.alpha(number: 10)
  )
end

# Create Appointments
100.times do
  Appointment.create(
    appointment_date: Faker::Date.forward(days: 30),
    appointment_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    duration: Faker::Number.between(from: 15, to: 120),
    user: users.sample,
    doctor: doctors.sample
  )
end
