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

INSERT INTO visits (animal_id,vet_id,date_of_visit)
VALUES('1',1,'2020-05-24'),
      ('1',1,'2020-05-24'),
      ('1',3,'2020-07-22'),
      ('2',4,'2021-02-02'),
      ('3',2,'2020-03-08'),
      ('3',2,'2020-05-24'),
      ('3',2,'2020-05-14'),
      ('4',3,'2021-05-04'),
      ('5',4,'2021-05-24'),
      ('6',2,'2019-11-21'),
      ('6',1,'2020-08-10'),
      ('6',1,'2021-04-07'),
      ('7',3,'2019-09-29'),
      ('8',4,'2020-10-03'),
      ('8',4,'2020-11-04'),
      ('9',2,'2019-01-24'),
      ('9',2,'2019-05-15'),
      ('9',2,'2020-02-27'),
      ('9',2,'2020-08-03'),
      ('10',3,'2020-05-24'),
      ('10',1,'2021-01-11');

-- DAY 5

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';








