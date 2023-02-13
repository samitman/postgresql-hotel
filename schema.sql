--- Hotel Reservations DB Schema by Sam Itman
CREATE DATABASE hotel;
ALTER database hotel set search_path = hotel, public;
\connect hotel;

CREATE USER hotel_admin;
GRANT ALL PRIVILEGES ON DATABASE hotel TO hotel_admin;

--- Guests Table
CREATE TABLE guests(
    guest_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

--- Rooms Table
CREATE TYPE room_category AS ENUM ('single', 'double');

CREATE TABLE rooms(
    room_id SERIAL PRIMARY KEY,
    category room_category NOT NULL,
    price NUMERIC DEFAULT 100
);

--- Reservations Table
CREATE TABLE reservations(
    reservation_id SERIAL PRIMARY KEY,
    res_guest_id INTEGER references guests(guest_id) NOT NULL,
    res_room_id INTEGER references rooms(room_id) NOT NULL,
    res_timestamp TIMESTAMP default current_timestamp,
    res_start DATE NOT NULL,
    res_end DATE NOT NULL
);