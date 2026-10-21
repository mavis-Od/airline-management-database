# Airline Management System Database — Oracle SQL

## Project Overview

This project involves designing and implementing a relational database for an Airline Management System using Oracle SQL. The database organizes airline operations, including airline information, aircraft, airports, passengers, flight schedules, flight bookings, employees, flight change logs, and weather records.

The project demonstrates relational database design, primary and foreign keys, data integrity, SQL data manipulation, and the organization of airline operational data.

## Database Tables

The database contains 14 tables:

| No. | Table | Purpose |
|---:|---|---|
| 1 | `Airline` | Stores airline names, IATA codes, and base airports. |
| 2 | `Airplane_Type` | Stores aircraft models and descriptions. |
| 3 | `Airport` | Stores airport names and IATA/ICAO codes. |
| 4 | `Passenger` | Stores passenger identification details. |
| 5 | `Airplane` | Stores aircraft capacity and associated airline and aircraft type. |
| 6 | `Airport_geo` | Stores airport locations and geographical coordinates. |
| 7 | `Passenger_details` | Stores additional passenger information. |
| 8 | `Flight` | Stores flight routes, departure and arrival times, and assigned aircraft. |
| 9 | `Flightschedule` | Stores scheduled routes, times, and operating days. |
| 10 | `Flight_Booking` | Stores passenger bookings, seat numbers, and ticket prices. |
| 11 | `Airport_reachable` | Stores airport reachability or stop information. |
| 12 | `Employee` | Stores employee details, departments, and salaries. |
| 13 | `Flight_log` | Records changes to flight information. |
| 14 | `WeatherData` | Stores weather observations and related measurements. |

## Key Relationships

- Each airline can operate multiple aircraft and flights.
- Each aircraft type can be associated with multiple aircraft.
- Each passenger can have additional details recorded in `Passenger_details`.
- Flights are associated with airlines and aircraft.
- Flight bookings connect passengers to flights.
- Flight schedules are associated with airlines.
- Airport geographical records reference airport records.
- Flight logs reference the flights whose changes are recorded.

## Business Questions This Database Can Answer

- Which airlines operate in the database?
- Which aircraft belong to each airline?
- What are the departure and arrival times for each flight?
- Which passengers have booked a flight?
- What seat has each passenger booked?
- What is the ticket price for each booking?
- Which days of the week does an airline schedule its flights?
- What changes have been made to a flight's details?
- What airport locations and geographical coordinates are recorded?
- What weather conditions have been recorded at an airport?
- What employees work in each department, and what are their salaries?

## Tools and Skills

- Database: Oracle SQL
- SQL skills: `CREATE TABLE`, `INSERT`, `SELECT`, filtering, joins, and relational queries
- Database concepts: Primary keys, foreign keys, relational schema design, and referential integrity

## Project Files

- `airline_database.sql` — Database table definitions and sample records.
- `airline_erd.png` — Entity Relationship Diagram (ERD), 

## Note

This is a learning and portfolio project using sample data. Passenger and employee records are fictional 
