CREATE DATABASE Voyages;

USE Voyages;

CREATE TABLE Destinations (
	NoDestination int(3) not null ,
	LibDestination char(30) not null,
	PRIMARY KEY(NoDestination) )
	ENGINE = InnoDB;

CREATE TABLE Voyages (
	NoVoyage INT(3) not null,
 	LibVoyage CHAR(30) not null, 
	DateDebut  DATE not null, 
	Duree INT(2) not null, 
	NbInscrits INT(2) not null, 
	NoDestination INT(3) not null ,
	PRIMARY KEY (NoVoyage),
	INDEX(NoDestination),
	FOREIGN KEY (NoDestination) REFERENCES Destinations(NoDestination))
	ENGINE = InnoDB;

CREATE TABLE Clients (
	CodeCli int(3) not null,
	NomCli char(30),
	PreCli char(30),
	AdrCli char(30),
	TelCli char(10),
	PRIMARY KEY(CodeCli))
	ENGINE = INNODB;

CREATE TABLE Inscrits (
	CodeInscrit int(4) not null ,
	NoVoyage int(3), 
	CodeCli int(3),
        PRIMARY KEY (CodeInscrit),  
        INDEX(NoVoyage),
	INDEX(CodeCli),
	FOREIGN KEY (NoVoyage) references Voyages(NoVoyage),
	FOREIGN KEY (CodeCli)references Clients(CodeCli)) 
	ENGINE = INNODB;
