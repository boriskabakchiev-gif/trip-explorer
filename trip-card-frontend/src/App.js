import { useEffect, useState } from "react";
import TripCard from "./components/TripCard";
import TripModal from "./components/TripModal";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import "./App.css";

function App() {
    const [trips, setTrips] = useState([]);
    const [search, setSearch] = useState("");
    const [sort, setSort] = useState("asc");
    const [selectedTrip, setSelectedTrip] = useState(null);

    useEffect(() => {
        fetch(`http://localhost:3001/api/v1/trips?search=${search}&sort=${sort}`)
            .then((res) => res.json())
            .then((data) => setTrips(data.trips));
    }, [search, sort]);

    return (
        <>
            <Navbar />

            <div className="container">
                <h1 className="title">Explore Amazing Trips</h1>

                <div className="search-bar">
                    <input
                        placeholder="🔍 Search destinations..."
                        value={search}
                        onChange={(e) => setSearch(e.target.value)}
                    />

                    <select
                        value={sort}
                        onChange={(e) => setSort(e.target.value)}
                    >
                        <option value="asc">⭐ Rating ↑</option>
                        <option value="desc">⭐ Rating ↓</option>
                    </select>
                </div>

                <div className="grid">
                    {trips.map((trip) => (
                        <TripCard
                            key={trip.id}
                            trip={trip}
                            onClick={() => setSelectedTrip(trip)}
                        />
                    ))}
                </div>

                {selectedTrip && (
                    <TripModal
                        trip={selectedTrip}
                        onClose={() => setSelectedTrip(null)}
                    />
                )}
            </div>

            <Footer />
        </>
    );
}

export default App;