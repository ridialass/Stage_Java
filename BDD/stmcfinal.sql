# script créé le : Tue Aug 19 10:10:31 CEST 2014 -   syntaxe MySQL ;

# use  VOTRE_BASE_DE_DONNEE ;

DROP TABLE IF EXISTS Type_intervention ;
CREATE TABLE Type_intervention (code_type VARCHAR(10) NOT NULL,
designation_type VARCHAR(80),
code_categorie VARCHAR(10),
PRIMARY KEY (code_type) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Intervention ;
CREATE TABLE Intervention (id_intervention INT AUTO_INCREMENT NOT NULL,
nom_intervention VARCHAR(40),
date_debut DATE,
date_fin DATE,
duree_heures TIME,
code_type VARCHAR(10) NOT NULL,
code_local VARCHAR(10) NOT NULL,
code_equpe VARCHAR(10) NOT NULL,
PRIMARY KEY (id_intervention) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Locaux ;
CREATE TABLE Locaux (code_local VARCHAR(10) NOT NULL,
nom_local VARCHAR(80),
code_site VARCHAR(10),
PRIMARY KEY (code_local) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Produits ;
CREATE TABLE Produits (code_produit VARCHAR(40) NOT NULL,
designation VARCHAR(40),
unite INT(20),
fournisseur VARCHAR(80),
PRIMARY KEY (code_produit) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Intervenants ;
CREATE TABLE Intervenants (code_intervenant VARCHAR(10) NOT NULL,
nom_intervenant VARCHAR(40),
prenom_intervenant VARCHAR(40),
fonction_intervenant VARCHAR(80),
Contact_intervenant VARCHAR(40),
Date_embauche DATE,
contrat VARCHAR(5),
terme_contrat DATE,
PRIMARY KEY (code_intervenant) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Categories ;
CREATE TABLE Categories (code_categorie VARCHAR(10) NOT NULL,
nom_categorie VARCHAR(40),
PRIMARY KEY (code_categorie) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Sites ;
CREATE TABLE Sites (code_site VARCHAR(10) NOT NULL,
nom_site VARCHAR(80),
localisation INT(80),
PRIMARY KEY (code_site) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Equipes ;
CREATE TABLE Equipes (code_equpe VARCHAR(10) NOT NULL,
nom_equipe VARCHAR(40),
nbre_intervenant INTEGER,
code_intervenant VARCHAR(10) NOT NULL,
PRIMARY KEY (code_equpe) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS salaire ;
CREATE TABLE salaire (date_debut_sal DATE NOT NULL,
salaire_h FLOAT,
date_fin_sal DATE,
code_intervenant VARCHAR(10) NOT NULL,
PRIMARY KEY (date_debut_sal) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Comprendre ;
CREATE TABLE Comprendre (code_equpe VARCHAR(10) NOT NULL,
code_intervenant VARCHAR(10) NOT NULL,
PRIMARY KEY (code_equpe,
 code_intervenant) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS utilisation_produit ;
CREATE TABLE utilisation_produit (id_utilisation INT AUTO_INCREMENT NOT NULL,
nom_utilisation VARCHAR(40),
prix_unitaire FLOAT,
quantite FLOAT,
id_intervention INT NOT NULL,
code_produit VARCHAR(40) NOT NULL,
PRIMARY KEY (id_utilisation) ) ENGINE=InnoDB;

ALTER TABLE Type_intervention ADD CONSTRAINT FK_Type_intervention_code_categorie FOREIGN KEY (code_categorie) REFERENCES Categories (code_categorie);

ALTER TABLE Intervention ADD CONSTRAINT FK_Intervention_code_type FOREIGN KEY (code_type) REFERENCES Type_intervention (code_type);
ALTER TABLE Intervention ADD CONSTRAINT FK_Intervention_code_local FOREIGN KEY (code_local) REFERENCES Locaux (code_local);
ALTER TABLE Intervention ADD CONSTRAINT FK_Intervention_code_equpe FOREIGN KEY (code_equpe) REFERENCES Equipes (code_equpe);
ALTER TABLE Locaux ADD CONSTRAINT FK_Locaux_code_site FOREIGN KEY (code_site) REFERENCES Sites (code_site);
ALTER TABLE Equipes ADD CONSTRAINT FK_Equipes_code_intervenant FOREIGN KEY (code_intervenant) REFERENCES Intervenants (code_intervenant);
ALTER TABLE salaire ADD CONSTRAINT FK_salaire_code_intervenant FOREIGN KEY (code_intervenant) REFERENCES Intervenants (code_intervenant);
ALTER TABLE utilisation_produit ADD CONSTRAINT FK_utilisation_produit_id_intervention FOREIGN KEY (id_intervention) REFERENCES Intervention (id_intervention);
ALTER TABLE utilisation_produit ADD CONSTRAINT FK_utilisation_produit_code_produit FOREIGN KEY (code_produit) REFERENCES Produits (code_produit);
ALTER TABLE Comprendre ADD CONSTRAINT FK_Comprendre_code_equpe FOREIGN KEY (code_equpe) REFERENCES Equipes (code_equpe);
ALTER TABLE Comprendre ADD CONSTRAINT FK_Comprendre_code_intervenant FOREIGN KEY (code_intervenant) REFERENCES Intervenants (code_intervenant);
