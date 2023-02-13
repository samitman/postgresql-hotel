--- Hotel Reservations DB Schema by Sam Itman
CREATE USER hotel_admin;

CREATE DATABASE hotel;
GRANT ALL PRIVILEGES ON DATABASE hotel TO hotel_admin;

\c hotel;

CREATE SCHEMA hotel_schema;

--- Guests Table
CREATE TABLE hotel_schema.guests(
    guest_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

--- Rooms Table
CREATE TYPE room_category AS ENUM ('single', 'double');

CREATE TABLE hotel_schema.rooms(
    room_id SERIAL PRIMARY KEY,
    category room_category NOT NULL,
    price NUMERIC DEFAULT 100
);

--- Reservations Table
CREATE TABLE hotel_schema.reservations(
    reservation_id SERIAL PRIMARY KEY,
    res_guest_id INTEGER references guests(guest_id) NOT NULL,
    res_room_id INTEGER references rooms(room_id) NOT NULL,
    res_timestamp TIMESTAMP default current_timestamp,
    res_start DATE NOT NULL,
    res_end DATE NOT NULL
);