/* Database schema to keep the structure of entire database. */
CREATE Database vet_clinic;
CREATE TABLE animals (
    id  INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL,
    species VARCHAR(50);
);
