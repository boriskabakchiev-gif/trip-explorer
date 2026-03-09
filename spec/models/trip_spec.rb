require 'rails_helper'

RSpec.describe Trip, type: :model do
  it "is valid with valid attributes" do
    trip = Trip.new(
      name: "Test",
      image_url: "url",
      short_description: "short",
      long_description: "long",
      rating: 4
    )

    expect(trip).to be_valid
  end

  it "is invalid without name" do
    trip = Trip.new(rating: 4)

    expect(trip).to_not be_valid
  end
end