CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(100), email VARCHAR(60) UNIQUE, password VARCHAR(60));