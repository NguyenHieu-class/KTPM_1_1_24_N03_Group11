import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css'; // Tạo file này để style toàn bộ ứng dụng của bạn

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Header from './components/Header';
import Footer from './components/Footer';
import CarList from './components/CarList';
import CarDetail from './components/CarDetail';
import BookingForm from './components/BookingForm';

function App() {
  return (
    <Router>
      <div>
        <Header />
        <Switch>
          <Route path="/" exact component={CarList} />
          <Route path="/cars/:id" component={CarDetail} />
          <Route path="/booking" component={BookingForm} />
        </Switch>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
import React from 'react';

function Header() {
  return (
    <header>
      <h1>Car Rental Service</h1>
      <nav>
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/cars">Cars</a></li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;
import React from 'react';

function Footer() {
  return (
    <footer>
      <p>© 2024 Car Rental Service. All rights reserved.</p>
    </footer>
  );
}

export default Footer;
import React, { useState, useEffect } from 'react';

function CarList() {
  const [cars, setCars] = useState([]);

  useEffect(() => {
    fetch('https://api.example.com/cars')
      .then(response => response.json())
      .then(data => setCars(data))
      .catch(error => console.error('Error fetching cars:', error));
  }, []);

  return (
    <div>
      <h2>Available Cars</h2>
      <ul>
        {cars.map(car => (
          <li key={car.id}>{car.name} - {car.price}/day</li>
        ))}
      </ul>
    </div>
  );
}

export default CarList;
import React, { useState, useEffect } from 'react';

function CarDetail({ match }) {
  const [car, setCar] = useState(null);

  useEffect(() => {
    fetch(`https://api.example.com/cars/${match.params.id}`)
      .then(response => response.json())
      .then(data => setCar(data))
      .catch(error => console.error('Error fetching car:', error));
  }, [match.params.id]);

  return car ? (
    <div>
      <h2>{car.name}</h2>
      <p>{car.description}</p>
      <p>Price per day: {car.price}</p>
    </div>
  ) : <div>Loading...</div>;
}

export default CarDetail;
import React, { useState } from 'react';

function BookingForm() {
  const [formData, setFormData] = useState({
    startDate: '',
    endDate: '',
    carId: ''
  });

  const handleChange = (event) => {
    setFormData({ ...formData, [event.target.name]: event.target.value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log('Booking data:', formData);
    // Submit to backend
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="startDate">Start Date:</label>
      <input type="date" name="startDate" value={formData.startDate} onChange={handleChange} />
      <label htmlFor="endDate">End Date:</label>
      <input type="date" name="endDate" value={formData.endDate} onChange={handleChange} />
      <button type="submit">Book Car</button>
    </form>
  );
}

export default BookingForm;
