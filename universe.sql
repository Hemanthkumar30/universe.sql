-- Log in to PostgreSQL
-- bash code
psql --username=freecodecamp --dbname=postgres

-- To Create the database
CREATE DATABASE universe;

-- To Connect to the database
\c universe

-- Create the galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  age_in_millions_of_years INT,
  has_life BOOLEAN NOT NULL
);

-- Create the star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  is_spherical BOOLEAN NOT NULL,
  mass NUMERIC
);

-- Create the planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  distance_from_earth INT NOT NULL,
  is_habitable BOOLEAN NOT NULL
);

-- Create the moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  radius INT NOT NULL,
  has_life BOOLEAN NOT NULL
);

-- Create the space_station table
CREATE TABLE space_station (
  space_station_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  capacity INT NOT NULL,
  is_operational BOOLEAN NOT NULL
);

-- Insert data into the galaxy table
INSERT INTO galaxy (name, description, age_in_millions_of_years, has_life) VALUES
('Milky Way', 'Spiral galaxy', 13600, TRUE),
('Andromeda', 'Nearest major galaxy', 10000, FALSE),
('Triangulum', 'Spiral galaxy', 12000, FALSE),
('Whirlpool', 'Spiral galaxy', 3000, TRUE),
('Sombrero', 'Spiral galaxy', 10000, FALSE),
('Pinwheel', 'Face-on spiral galaxy', 14000, FALSE);

-- Insert data into the star table
INSERT INTO star (name, galaxy_id, is_spherical, mass) VALUES
('Sun', 1, TRUE, 1.989e30),
('Proxima Centauri', 2, TRUE, 2.446e29),
('Betelgeuse', 3, TRUE, 2.78e31),
('Sirius', 4, TRUE, 4.02e30),
('Vega', 5, TRUE, 4.15e30),
('Polaris', 6, TRUE, 5.4e30);

-- Insert data into the planet table
INSERT INTO planet (name, star_id, distance_from_earth, is_habitable) VALUES
('Earth', 1, 0, TRUE),
('Mars', 1, 54.6e6, FALSE),
('Venus', 1, 41.4e6, FALSE),
('Proxima b', 2, 4.24e13, TRUE),
('Betelgeuse b', 3, 6.5e14, FALSE),
('Sirius b', 4, 8.6e13, FALSE),
('Vega b', 5, 25e12, FALSE),
('Polaris b', 6, 433.8e12, FALSE),
('Polaris c', 6, 434.5e12, FALSE),
('Milky b', 1, 100e6, FALSE),
('Milky c', 1, 101e6, FALSE),
('Andromeda b', 2, 2.537e19, FALSE);

-- Insert data into the moon table
INSERT INTO moon (name, planet_id, radius, has_life) VALUES
('Moon', 1, 1737, FALSE),
('Phobos', 2, 11.2667, FALSE),
('Deimos', 2, 6.2, FALSE),
('Europa', 3, 1560.8, FALSE),
('Ganymede', 3, 2634.1, FALSE),
('Callisto', 3, 2410.3, FALSE),
('Io', 3, 1821.6, FALSE),
('Proxima b1', 4, 500, FALSE),
('Proxima b2', 4, 600, FALSE),
('Betelgeuse b1', 5, 700, FALSE),
('Sirius b1', 6, 800, FALSE),
('Vega b1', 7, 900, FALSE),
('Polaris b1', 8, 1000, FALSE),
('Polaris b2', 8, 1100, FALSE),
('Polaris c1', 9, 1200, FALSE),
('Milky b1', 10, 1300, FALSE),
('Milky b2', 10, 1400, FALSE),
('Milky c1', 11, 1500, FALSE),
('Milky c2', 11, 1600, FALSE),
('Andromeda b1', 12, 1700, FALSE);

-- Insert data into the space_station table
INSERT INTO space_station (name, planet_id, capacity, is_operational) VALUES
('International Space Station', 1, 10, TRUE),
('Mars Base Alpha', 2, 50, FALSE),
('Venus Habitat', 3, 20, FALSE);

-- Verify the structure and data
\d galaxy
\d star
\d planet
\d moon
\d space_station

SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
SELECT * FROM space_station;


pg_dump -cC --inserts -U freecodecamp universe > universe.sql

-- bash code
psql -U postgres < universe.sql
