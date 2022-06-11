/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id              INT GENERATED ALWAYS AS IDENTITY,
  name            VARCHAR(100),
  date_of_birth   DATE,
  escape_attempts INT,
  neutered        BOOLEAN,
  weight_kg       DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owners (
  id              INT GENERATED ALWAYS AS IDENTITY,
  full_name       VARCHAR(200),
  age             INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id              INT GENERATED ALWAYS AS IDENTITY,
  name            VARCHAR(200),
  PRIMARY KEY(id)
);

id              INT GENERATED ALWAYS AS IDENTITY, --animals id is auto inremented
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT;
ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
  id                    INT GENERATED ALWAYS AS IDENTITY   PRIMARY KEY,
  name                  VARCHAR(200),
  age                   INT,
  date_of_graduation    DATE 
);

CREATE TABLE specializations (
  species_id      INT CONSTRAINT FK_species REFERENCES species(id),
  vets_id         INT CONSTRAINT FK_vets REFERENCES vets(id),
  PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
  animals_id      INT CONSTRAINT FK_animals REFERENCES animals(id),
  vets_id         INT CONSTRAINT FK_vets REFERENCES vets(id),
  date_of_visit   DATE,
  PRIMARY KEY (animals_id, vets_id, date_of_visit)
);

