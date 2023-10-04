json.array! @specializations do |specialization|
  json.partial! 'specialization', specialization: specialization
end