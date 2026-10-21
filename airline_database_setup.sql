-- ==========================================
-- AIRLINE MANAGEMENT SYSTEM DATABASE SCHEMA
-- Database: Oracle SQL
-- ==========================================

-- 1. AIRLINE
CREATE TABLE Airline(
    Airline_id VARCHAR2(10) PRIMARY KEY,
    iata VARCHAR2(20),
    Airline_name VARCHAR2(30),
    Base_airport VARCHAR2(20)
);

INSERT INTO airline VALUES('AL001', 'AA', 'American Airlines', 'LHS');
INSERT INTO airline VALUES('AL002', 'BA', 'British Airlines', 'LHS');
INSERT INTO airline VALUES('AL003', 'QR', 'Qatar Airways', 'DOH');
INSERT INTO airline VALUES('AL004', 'DL', 'Delta Airlines', 'ATL');
INSERT INTO airline VALUES('AL005', 'EK', 'Emirates', 'DXB');


-- 2. AIRPLANE TYPE
CREATE TABLE Airplane_Type(
    Type_id VARCHAR2(10) PRIMARY KEY,
    Identifier VARCHAR2(50),
    Description_text VARCHAR2(30)
);

INSERT INTO airplane_type VALUES('T001', 'B737', 'Boeing 737');
INSERT INTO airplane_type VALUES('T002', 'A320', 'Airbus A320');
INSERT INTO airplane_type VALUES('T003', 'B777', 'Boeing 777');


-- 3. AIRPORT
CREATE TABLE Airport(
    airport_id VARCHAR2(10) PRIMARY KEY,
    iata VARCHAR2(20),
    icao VARCHAR2(20),
    name_of VARCHAR2(20)
);

INSERT INTO Airport VALUES('AP001', 'LOS', 'DNMM', 'Lagos Airport');
INSERT INTO Airport VALUES('AP002', 'ABV', 'DNAA', 'Abuja Airport');
INSERT INTO Airport VALUES('AP003', 'LHR', 'EGLL', 'Heathrow Airport');
INSERT INTO Airport VALUES('AP004', 'DOH', 'OTHH', 'DOHA Airport');


-- 4. PASSENGER
CREATE TABLE Passenger(
    passenger_id VARCHAR2(10) PRIMARY KEY,
    passport_no VARCHAR2(10),
    first_name VARCHAR2(30),
    last_name VARCHAR2(30)
);

INSERT INTO passenger VALUES('P001', 'A123675', 'Mabel', 'Andrew');
INSERT INTO passenger VALUES('P002', 'A235467', 'Mathew', 'Awolowo');
INSERT INTO passenger VALUES('P003', 'A553675', 'Ade', 'Jude');


-- 5. AIRPLANE (Fixed ID values)
CREATE TABLE Airplane(
    Airplane_id VARCHAR2(20) PRIMARY KEY,
    Capacity NUMBER,
    Type_id VARCHAR2(10),
    Airline_id VARCHAR2(20),
    FOREIGN KEY (Type_id) REFERENCES airplane_type(type_id),
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id)
);

INSERT INTO Airplane VALUES('A001', 220, 'T001', 'AL001');
INSERT INTO Airplane VALUES('A002', 180, 'T002', 'AL002');


-- 6. AIRPORT GEO
CREATE TABLE Airport_geo(
    airport_id VARCHAR2(10) PRIMARY KEY,
    name_port VARCHAR2(20),
    city VARCHAR2(30),
    country VARCHAR2(30),
    latitude VARCHAR2(20),
    longitude VARCHAR2(20), -- Fixed typo
    geolocation VARCHAR2(30),
    FOREIGN KEY (airport_id) REFERENCES airport(airport_id)
);

INSERT INTO Airport_geo VALUES('AP001', 'Lagos Port', 'Lagos', 'Nigeria', '6.57', '3.32', '6.57,3.32');
INSERT INTO Airport_geo VALUES('AP002', 'Abuja Port', 'Abuja', 'Nigeria', '9.00', '7.26', '9.00,7.26');
INSERT INTO Airport_geo VALUES('AP003', 'Heathrow Port', 'London', 'UK', '51.47', '-0.45', '51.47,-0.45');


-- 7. PASSENGER DETAILS
CREATE TABLE Passenger_details(
    passenger_id VARCHAR2(10) PRIMARY KEY,
    birth_date DATE,
    sex VARCHAR2(10),
    street VARCHAR2(30),
    city VARCHAR2(20),
    zip_code VARCHAR2(10),
    country VARCHAR2(30),
    email_address VARCHAR2(30),
    phone_no NUMBER,
    FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
);

INSERT INTO passenger_details VALUES('P001', '18-Jan-1995', 'Female', '13 omorpgbe st', 'Benin', '300283', 'Nigeria', 'mabel@gmail.com', 08123546732);
INSERT INTO passenger_details VALUES('P002', '10-Jan-1996', 'Male', '14 Akpakpava Rd', 'Benin', '300283', 'Nigeria', 'mathew@gmail.com', 08123547543);


-- 8. FLIGHT
CREATE TABLE FLIGHT(
    Flight_id VARCHAR2(10) PRIMARY KEY,
    Flight_no VARCHAR2(10),
    Coming_From VARCHAR2(30),
    Going_To VARCHAR2(30),
    Departure_Time TIMESTAMP,
    Arrival_Time TIMESTAMP,
    Airline_Id VARCHAR2(20),
    Airplane_Id VARCHAR2(20),
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id),
    FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id)
);

INSERT INTO Flight VALUES('F001', 'FL100', 'LOS', 'ABV', TO_TIMESTAMP('2026-02-13 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-02-13 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'AL001', 'A001');


-- 9. FLIGHT SCHEDULE
CREATE TABLE Flightschedule(
    flight_no VARCHAR2(10) PRIMARY KEY,
    Coming_from VARCHAR2(20),
    Going_to VARCHAR2(20), -- Fixed typo
    Departure_Time TIMESTAMP,
    Arrival_time TIMESTAMP,
    Airline_id VARCHAR2(10),
    Monday VARCHAR2(20),
    Tuesday VARCHAR2(20),
    Wednesday VARCHAR2(20),
    Thursday VARCHAR2(20),
    Friday VARCHAR2(20),
    Saturday VARCHAR2(20),
    Sunday VARCHAR2(20),
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id)
);

INSERT INTO flightschedule VALUES('FL100', 'LOS', 'ABV', TO_TIMESTAMP('2026-02-13 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-02-13 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'AL001', 'YES', 'YES', 'NO', 'YES', 'NO', 'YES', 'NO');


-- 10. FLIGHT BOOKING
CREATE TABLE Flight_Booking(
    Booking_id VARCHAR2(10) PRIMARY KEY,
    flight_id VARCHAR2(10),
    seat_no VARCHAR2(10),
    passenger_id VARCHAR2(10),
    Booking_time TIMESTAMP,
    price NUMBER,
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
);

INSERT INTO flight_booking VALUES('B001', 'F001', '12A', 'P001', TO_TIMESTAMP('2026-02-12 11:25:23','YYYY-MM-DD HH24:MI:SS'), 50000);


-- 11. AIRPORT REACHABLE
CREATE TABLE Airport_reachable(
    Airport_id VARCHAR2(10),
    Hops VARCHAR2(30),
    FOREIGN KEY (airport_id) REFERENCES airport(airport_id)
);

INSERT INTO Airport_reachable VALUES('AP001', 'Direct');
INSERT INTO Airport_reachable VALUES('AP002', '1 stop');
INSERT INTO Airport_reachable VALUES('AP003', '2 stops');


-- 12. EMPLOYEE
CREATE TABLE Employee(
    Employee_id VARCHAR2(10) PRIMARY KEY,
    First_name VARCHAR2(30),
    Last_name VARCHAR2(30),
    Birth_Date DATE,
    Sex VARCHAR2(10),
    Street VARCHAR2(30),
    City VARCHAR2(20),
    Zip_code VARCHAR2(10),
    Country VARCHAR2(30),
    Email_address VARCHAR2(30),
    Phone_no NUMBER,
    Salary NUMBER,
    Department_name VARCHAR2(30),
    Username VARCHAR2(20),
    Password VARCHAR2(20)
);

INSERT INTO employee VALUES('E001', 'Alice', 'Edward', '17-Apr-1997', 'Female', 'Ugbowo', 'Benin_city', '300238', 'Nigeria', 'alice@gmail.com', 08123546211, 150000, 'Cabin_crew', 'alice01', 'pass123');
INSERT INTO employee VALUES('E002', 'Nathaniel', 'David', '22-Apr-1998', 'Male', '13, Ajai Rd', 'Benin_city', '300238', 'Nigeria', 'nathaniel@gmail.com', 07084022234, 150000, 'Cabin_crew', 'nathaniel01', 'pass123');
INSERT INTO employee VALUES('E003', 'Felicia', 'Nile', '10-May-1997', 'Female', '13, omorogbe st ', 'Benin_city', '300238', 'Nigeria', 'felicia@gmail.com', 0907133345, 150000, 'Cabin_crew', 'feliciae01', 'pass123');
INSERT INTO employee VALUES('E004', 'Divine', 'Ade', '11-Sep-1997', 'Male', '23 Uwasota', 'Benin_city', '300238', 'Nigeria', 'divine@gmail.com', 08123547589, 150000, 'Cabin_crew', 'divine01', 'pass123');


-- 13. FLIGHT LOG
CREATE TABLE Flight_log(
    Flight_log_Id VARCHAR2(10) PRIMARY KEY,
    Log_date TIMESTAMP,
    User_n VARCHAR2(20),
    Flight_id VARCHAR2(20),
    flight_no_old VARCHAR2(20),
    flight_no_new VARCHAR2(20),
    from_old VARCHAR2(20),
    to_old VARCHAR2(20),
    from_new VARCHAR2(20),
    to_new VARCHAR2(20),
    departure_old TIMESTAMP,
    arrival_old TIMESTAMP,
    departure_new TIMESTAMP,
    arrival_new TIMESTAMP,
    airplane_Id_old VARCHAR2(10),
    airplane_id_new VARCHAR2(10),
    airline_id_old VARCHAR2(10),
    airline_id_new VARCHAR2(10),
    comment_remark VARCHAR2(50),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);

INSERT INTO flight_log VALUES('Log001', TO_TIMESTAMP('2026-05-16 10:00:00','YYYY-MM-DD HH24:MI:SS'), 'alice01', 'F001', 'FL100', 'FL101', 'LOS', 'ABV', 'LOS', 'ABV', TO_TIMESTAMP('2026-02-13 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-02-13 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-02-13 08:40:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-02-13 09:40:00','YYYY-MM-DD HH24:MI:SS'), 'A001','A001', 'AL001','AL001', 'Time updated');


-- 14. WEATHER DATA
CREATE TABLE WeatherData(
    log_date DATE,
    Record_time TIMESTAMP,
    Station VARCHAR2(20),
    Temperature VARCHAR2(10),
    Humidity VARCHAR2(10),
    air_pressure VARCHAR2(10),
    wind VARCHAR2(10),
    weather VARCHAR2(10),
    wind_direction VARCHAR2(20)
);

INSERT INTO WeatherData VALUES ('01-Apr-2026', TO_TIMESTAMP('2026-01-01 07:00:00','YYYY-MM-DD HH24:MI:SS'), 'LOS', '30C', '70%', '1013hPa', '15km/h', 'Sunny', 'SW');