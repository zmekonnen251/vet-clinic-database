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

CREATE INDEX idx_owner_in ON animals(owner_id ASC);
CREATE INDEX idx_species_id ON animals(species_id DESC);


CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    vet_id INT,
    speceis_id INT,
    PRIMARY KEY (vet_id,speceis_id),
    FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE,
    FOREIGN KEY (speceis_id) REFERENCES species (id) ON DELETE CASCADE
);

CREATE INDEX idx_vets_id ON specializations(vet_id,ASC);
CREATE INDEX idx_species_id ON specializations(species_id,DESC);

CREATE TABLE visits(
   vet_id INT,
   animal_id INT,
   date_of_visit DATE,
   PRIMARY KEY (vet_id,animal_id),
   FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE,
   FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE INDEX idx_visits_animal_id ON visits(animal_id ASC);
CREATE INDEX idx_visits_vets_id ON visits(vets_id DESC);

-- DAY 5

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_index ON visits(animal_id DESC);
CREATE INDEX vet_id_index ON visits(vet_id ASC);
CREATE INDEX owner_email_index ON owners(email ASC);

