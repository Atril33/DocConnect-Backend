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

# Define office hours
office_hours_start = Time.zone.parse("09:00:00")
office_hours_end = Time.zone.parse("17:00:00")

# Create Doctors with office hours
doctors = []
10.times do
  doctor = Doctor.create(
    name: Faker::Name.unique.name,
    time_available_from: office_hours_start,
    time_available_to: office_hours_end,
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
    appointment_time: Faker::Time.between(from: office_hours_start, to: office_hours_end),
    duration: Faker::Number.between(from: 15, to: 120),
    user: users.sample,
    doctor: doctors.sample
  )
end
