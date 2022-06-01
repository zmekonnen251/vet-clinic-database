/* Database schema to keep the structure of entire database. */
DROP Database vet_clinic;
DROP TABLE animals;

CREATE Database vet_clinic;

CREATE TABLE animals (
    id  SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL,
    species VARCHAR(50)
);

CREATE TABLE owners{
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
}

CREATE TABLE species{
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
}