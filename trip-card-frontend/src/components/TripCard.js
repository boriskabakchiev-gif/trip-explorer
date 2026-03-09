function TripCard({ trip, onClick }) {
    return (
        <div className="card">
            <img src={trip.image_url} alt={trip.title} />

            <div className="card-content">
                <h3>{trip.title}</h3>

                <p>{trip.description}</p>

                <div className="rating">⭐ {trip.rating}</div>

                <button onClick={onClick}>More Info</button>
            </div>
        </div>
    );
}

export default TripCard;
