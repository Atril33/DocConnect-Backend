json.array! @doctors do |doctor|
  json.partial! 'doctor', doctor: doctor
end