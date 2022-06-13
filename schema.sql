/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS specializations;


CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE animals (
    id  SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL,
    species_id INT,
    owner_id INT,
    CONSTRAINT fk_species_id
        FOREIGN KEY(species_id)
        REFERENCES species(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_owner_id
        FOREIGN KEY(owner_id)
        REFERENCES owners(id)
        ON DELETE CASCADE
);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    id SERIAL PRIMARY KEY,
    vet_name VARCHAR(100),
    speceis_name VARCHAR(100)
);

CREATE TABLE visits(
   id SERIAL PRIMARY KEY,
   vet_id INT,
   animal_id INT,
   date_of_visit DATE
);
