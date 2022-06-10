/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals;
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;


UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth >= '2022/01/01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) 
FROM animals 
GROUP BY species;

SELECT species, MAX(weight_kg) 
FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) 
FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-31-12'
GROUP BY species;

SELECT
  animals.name AS animals_name,
  owners.name AS owners_name
FROM animals
JOIN owners ON animals.owner_id = owners.id;

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id; 

SELECT species.name, count(*) FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY count(*) desc
limit 1;