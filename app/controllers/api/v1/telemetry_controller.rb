class Api::V1::TelemetryController < ApplicationController
  include Authenticate
  before_action :authenticate_request

	def create
		reading = TelemetryReading.new(telemetry_params)

		if reading.save
			begin
			  KafkaProducer.publish(reading)
			rescue => e
			  Rails.logger.error("Kafka error: #{e.message}")
			end

			render json: { message: "Data ingested successfully" }, status: :created
		else
			render json: { errors: reading.errors.full_messages }, status: :unprocessable_entity
		end
	end

  private

  def telemetry_params
    params.require(:telemetry).permit(
      :sensor_id,
      :timestamp,
      :heart_rate,
      :temperature
    )
  end
end