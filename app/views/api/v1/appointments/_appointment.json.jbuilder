json.extract! appointment, :id, :appointment_date, :appointment_time, :duration
json.doctor do
  json.extract! appointment.doctor, :id, :name, :fee_per_appointment
  json.photo_url appointment.doctor.photo_url
  json.specialization do
    json.extract! appointment.doctor.specialization, :name
  end
end