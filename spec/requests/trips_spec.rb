require 'rails_helper'

RSpec.describe "Trips API", type: :request do

  describe "GET /api/v1/trips" do
    it "returns trips list" do
      Trip.create!(
        name: "Test Trip",
        image_url: "url",
        short_description: "short",
        long_description: "long",
        rating: 5
      )

      get "/api/v1/trips"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/trips/:id" do
    it "returns a trip" do
      trip = Trip.create!(
        name: "Test",
        image_url: "url",
        short_description: "short",
        long_description: "long",
        rating: 4
      )

      get "/api/v1/trips/#{trip.id}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/trips" do
    it "creates a trip" do
      post "/api/v1/trips", params: {
        trip: {
          name: "New Trip",
          image_url: "url",
          short_description: "short",
          long_description: "long",
          rating: 5
        }
      }

      expect(response).to have_http_status(:created)
    end
  end
end