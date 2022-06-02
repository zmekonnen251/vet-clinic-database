/* Populate database with sample data. */

INSERT INTO owners (full_name,age)
VALUES  ('Sam Smith',34),
        ('Jennifer Orwell',19),
        ('Bob',45),
        ('Melody Pond',77),
        ('Dean Winchester',14),
        ('Jodie Whittaker',38);

INSERT INTO species(name)
VALUES ('Pokemon'),('Digimon');

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id) 
VALUES ('Agumon','2020-02-03',0,TRUE,10.23,2,1),
      ('Gabumon','2018-11-15',2,TRUE,8.0,2,2),
      ('Pikachu','2021-01-07',1,FALSE,15.00,1,2),
      ('Devimon','2017-05-12',5,TRUE,11.00,2,3),
      ('Charmander','2020-02-08',0,FALSE,11.00,1,4),
      ('Plantmon','2020-11-15',2,TRUE,5.7,2,3),
      ('Squirtle','1993-04-02',3,FALSE,12.13,1,4),
      ('Angemon','2005-04-02',1,TRUE,45.00,2,5),
      ('Boarmon','2005-06-07',7,TRUE,20.04,2,5),
      ('Blossom','1998-10-13',3,TRUE,17.00,1,4),
      ('Ditto','2022-05-14',4,TRUE,22.00,1,null);

INSERT INTO vets (name,age,date_of_graduation)
VALUES('William Tatcher',45,'2020-04-23'),
      ('Maisy Smith',26,'2019-01-17'),
      ('Stephanie Mendez',64 ,'1981-05-05'),
      ('Jack Harkness',64 ,'2008-05-08');

INSERT INTO specializations (vet_name,speceis_name)
VALUES('William Tatcher','Pokemon'),
      ('Stephanie Mendez','Digimon'),
      ('Stephanie Mendez','Pokemon'),
      ('Jack Harkness','Digimon');

INSERT INTO visits (animal_name,vet_name,date_of_visit)
VALUES('Agumon','William Tatcher','2020-05-24'),
      ('Agumon','William Tatcher','2020-05-24'),
      ('Agumon','Stephanie Mendez','2020-07-22'),
      ('Gabumon','Jack Harkness','2021-02-02'),
      ('Pikachu','Maisy Smith','2020-03-08'),
      ('Pikachu','Maisy Smith','2020-05-24'),
      ('Pikachu','Maisy Smith','2020-05-14'),
      ('Devimon','Stephanie Mendez','2021-05-04'),
      ('Charmander','Jack Harkness','2021-05-24'),
      ('Plantmon','Maisy Smith','2019-11-21'),
      ('Plantmon','William Tatcher','2020-08-10'),
      ('Plantmon','William Tatcher','2021-04-07'),
      ('Squirtle','Stephanie Mendez','2019-09-29'),
      ('Angemon','Jack Harkness','2020-10-03'),
      ('Angemon','Jack Harkness','2020-11-04'),
      ('Boarmon','Maisy Smith','2019-01-24'),
      ('Boarmon','Maisy Smith','2019-05-15'),
      ('Boarmon','Maisy Smith','2020-02-27'),
      ('Boarmon','Maisy Smith','2020-08-03'),
      ('Blossom','Stephanie Mendez','2020-05-24'),
      ('Blossom','William Tatcher','2021-01-11');









