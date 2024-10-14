DROP DATABASE TINTIN;
-- Créer la base de données TINTIN
CREATE DATABASE TINTIN;

-- Se positionner sur la base de données TINTIN
USE TINTIN;

-- Créer les 5 tables présentées ci-dessus

/*
ALBUM(noalb, titrealb, datealb)
		noalb: clé primaire
*/
CREATE TABLE ALBUM (
noalb INT NOT NULL,
titrealb VARCHAR(30),
datealb INT,
PRIMARY KEY (noalb)
);


/*
PERSONNAGE (nopers, nompers, prenom, fonction, sexe, gentil)
		nopers : clé primaire
*/
CREATE TABLE PERSONNAGE (
nopers INT NOT NULL, 
nompers VARCHAR(15), 
prenom VARCHAR(15), 
fonction VARCHAR(15), 
sexe CHAR(1), 
gentil CHAR(3),
PRIMARY KEY (nopers)
);

/*
PARTICIPER(noalb, nopers)
		noalb, nopers : clé primaire
		noalb : clé étrangère en référence à noalb de ALBUM
		nopers : clé étrangère en référence à nopers de PERSONNAGE
*/
CREATE TABLE PARTICIPER (
noalb INT NOT NULL, 
nopers INT NOT NULL,
PRIMARY KEY (noalb, nopers),
FOREIGN KEY (noalb) REFERENCES ALBUM(noalb),
FOREIGN KEY (nopers) REFERENCES PERSONNAGE(nopers)
);

/*
PAYS(nopays, nompays)
		nopays : clé primaire
*/
CREATE TABLE PAYS (
nopays INT NOT NULL, 
nompays VARCHAR(15),
PRIMARY KEY (nopays)
);


/*
DEROULER(noalb, nopays)
		noalb, nopays : clé primaire
		noalb : clé étrangère en référence à noalb de ALBUM
		nopays : clé étrangère en référence à nopays de PAYS
*/
CREATE TABLE DEROULER (
noalb INT NOT NULL, 
nopays INT NOT NULL,
PRIMARY KEY (noalb, nopays),
FOREIGN KEY (noalb) REFERENCES ALBUM(noalb),
FOREIGN KEY (nopays) REFERENCES PAYS(nopays)
);

-- Insérer les jeux de données présents dans les extraits

INSERT INTO ALBUM (NOALB,TITREALB,DATEALB)
VALUES (1, 'TINTIN AU CONGO', 1930),
(2, 'TINTIN EN AMERIQUE', 1931), 
(8, 'LE CRABE AUX PINCES D''OR', 1940);

INSERT INTO PERSONNAGE (NOPERS,NOMPERS,PRENOM,FONCTION,SEXE,GENTIL) 
VALUES (1,'TINTIN',NULL,'REPORTER','M','OUI'),
(2,'HADDOCK',NULL,'CAPITAINE','M','OUI');

INSERT INTO PARTICIPER (NOALB, NOPERS)	
VALUES
(1,1),
(2,1),
(8,1),
(8,2);

INSERT INTO PAYS (NOPAYS, NOMPAYS)
VALUES
(1,'CONGO'),
(2,'AMERIQUE'),
(3,'BELGIQUE'),
(4,'MAROC');		

INSERT INTO DEROULER (NOALB, NOPAYS)
VALUES 
(1,1),
(2,2),
(8,3),
(8,4);




