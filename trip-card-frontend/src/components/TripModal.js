function TripModal({ trip, onClose }) {
    return (
        <div className="modal-overlay">
            <div className="modal">
                <h2>{trip.name}</h2>

                <img src={trip.image_url} alt={trip.name} />

                <p>{trip.long_description}</p>

                <p>⭐ Rating: {trip.rating}</p>

                <button onClick={onClose}>Close</button>
            </div>
        </div>
    );
}

export default TripModal;