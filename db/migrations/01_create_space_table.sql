CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(100), short_description VARCHAR(200), price MONEY, date_from VARCHAR(12), date_to VARCHAR(12);)

CREATE TABLE booking(booking_id SERIAL PRIMARY KEY, property_name VARCHAR(100), stay_date VARCHAR(10) );

