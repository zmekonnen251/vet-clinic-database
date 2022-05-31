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


