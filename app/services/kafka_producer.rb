require "kafka"

class KafkaProducer
  def self.publish(data)
    kafka = ::Kafka.new(
      seed_brokers: ["localhost:9092"], 
      client_id: "telemetry-service"
    )

    kafka.deliver_message(
      data.to_json,
      topic: "telemetry_readings"
    )
  end
end