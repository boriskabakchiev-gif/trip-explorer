class TripSummaryWorker
  include Sidekiq::Worker

  def perform
    avg = Trip.average(:rating)

    Rails.logger.info("Average trip rating: #{avg}")
  end
end