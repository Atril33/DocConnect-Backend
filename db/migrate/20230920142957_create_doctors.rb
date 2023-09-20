class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.date :time_available_from
      t.date :time_available_to
      t.text :bio
      t.decimal :fee_per_appointment
      t.references :specialization, foreign_key: true

      t.timestamps
    end
  end
end
