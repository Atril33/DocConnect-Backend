class Doctor < ApplicationRecord
  belongs_to :specialization
  has_many :appointments
end
