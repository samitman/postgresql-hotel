--- Hotel Reservations DB Schema by Sam Itman

CREATE DATABASE hotel
    WITH
    OWNER = postgres;

CREATE SCHEMA hotel;

--- Guests Table
CREATE TABLE hotel.guests(
    guest_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

--- Rooms Table
CREATE TYPE room_category AS ENUM ('single', 'double');

CREATE TABLE hotel.rooms(
    room_id SERIAL PRIMARY KEY,
    category room_category NOT NULL,
    price NUMERIC DEFAULT 100
);

--- Reservations Table
CREATE TABLE hotel.reservations(
    reservation_id SERIAL PRIMARY KEY,
    res_guest_id INTEGER references guests(guest_id) NOT NULL,
    res_room_id INTEGER references rooms(room_id) NOT NULL,
    res_timestamp TIMESTAMP default current_timestamp,
    res_start DATE NOT NULL,
    res_end DATE NOT NULL
);