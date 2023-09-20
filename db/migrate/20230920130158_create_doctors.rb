class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.date :time_available_from
      t.date :time_available_to
      t.bio :text
      t.deciaml :fee_per_appointment
      t.reference :specialization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
