class AddUniqueConstraintToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_index :appointments, [:doctor_id, :appointment_date, :appointment_time], unique: true, name: 'unique_appointment_datetime'
  end
end
