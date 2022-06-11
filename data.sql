/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2/3/2020', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '11/15/2018', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '1/7/2021', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '5/12/2017', 5, true, 11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '2/8/2020', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', '11/15/2021', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', '4/2/1993', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', '6/12/2005', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '6/7/2005', 7, true, 20.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', '10/13/1998', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto', '5/14/2022', 4, true, 22);


INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name in ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO specializations (vets_id, species_id)
VALUES
(1, 1),
(3, 1),
(3, 2),
(4, 2);

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '4/23/2000'),
       ('Maisy Smith', 26, '1/17/2019'),
       ('Stephanie Mendez', 64, '5/4/1981'),
       ('Jack Harkness', 38, '6/8/2008');

INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES  (1, 1, '2020-05-24'),
        (1, 3, '2020-07-22'),
        (2, 4, '2021-02-02'),
        (3, 2, '2020-01-05'),
        (3, 2, '2020-03-08'),
        (3, 2, '2020-05-14'),
        (4, 3, '2021-05-04'),
        (5, 4, '2021-02-24'),
        (6, 2, '2019-12-21'),
        (6, 1, '2020-08-10'),
        (6, 2, '2021-04-07'),
        (7, 3, '2019-09-29'),
        (8, 4, '2020-10-03'),
        (8, 4, '2020-11-04'),
        (9, 2, '2019-01-24'),
        (9, 2, '2019-05-15'),
        (9, 2, '2020-02-27'),
        (9, 2, '2020-08-03'),
        (10, 3, '2020-05-24'),
        (10, 1, '2021-01-11');
        