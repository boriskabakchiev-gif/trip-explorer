class Api::V1::TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    trips = Trip.all

    # search
    if params[:search]
      trips = trips.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    end

    # filter rating
    if params[:min_rating]
      trips = trips.where("rating >= ?", params[:min_rating])
    end

    # sort
    if params[:sort] == "asc"
      trips = trips.order(rating: :asc)
    elsif params[:sort] == "desc"
      trips = trips.order(rating: :desc)
    else
      trips = trips.order(name: :asc)
    end

    # pagination
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    trips = trips.page(page).per(per_page)

    render json: {
      trips: trips.map { |trip| TripSerializer.list(trip) },
      meta: {
        page: page.to_i,
        per_page: per_page.to_i,
        total: trips.total_count
      }
    }
  end

  def show
    render json: TripSerializer.detail(@trip)
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      render json: TripSerializer.detail(trip), status: :created
    else
      render json: { errors: trip.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Trip not found" }, status: :not_found
  end

  def trip_params
    params.require(:trip).permit(
      :name,
      :image_url,
      :short_description,
      :long_description,
      :rating
    )
  end
end