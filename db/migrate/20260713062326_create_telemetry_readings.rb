class CreateTelemetryReadings < ActiveRecord::Migration[7.1]
  def change
    create_table :telemetry_readings do |t|
      t.string :sensor_id
      t.datetime :timestamp
      t.integer :heart_rate
      t.float :temperature

      t.timestamps
    end
  end
end
