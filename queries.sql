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
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT * From animals;

