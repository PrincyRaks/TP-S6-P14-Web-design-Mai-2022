create database ia;
create user ia with password 'ia';
ALTER DATABASE ia OWNER TO ia;
\c ia ia;

-- CREATE TABLE categorie(
--     id serial primary key,
--     nomcategorie varchar(50) not null
-- );
-- INSERT into categorie
-- VALUES (default, 'Article'),
--     (default, 'Evenement');

CREATE TABLE etat(
    id serial primary key,
    nometat varchar(50) not null
);
INSERT into etat
VALUES (default, 'non-publie'),
(default, 'publie');

CREATE TABLE admin(
    idadmin serial primary key,
    login varchar(50) not null,
    motdepasse varchar(50) not null
);
INSERT INTO admin
VALUES (default, 'author1', 'author1');
INSERT INTO admin
VALUES (default, 'author2', 'author2');
INSERT INTO admin
VALUES (default, 'author3', 'author3');




CREATE TABLE Annonce(
    id serial primary key,
    titre varchar(250) not null,
    resume text ,
    photo text not null,
    contenu text,
    datecreation timestamp not null default NOW(),
    datepublication timestamp,
    nomPhoto varchar(250) not null,
    idetat int default 1 references etat(id),
    idadmin int not null references admin(idadmin)
);

-- ALTER TABLE article RENAME COLUMN admin TO login;
-- ALTER TABLE annonce DROP COLUMN datefin;
-- ALTER TABLE annonce DROP COLUMN datedebut;
-- ALTER TABLE annonce ADD COLUMN nomphoto varchar(250);
