/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE (date_of_birth > 2019 AND date_of_birth < 2016);
SELECT name from animals WHERE (neutered=TRUE AND escape_attempts<3);
SELECT date_of_birth from animals WHERE name='Agumon' or 'Pikachu';
SELECT name from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name!='Gabumon';
SELECT * from animals WHERE (weight_kg > 10.4 AND weight_kg < 17.3);

-- Queries and update
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';
COMMIT;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;


BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '20220101';
SAVEPOINT P1;
UPDATE animals 
SET weight_kg = weight_kg*-1;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

SELECT * FROM animals;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';
COMMIT;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * From animals;

BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '20220101';
SAVEPOINT P1;
UPDATE animals 
SET weight_kg = weight_kg*-1;
ROLLBACK TO P1;
UPDATE animals 
SET weight_kg = weight_kg*-1
WHERE weight_kg<0;
COMMIT;

SELECT * FROM animals;

-- How many animals are there ? 
-- 10
SELECT COUNT(*) as Number_of_animal 
FROM animals;

--How many animals have never tried to escape ?
--2
SELECT COUNT(*) as animal_with_no_escape_attempt 
FROM animals
WHERE escape_attempts=0;

-- What is the average weight of animals ?
-- 15.510000038146973 kg
SELECT AVG(weight_kg) 
FROM animals;

-- Who escapes the most, neutered or not neutered animals?
-- Boarmon
SELECT name 
FROM animals 
WHERE escape_attempts =(SELECT MAX(escape_attempts) FROM animals);

-- What is the minimum and maximum weight of each type of animal?
-- Pokemon (max-17 ,min-11) Digimon(max-45 ,min 5.7)
SELECT species,Max(weight_kg) as Max_Weight,Min(weight_kg) as Min_Weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
-- pokemon = 3.0 digimon=0(no dob b/n 1990-2000)
SELECT species, AVG(escape_attempts ) as average_escape_attempts_1990_2000
FROM animals
WHERE date_of_birth <= '19991231' AND date_of_birth >'19000101'
GROUP BY species;

-- DAY 3

-- What animals belong to Melody Pond?

SELECT name 
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

SELECT * FROM animals
JOIN species 
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT owners.full_name,animals.name
FROM animals
RIGHT JOIN owners
ON owners.id = animals.owner_id;

-- How many animals are there per species?

SELECT species.name,COUNT(animals.name)
FROM animals
JOIN species
ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.

SELECT animals.name
FROM animals
JOIN species
ON species.id = animals.species_id
	JOIN owners
	ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell' 
	AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
      AND animals.escape_attempts = 0;

-- Who owns the most animals?

SELECT owners.full_name as full_name, COUNT(animals) as nums_of_animals
FROM animals
JOIN owners
ON animals.owner_id = owners.id 
GROUP BY owners.full_name
ORDER BY nums_of_animals DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?
-- Plantmon - 2021-04-07

SELECT visits.animal_name ,visits.date_of_visit
FROM visits
WHERE visits.vet_name='William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
-- 4
SELECT COUNT(DISTINCT visits.animal_name) AS different_animals_visited
FROM visits
WHERE visits.vet_name='Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
-- "William Tatcher"	"Pokemon"
-- "Maisy Smith"	
-- "Stephanie Mendez"	"Pokemon"
-- "Stephanie Mendez"	"Digimon"
-- "Jack Harkness"	"Digimon"

SELECT vets.name ,specializations.speceis_name
FROM vets
LEFT JOIN specializations
ON vets.name = specializations.vet_name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
-- "Agumon"	"2020-07-22"
-- "Blossom"	"2020-05-24"

SELECT visits.animal_name ,visits.date_of_visit
FROM visits
WHERE visits.vet_name='Stephanie Mendez'
AND (visits.date_of_visit > '20200501' AND visits.date_of_visit < '20200830');

-- What animal has the most visits to vets?
-- "Boarmon"	4

SELECT visits.animal_name AS most_visited_animal,COUNT(visits.animal_name)
FROM visits
GROUP BY visits.animal_name
ORDER BY COUNT DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
-- "Boarmon"	"2020-08-03"

SELECT visits.animal_name ,visits.date_of_visit
FROM visits
WHERE visits.vet_name='Maisy Smith'
ORDER BY visits.date_of_visit 
DESC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
-- "Charmander"	"Jack Harkness"	"2021-05-24"
-- "Devimon"	"Stephanie Mendez"	"2021-05-04"
-- "Plantmon"	"William Tatcher"	"2021-04-07"
-- "Gabumon"	"Jack Harkness"	"2021-02-02"
-- "Blossom"	"William Tatcher"	"2021-01-11"

SELECT visits.animal_name ,visits.vet_name,visits.date_of_visit
FROM visits
ORDER BY visits.date_of_visit 
DESC LIMIT 5;

-- How many visits were with a vet that did not specialize in that animal's species?
-- 8
SELECT specializations.speceis_name,COUNT(visits.vet_name)
FROM visits
LEFT JOIN specializations 
ON visits.vet_name = specializations.vet_name
GROUP BY specializations.speceis_name
LIMIT 1;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
-- "Digimon"	5
SELECT  species.name ,COUNT(species.name)
FROM animals
LEFT JOIN species 
ON animals.species_id = species.id
JOIN visits
ON animals.name = visits.animal_name
WHERE visits.vet_name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC LIMIT 1;






