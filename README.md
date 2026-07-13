# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Telemetry Service (Rails Microservice)

 Overview

This project is a Ruby on Rails API that ingests medical telemetry data (heart rate, temperature), stores it in PostgreSQL, and publishes events to Kafka.

---

##  Tech Stack

Ruby on Rails (API)
PostgreSQL
Kafka
RSpec
Docker (optional)



## Setup Instructions

### 1. Clone Repo


git clone <your_repo_url>
cd telemetry_service


### 2. Install Dependencies


bundle install


### 3. Setup Database


rails db:create
rails db:migrate


### 4. Run Server


rails s



##  Authentication

Generate token:


rails c
JWT.encode({ user_id: 1 }, "my$ecretKey", 'HS256')




## API Endpoint

POST `/api/v1/telemetry`

### Headers


Authorization: Bearer <token>
Content-Type: application/json


### Body


{
  "telemetry": {
    "sensor_id": "sensor_101",
    "timestamp": "2026-07-13T12:00:00Z",
    "heart_rate": 78,
    "temperature": 36.5
  }
}




##  Run Tests

bundle exec rspec




## Docker (Optional)


docker-compose up --build




