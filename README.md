Here's a small description for your universe.sql file that you can use in your public repository:

Celestial Bodies Database - universe.sql:
    This SQL file is created for the freeCodeCamp "Build a Celestial Bodies Database" project. It contains the necessary commands to create and populate a PostgreSQL database named universe, which includes tables for galaxies, stars, planets, moons, and space stations. The database is designed to meet specific requirements set by the project, including primary and foreign keys, various data types, and constraints.

Tables Included:
  galaxy: Stores information about different galaxies.
  star: Stores information about stars and references galaxies.
  planet: Stores information about planets and references stars.
  moon: Stores information about moons and references planets.
  space_station: Stores information about space stations and references planets.
How to Use:
  Connect to PostgreSQL with the appropriate credentials.
  Execute the commands in universe.sql to create the database and tables.
  The file includes data insertion commands to populate the tables with sample data.
Instructions:
    Ensure you are connected to PostgreSQL with the command:
      bash code
        psql --username=freecodecamp --dbname=postgres
    Create the database and connect to it:
      sql code
        CREATE DATABASE universe;
        \c universe
    Run the universe.sql script to set up the database:
      bash code
        psql -U postgres < universe.sql
        
This project demonstrates the use of relational databases, primary and foreign keys, and various data types to manage celestial bodies in a structured manner.
