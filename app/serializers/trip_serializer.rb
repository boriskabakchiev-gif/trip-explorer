class TripSerializer
  def self.list(trip)
    {
      id: trip.id,
      name: trip.name,
      image_url: trip.image_url,
      short_description: trip.short_description,
      rating: trip.rating
    }
  end

  def self.detail(trip)
    {
      id: trip.id,
      name: trip.name,
      image_url: trip.image_url,
      short_description: trip.short_description,
      long_description: trip.long_description,
      rating: trip.rating
    }
  end
end