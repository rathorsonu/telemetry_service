require 'rails_helper'

RSpec.describe "Telemetry API", type: :request do
  let(:token) { JWT.encode({ user_id: 1 }, "my$ecretKey", 'HS256') }

  it "creates telemetry data" do
    post "/api/v1/telemetry",
      params: {
        telemetry: {
          sensor_id: "A1",
          timestamp: Time.now,
          heart_rate: 80,
          temperature: 36.5
        }
      },
      headers: { "Authorization" => "Bearer #{token}" }

    expect(response).to have_http_status(:created)
  end
end