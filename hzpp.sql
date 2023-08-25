DROP TABLE KARTICA CASCADE CONSTRAINTS;
DROP TABLE KARTA CASCADE CONSTRAINTS;
DROP TABLE KUPAC CASCADE CONSTRAINTS;
DROP TABLE POPUST CASCADE CONSTRAINTS;
DROP TABLE POSTAJA CASCADE CONSTRAINTS;
DROP TABLE PUT CASCADE CONSTRAINTS;
DROP TABLE PUT_VLAK CASCADE CONSTRAINTS;
DROP TABLE VLAK CASCADE CONSTRAINTS;
DROP TABLE ZAPOSLENIK CASCADE CONSTRAINTS;
DROP TABLE ZAPOSLENIK_VLAK CASCADE CONSTRAINTS;


CREATE TABLE karta (
    karta_id             NUMBER NOT NULL,
    vrijeme_kupnje       TIMESTAMP NOT NULL,
    rezervacija_sjedala  NUMBER NOT NULL,
    razred               NUMBER NOT NULL,
    vrijeme_polaska      TIMESTAMP NOT NULL,
    datum_polaska        DATE NOT NULL,
    kupac_kupac_id       NUMBER NOT NULL,
    put_put_id           NUMBER NOT NULL
);

ALTER TABLE karta ADD CONSTRAINT karta_pk PRIMARY KEY ( karta_id );

CREATE TABLE kartica (
    kartica_id      NUMBER NOT NULL,
    kupac_kupac_id  NUMBER NOT NULL,
    kategorija      VARCHAR2(15) NOT NULL
);


ALTER TABLE kartica ADD CONSTRAINT kartica_pk PRIMARY KEY ( kartica_id );

CREATE TABLE kupac (
    kupac_id  NUMBER NOT NULL,
    ime       VARCHAR2(15) NOT NULL,
    prezime   VARCHAR2(15) NOT NULL
);

ALTER TABLE kupac ADD CONSTRAINT kupac_pk PRIMARY KEY ( kupac_id );

CREATE TABLE popust (
    popust_id           VARCHAR2(20) NOT NULL,
    iznos               FLOAT NOT NULL,
    kartica_kartica_id  NUMBER NOT NULL
);


ALTER TABLE popust ADD CONSTRAINT popust_pk PRIMARY KEY ( popust_id );

CREATE TABLE postaja (
    postaja_id    NUMBER NOT NULL,
    naziv_mjesta  VARCHAR2(20) NOT NULL
);

ALTER TABLE postaja ADD CONSTRAINT postaja_pk PRIMARY KEY ( postaja_id );

CREATE TABLE put (
    put_id     NUMBER NOT NULL,
    trajanje   INTERVAL DAY(2) TO SECOND(0) NOT NULL,
    polaziste  VARCHAR2(20) NOT NULL,
    odrediste  VARCHAR2(20) NOT NULL
);

ALTER TABLE put ADD CONSTRAINT put_pk PRIMARY KEY ( put_id );

CREATE TABLE put_vlak (
    vlak_vlak_id  NUMBER NOT NULL,
    put_put_id    NUMBER NOT NULL
);

ALTER TABLE put_vlak ADD CONSTRAINT put_vlak_pk PRIMARY KEY ( vlak_vlak_id, put_put_id );

CREATE TABLE vlak (
    vlak_id      NUMBER NOT NULL,
    kapacitet    NUMBER NOT NULL,
    tip          VARCHAR2(10) NOT NULL,
    broj_vagona  NUMBER NOT NULL
);

ALTER TABLE vlak ADD CONSTRAINT vlak_pk PRIMARY KEY ( vlak_id );

CREATE TABLE zaposlenik (
    zaposlenik_id       NUMBER NOT NULL,
    ime                 VARCHAR2(15) NOT NULL,
    prezime             VARCHAR2(15) NOT NULL,
    adresa              VARCHAR2(30) NOT NULL,
    dob                 NUMBER NOT NULL,
    placa               NUMBER NOT NULL,
    opis_posla          VARCHAR2(10) NOT NULL,
    tel                 NUMBER NOT NULL,
    pocetak_rada        DATE NOT NULL,
    kraj_radnog_odnosa  DATE NULL,
    postaja_postaja_id  NUMBER NOT NULL
);

ALTER TABLE zaposlenik ADD CONSTRAINT zaposlenik_pk PRIMARY KEY ( zaposlenik_id );

CREATE TABLE zaposlenik_vlak (
    zaposlenik_zaposlenik_id  NUMBER NOT NULL,
    vlak_vlak_id              NUMBER NOT NULL
);

ALTER TABLE zaposlenik_vlak ADD CONSTRAINT zaposlenik_vlak_pk PRIMARY KEY ( zaposlenik_zaposlenik_id, vlak_vlak_id );

ALTER TABLE karta
    ADD CONSTRAINT karta_kupac_fk FOREIGN KEY ( kupac_kupac_id )
        REFERENCES kupac ( kupac_id );

ALTER TABLE karta
    ADD CONSTRAINT karta_put_fk FOREIGN KEY ( put_put_id )
        REFERENCES put ( put_id );

ALTER TABLE kartica
    ADD CONSTRAINT kartica_kupac_fk FOREIGN KEY ( kupac_kupac_id )
        REFERENCES kupac ( kupac_id );

ALTER TABLE popust
    ADD CONSTRAINT popust_kartica_fk FOREIGN KEY ( kartica_kartica_id )
        REFERENCES kartica ( kartica_id );

ALTER TABLE put_vlak
    ADD CONSTRAINT relation_11_put_fk FOREIGN KEY ( put_put_id )
        REFERENCES put ( put_id );

ALTER TABLE put_vlak
    ADD CONSTRAINT relation_11_vlak_fk FOREIGN KEY ( vlak_vlak_id )
        REFERENCES vlak ( vlak_id );

ALTER TABLE zaposlenik_vlak
    ADD CONSTRAINT relation_20_vlak_fk FOREIGN KEY ( vlak_vlak_id )
        REFERENCES vlak ( vlak_id );

ALTER TABLE zaposlenik_vlak
    ADD CONSTRAINT relation_20_zaposlenik_fk FOREIGN KEY ( zaposlenik_zaposlenik_id )
        REFERENCES zaposlenik ( zaposlenik_id );

ALTER TABLE zaposlenik
    ADD CONSTRAINT zaposlenik_postaja_fk FOREIGN KEY ( postaja_postaja_id )
        REFERENCES postaja ( postaja_id );

INSERT INTO kupac (kupac_id, ime, prezime) VALUES (1,'Ilija','Matic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (2,'David','Dragic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (3,'Dario','Vlasic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (4,'Stipe','Dragic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (5,'Ivor','Kasun');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (6,'Danijel','Pavletic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (7,'Damjan','Dragovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (8,'Nino','Lovren');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (9,'Bruno','Tomic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (10,'Leo','Tomcic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (11,'Lukas','Peric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (12,'Toni','Jurisa');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (13,'Danijel','Ivanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (14,'Domagoj','Pavletic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (15,'Lukas','Vinkovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (16,'Franjo','Markovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (17,'Rafael','Matic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (18,'Ivan','Kosar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (19,'Gabrijel','Milic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (20,'Marin','Kosar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (21,'Andrej','Franic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (22,'Mate','Babic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (23,'Adam','Matic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (24,'Luka','Ivanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (25,'Ivano','Peric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (26,'Duje','Pavic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (27,'Mate','Vlahovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (28,'Leon','Mlakar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (29,'Alen','Milic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (30,'Fran','Vuka');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (31,'Aleksandar','Pavic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (32,'Vedran','Maras');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (33,'Adam','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (34,'Bruno','Knezevic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (35,'Fran','Ivanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (36,'Borna','Horvat');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (37,'Vedran','Tomic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (38,'Noa','Broz');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (39,'Aleksandar','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (40,'Vice','Raic-Sudar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (41,'Roko','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (42,'Aleksandar','Filipovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (43,'Dorian','Zoric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (44,'Frane','Modric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (45,'Ivano','Ratkovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (46,'Gabriel','Cupic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (47,'Franko','Vuka');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (48,'Leonardo','Kovac');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (49,'Damjan','Pavic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (50,'Marko','Vlahovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (51,'Aleksandar','Broz');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (52,'Mario','Vlahovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (53,'Karlo','Bogdanic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (54,'Franjo','Antic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (55,'Patrik','Vuka');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (56,'Simun','Kovacevic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (57,'Mislav','Vincetic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (58,'Leon','Jurisa');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (59,'Mateo','Broz');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (60,'Gabrijel','Maric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (61,'Toma','Juric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (62,'Josip','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (63,'Toma','Tomcic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (64,'Lukas','Grgic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (65,'Petar','Bogdanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (66,'Danijel','Tomic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (67,'Mateo','Horvat');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (68,'David','Maric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (69,'Teo','Raic-Sudar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (70,'Nino','Kranjcar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (71,'Bartol','Franjic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (72,'Nino','Corluka');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (73,'Lovre','Markovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (74,'Luka','Peric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (75,'Patrik','Modric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (76,'Vanja','Ivanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (77,'Lukas','Novak');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (78,'Domagoj','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (79,'Niko','Zoric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (80,'Jakov','Knezevic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (81,'Viktor','Novak');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (82,'Tomislav','Radic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (83,'Toni','Bozic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (84,'Ivor','Tomcic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (85,'Stipe','Knezevic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (86,'Marijan','Dragovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (87,'Tomislav','Raic-Sudar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (88,'Emil','Zoric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (89,'Gabrijel','Marusic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (90,'David','Matic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (91,'Marino','Antic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (92,'Emanuel','Kosar');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (93,'Sven','Vukovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (94,'Teo','Maric');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (95,'Bartol','Franic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (96,'Rafael','Perkovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (97,'Lovre','Vlasic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (98,'Benjamin','Bogdanovic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (99,'Karlo','Nikolic');
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (100,'Duje','Modric');



INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (1, 1, 'student');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (2, 2, 'umirovljenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (3, 3, 'učenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (4, 4, 'mladi');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (5, 5, 'student');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (6, 6, 'učenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (7, 7, 'umirovljenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (8, 8, 'standardno');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (9, 9, 'student');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (10, 10, 'učenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (11, 11, 'umirovljenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (12, 12, 'standardno');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (13, 13, 'student');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (14, 14, 'učenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (15, 15, 'umirovljenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (16, 16, 'invalid');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (17, 17, 'student');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (18, 18, 'učenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (19, 19, 'umirovljenik');
INSERT INTO kartica (kartica_id, kupac_kupac_id, kategorija) VALUES (20, 20, 'djeca');


INSERT INTO popust (popust_id, iznos, kartica_kartica_id) VALUES ('ucenik', 0.3, 10);
INSERT INTO popust(popust_id, iznos, kartica_kartica_id) VALUES ('djeca', 0.5, 20); 
INSERT INTO popust(popust_id, iznos, kartica_kartica_id) VALUES ('umirovljenik', 0.5, 19); 
INSERT INTO popust(popust_id, iznos, kartica_kartica_id) VALUES ('invalid', 0.5, 16); 
INSERT INTO popust(popust_id, iznos, kartica_kartica_id) VALUES ('mladi', 0.2, 4); 


INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (1, 'Bedenica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (2, 'Bistra');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (3, 'Brckovljani');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (4, 'Brdovec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (5, 'Dubrava');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (6, 'Dubravica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (7, 'Dugo Selo');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (8, 'Farkasevac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (9, 'Gradec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (10, 'Ivanic-Grad');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (11, 'Jakovlje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (12, 'Jastrebarsko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (13, 'Klinca Sela');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (14, 'Klostar Ivanic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (15, 'Krasic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (16, 'Kravarsko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (17, 'Kriz');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (18, 'Luka');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (19, 'Marija Gorica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (20, 'Orle');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (21, 'Pisarovina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (22, 'Pokupsko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (23, 'Preseka');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (24, 'Pusca');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (25, 'Rakovec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (26, 'Rugvica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (27, 'Samobor');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (28, 'Stupnik');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (29, 'Sveta Nedelja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (30, 'Sveti Ivan Zelina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (31, 'Velika Gorica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (32, 'Vrbovec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (33, 'Zapresic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (34, 'Zumberak');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (35, 'Bedekovcina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (36, 'Budinscina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (37, 'Desinic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (38, 'Donja Stubica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (39, 'DJurmanec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (40, 'Gornja Stubica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (41, 'Hrascina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (42, 'Hum na Sutli');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (43, 'Jesenje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (44, 'Klanjec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (45, 'Konjscina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (46, 'Kraljevec na Sutli');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (47, 'Krapina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (48, 'Krapinske Toplice');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (49, 'Kumrovec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (50, 'Lobor');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (51, 'Mace');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (52, 'Marija Bistrica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (53, 'Mihovljan');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (54, 'Novi Golubovec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (55, 'Oroslavje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (56, 'Petrovsko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (57, 'Pregrada');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (58, 'Radoboj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (59, 'Stubicke Toplice');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (60, 'Sveti Kriz Zacretje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (61, 'Tuhelj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (62, 'Veliko Trgovisce');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (63, 'Zabok');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (64, 'Zagorska Sela');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (65, 'Zlatar');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (66, 'Zlatar Bistrica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (67, 'Donji Kukuruzari');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (68, 'Dvor');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (69, 'Glina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (70, 'Gvozd');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (71, 'Hrvatska Dubica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (72, 'Hrvatska Kostajnica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (73, 'Jasenovac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (74, 'Kutina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (75, 'Lekenik');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (76, 'Lipovljani');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (77, 'Majur');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (78, 'Martinska Ves');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (79, 'Novska');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (80, 'Petrinja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (81, 'Popovaca');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (82, 'Sisak');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (83, 'Sunja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (84, 'Topusko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (85, 'Velika Ludina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (86, 'Barilovic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (87, 'Bosiljevo');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (88, 'Cetingrad');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (89, 'Draganic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (90, 'Generalski Stol');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (91, 'Josipdol');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (92, 'Kamanje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (93, 'Krnjak');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (94, 'Lasinja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (95, 'Netretic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (96, 'Plaski');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (97, 'Rakovica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (98, 'Ribnik');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (99, 'Saborsko');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (100, 'Tounj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (101, 'Vojnic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (102, 'Zakanje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (103, 'Duga Resa');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (104, 'Karlovac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (105, 'Ogulin');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (106, 'Ozalj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (107, 'Slunj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (108, 'Brinje');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (109, 'Donji Lapac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (110, 'Gospic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (111, 'Karlobag');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (112, 'Lovinac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (113, 'Novalja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (114, 'Otocac');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (115, 'Perusic');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (116, 'Plitvicka Jezera');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (117, 'Senj');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (118, 'Udbina');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (119, 'Vrhovine');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (120, 'Bednja');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (121, 'Beretinec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (122, 'Breznica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (123, 'Breznicki Hum');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (124, 'Cestica');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (125, 'Donja Voca');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (126, 'Gornji Kneginec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (127, 'Jalzabet');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (128, 'Ivanec');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (129, 'Klenovnik');
INSERT INTO postaja (postaja_id, naziv_mjesta) VALUES (130, 'Ljubescica');


INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (1, 'Marko', 'Marković', 'I. Kozarca 77', 30, 5000, 'blagajnik', 123456789, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 1);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (2, 'Ana', 'Anić', 'J. Kozarca 3', 28, 4500, 'kondukter', 987654321, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 2);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (3, 'Ivan', 'Ivanić', 'R. Boskovica 57', 35, 5500, 'strojovoda', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 3);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (4, 'Petra', 'Petrović', 'Alojzija Stepinca 90', 32, 5200, 'blagajnik', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 4);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (5, 'Ante', 'Antić', 'Put Voljaka 45', 29, 4800, 'kondukter', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 5);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (6, 'Marta', 'Martinović', 'Nincevica gumno 12', 31, 5100, 'strojovoda', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 6);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (7, 'Ivo', 'Ivić', 'Bunje 89', 27, 4400, 'blagajnik', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 7);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (8, 'Lucija', 'Lucić', 'Blage Zadre 44', 33, 5300, 'kondukter', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 8);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (9, 'Filip', 'Filipović', 'Kriznog puta 58', 30, 5000, 'strojovoda', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 9);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (10, 'Lara', 'Larić', 'Zvonarska 77', 28, 4500, 'blagajnik', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 10);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (11, 'Borna', 'Bornić', 'Zvonimirova 76', 35, 5500, 'kondukter', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 11);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (12, 'Mia', 'Mijić', 'Put Arapovca 32', 32, 5200, 'strojovoda', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 12);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (13, 'Leo', 'Leonić', 'Banova ulica 79', 29, 4800, 'blagajnik', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 13);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (14, 'Ema', 'Emić', 'Stjepana Radica 74', 31, 5100, 'kondukter', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 14);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (15, 'Mateo', 'Mateović', 'Vojarska 33', 27, 4400, 'strojovoda', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 15);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (16, 'Nina', 'Ninić', 'Zaluzje 77', 33, 5300, 'blagajnik', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 16);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (17, 'Stjepan', 'Stjepanić', 'H. D. Genschera 58', 30, 5000, 'kondukter', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 17);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (18, 'Helena', 'Helenić', 'Ohridska 44', 28, 4500, 'strojovoda', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 18);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (19, 'Igor', 'Igorić', 'Skolska 66', 35, 5500, 'blagajnik', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 19);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (20, 'Klara', 'Klarić', 'Sinjska 99', 32, 5200, 'kondukter', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 20);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (21, 'Luka', 'Lukić', 'Senjska 56', 29, 4800, 'strojovoda', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 21);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (22, 'Elena', 'Elenić', 'Dalmatinska 55', 31, 5100, 'blagajnik', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 22);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (23, 'Stipe', 'Stipić', 'Okuc 18', 27, 4400, 'kondukter', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 23);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (24, 'Nikolina', 'Nikolić', 'Don L. Jelica 98', 33, 5300, 'strojovoda', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 24);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (25, 'Ivan', 'Ivanić', 'I.B. Mazuranic 44', 30, 5000, 'blagajnik', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 25);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (26, 'Mia', 'Mijić', 'Bartola Kasica 56', 28, 4500, 'kondukter', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 26);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (27, 'Leo', 'Leonić', 'Ribicka 13', 35, 5500, 'strojovoda', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 27);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (28, 'Ema', 'Emić', 'Mezanovci 7', 32, 5200, 'blagajnik', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 28);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (29, 'Ivan', 'Ivanić', 'Lj. Gaja 12', 30, 5000, 'kondukter', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 29);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (30, 'Mia', 'Mijić', 'A. Starcevica 78', 28, 4500, 'strojovoda', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 30);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (31, 'Luka', 'Lukić', 'Augusta Senoe 99', 35, 5500, 'blagajnik', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 31);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (32, 'Elena', 'Elenić', 'Dragutina Zanica Karle 22', 32, 6000, 'kondukter', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 32);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (33, 'Stipe', 'Stipić', 'Matije Gupca 4', 29, 3000, 'strojovoda', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 33);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (34, 'Nikolina', 'Nikolić', 'Bogdanovacka 6', 31, 5100, 'blagajnik', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 34);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (35, 'Ivan', 'Ivanić', 'Martina Divalta 66', 27, 4400, 'kondukter', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 35);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (36, 'Mia', 'Mijić', 'Vocarska 77', 33, 5300, 'strojovoda', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 36);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (37, 'Leo', 'Leonić', 'Suncana 22', 30, 5000, 'blagajnik', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 37);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (38, 'Ema', 'Emić', 'Duga 9', 28, 4500, 'kondukter', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 38);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (39, 'Ivan', 'Ivanić', 'Petra Preradovica 4', 35, 5500, 'strojovoda', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 39);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (40, 'Mia', 'Mijić', 'Nikole Tesle 3', 32, 5200, 'blagajnik', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 40);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (41, 'Luka', 'Lukić', 'Drinska 8', 29, 4800, 'kondukter', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 41);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (42, 'Elena', 'Elenić', 'Ivana Gorana Kovačića 3', 31, 5100, 'strojovoda', 888999000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 42);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (43, 'Stipe', 'Stipić', 'Vukovarska 18', 27, 4400, 'blagajnik', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 43);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (44, 'Nikolina', 'Nikolić', 'Poljska 2', 33, 5300, 'kondukter', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 44);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (45, 'Ivan', 'Ivanić', 'Trsatska 64', 30, 5000, 'strojovoda', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 45);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (46, 'Mia', 'Mijić', 'Ulica Blage Zadre 67', 28, 4500, 'blagajnik', 111222333, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 46);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (47, 'Leo', 'Leonić', 'Milisici 8', 35, 5500, 'kondukter', 444555666, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 47);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (48, 'Ema', 'Emić', 'Sesartici 52', 32, 5200, 'strojovoda', 777888999, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 48);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (49, 'Ivan', 'Ivanić', 'Bubici 88', 30, 5000, 'blagajnik', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 49);
INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (50, 'Andrija', 'Mijić', 'Petra Kruzica 24', 28, 10000, 'kondukter', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 50);


INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (1, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (2, 200, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (3, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (4, 120, 'putnicki', 4);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (5, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (6, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (7, 250, 'teretni', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (8, 250, 'teretni', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (9, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (10, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (11, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (12, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (13, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (14, 200, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (15, 100, 'putnicki', 3);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (16, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (17, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (18, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (19, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (20, 120, 'putnicki', 4);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (21, 200, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (22, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (23, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (24, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (25, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (26, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (27, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (28, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (29, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (30, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (31, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (32, 200, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (33, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (34, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (35, 220, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (36, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (37, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (38, 200, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (39, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (40, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (41, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (42, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (43, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (44, 250, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (45, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (46, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (47, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (48, 200, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (49, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (50, 220, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (51, 200, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (52, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (53, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (54, 190, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (55, 100, 'putnicki', 3);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (56, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (57, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (58, 140, 'putnicki', 4);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (59, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (60, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (61, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (62, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (63, 180, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (64, 160, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (65, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (66, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (67, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (68, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (69, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (70, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (71, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (72, 160, 'brzi', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (73, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (74, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (75, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (76, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (77, 220, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (78, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (79, 190, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (80, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (81, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (82, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (83, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (84, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (85, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (86, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (87, 200, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (88, 220, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (89, 220, 'putnicki', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (90, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (91, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (92, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (93, 180, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (94, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (95, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (96, 250, 'putnicki', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (97, 260, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (98, 190, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (99, 200, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (100, 220, 'brzi', 7);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (101, 190, 'brzi', 6);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (102, 300, 'teretni', 8);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (103, 150, 'putnicki', 5);
INSERT INTO vlak (vlak_id, kapacitet, tip, broj_vagona) VALUES (104, 300, 'teretni', 8);



INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (1, INTERVAL '2 2:30:00' DAY TO SECOND, 'Zagreb', 'Split');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (2, INTERVAL '1 1:15:00' DAY TO SECOND, 'Osijek', 'Zagreb');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (3, INTERVAL '3 3:45:00' DAY TO SECOND, 'Rijeka', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (4, INTERVAL '14 14:00:00' DAY TO SECOND, 'Split', 'Dubrovnik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (5, INTERVAL '2 2:20:00' DAY TO SECOND, 'Zadar', 'Šibenik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (6, INTERVAL '1 1:30:00' DAY TO SECOND, 'Zagreb', 'Varaždin');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (7, INTERVAL '2 2:15:00' DAY TO SECOND, 'Split', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (8, INTERVAL '3 3:00:00' DAY TO SECOND, 'Zagreb', 'Rijeka');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (9, INTERVAL '1 1:45:00' DAY TO SECOND, 'Dubrovnik', 'Split');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (10, INTERVAL '2 2:30:00' DAY TO SECOND, 'Šibenik', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (11, INTERVAL '1 1:15:00' DAY TO SECOND, 'Varaždin', 'Zagreb');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (12, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (13, INTERVAL '4 4:10:00' DAY TO SECOND, 'Split', 'Dubrovnik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (14, INTERVAL '2 2:20:00' DAY TO SECOND, 'Šibenik', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (15, INTERVAL '1 1:30:00' DAY TO SECOND, 'Zagreb', 'Varaždin');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (16, INTERVAL '2 2:15:00' DAY TO SECOND, 'Zadar', 'Split');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (17, INTERVAL '3 3:00:00' DAY TO SECOND, 'Rijeka', 'Zagreb');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (18, INTERVAL '1 1:45:00' DAY TO SECOND, 'Split', 'Dubrovnik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (19, INTERVAL '2 2:30:00' DAY TO SECOND, 'Zadar', 'Šibenik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (20, INTERVAL '1 1:15:00' DAY TO SECOND, 'Varaždin', 'Zagreb');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (21, INTERVAL '3 3:45:00' DAY TO SECOND, 'Rijeka', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (22, INTERVAL '4 4:10:00' DAY TO SECOND, 'Split', 'Dubrovnik');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (23, INTERVAL '2 2:20:00' DAY TO SECOND, 'Šibenik', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (24, INTERVAL '1 1:30:00' DAY TO SECOND, 'Zagreb', 'Varaždin');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (25, INTERVAL '2 2:15:00' DAY TO SECOND, 'Split', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (26, INTERVAL '3 3:00:00' DAY TO SECOND, 'Zagreb', 'Rijeka');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (27, INTERVAL '1 1:45:00' DAY TO SECOND, 'Dubrovnik', 'Split');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (28, INTERVAL '2 2:30:00' DAY TO SECOND, 'Šibenik', 'Zadar');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (29, INTERVAL '1 1:15:00' DAY TO SECOND, 'Varaždin', 'Zagreb');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (30, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');



INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (1, TO_TIMESTAMP('08:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_DATE('2023-07-19', 'YYYY-MM-DD'), 1, 1);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), TO_DATE('2023-07-20', 'YYYY-MM-DD'), 2, 25);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (3, TO_TIMESTAMP('11:15:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), TO_DATE('2023-07-21', 'YYYY-MM-DD'), 3, 3);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (4, TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), TO_DATE('2023-07-22', 'YYYY-MM-DD'), 4, 14);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (5, TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), TO_DATE('2023-07-23', 'YYYY-MM-DD'), 5, 9);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (6, TO_TIMESTAMP('08:15:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-07-24', 'YYYY-MM-DD'), 6, 27);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (7, TO_TIMESTAMP('15:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_DATE('2023-07-25', 'YYYY-MM-DD'), 7, 2);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (8, TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), TO_DATE('2023-07-26', 'YYYY-MM-DD'), 8, 19);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (9, TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), TO_DATE('2023-07-27', 'YYYY-MM-DD'), 9, 30);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (10, TO_TIMESTAMP('16:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_DATE('2023-07-28', 'YYYY-MM-DD'), 10, 11);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (11, TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), TO_DATE('2023-07-29', 'YYYY-MM-DD'), 12, 22);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (12, TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_DATE('2023-07-30', 'YYYY-MM-DD'), 13, 1);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (13, TO_TIMESTAMP('11:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:15:00', 'HH24:MI:SS'), TO_DATE('2023-07-31', 'YYYY-MM-DD'), 14, 16);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (14, TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), 15, 29);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (15, TO_TIMESTAMP('12:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), 16, 8);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (16, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-03', 'YYYY-MM-DD'), 17, 21);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (17, TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-04', 'YYYY-MM-DD'), 18, 4);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (18, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 19, 17);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (19, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-06', 'YYYY-MM-DD'), 20, 28);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (20, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-07', 'YYYY-MM-DD'), 21, 7);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (21, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_DATE('2023-08-08', 'YYYY-MM-DD'), 22, 18);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (22, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), 0, 1, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-09', 'YYYY-MM-DD'), 23, 1);  
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (23, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), 24, 13);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (24, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-11', 'YYYY-MM-DD'), 25, 26);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (25, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-12', 'YYYY-MM-DD'), 26, 6);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (26, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), 27, 19);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (27, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-14', 'YYYY-MM-DD'), 28, 10);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (28, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 29, 23);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (29, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-16', 'YYYY-MM-DD'), 30, 4);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (30, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-17', 'YYYY-MM-DD'), 31, 16);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (31, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_DATE('2023-08-18', 'YYYY-MM-DD'), 32, 29);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (32, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-19', 'YYYY-MM-DD'), 33, 9);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (33, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-20', 'YYYY-MM-DD'), 34, 22);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (34, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-21', 'YYYY-MM-DD'), 35, 5);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (35, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-22', 'YYYY-MM-DD'), 36, 17);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (36, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_DATE('2023-08-23', 'YYYY-MM-DD'), 37, 30); 
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (37, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-24', 'YYYY-MM-DD'), 38, 11);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (38, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), 0, 1, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-25', 'YYYY-MM-DD'), 39, 24);  
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (39, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 40, 6);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (40, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 41, 19);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (41, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 42, 2);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (42, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 43, 14);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (43, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('13:15:00', 'HH24:MI:SS'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 44, 27);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (44, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 45, 7);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (45, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('10:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 46, 20);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (46, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 47, 3);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (47, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 48, 15);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (48, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('17:15:00', 'HH24:MI:SS'), TO_DATE('2023-09-04', 'YYYY-MM-DD'), 49, 28);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (49, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 1, 1, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 50, 10);
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (50, TO_TIMESTAMP('09:50:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 51, 1);


INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (40, 8);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (40, 103);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (23, 88);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (38, 96);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (38, 17);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (46, 78);
INSERT INTO zaposlenik_vlak (zaposlenik_zaposlenik_id, vlak_vlak_id) VALUES (2, 64);

INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (63, 1);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (30, 2);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (29, 11);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (44, 30);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (49, 15);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (26, 5);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (36, 14);
INSERT INTO put_vlak (vlak_vlak_id, put_put_id) VALUES (66, 8);


COMMIT;


-- jednostavni

SELECT * FROM put 
WHERE polaziste = 'Zagreb' AND odrediste = 'Split';


SELECT * FROM put;


SELECT * 
FROM vlak 
WHERE vlak_id IN (SELECT vlak_id FROM vlak WHERE tip = 'teretni');


SELECT * 
FROM zaposlenik 
WHERE zaposlenik_id IN (SELECT zaposlenik_id FROM zaposlenik WHERE ime = 'Andrija');


SELECT * 
FROM put 
WHERE polaziste = 'Zagreb';


SELECT * 
FROM karta 
WHERE razred = 1;


UPDATE zaposlenik
SET placa = 20000   --postavlja zaposleniku s id = 1 placu na 20000
WHERE zaposlenik_id = 1;


SELECT zaposlenik_id, placa
FROM zaposlenik     --test query za prethodni update place
WHERE zaposlenik_id = 1;


--upiti nad vise tablica


-- uzimamo ime, prezime zaposlenika i na kojem vlaku se nalaze, id vlaka i tip
-- ima 7 outputa jer ima samo 7 zaposlenika na vlakovima u insertima
SELECT DISTINCT ime, prezime, vlak_id, tip
FROM zaposlenik 
JOIN zaposlenik_vlak ON zaposlenik.zaposlenik_id = zaposlenik_vlak.zaposlenik_zaposlenik_id
JOIN vlak ON zaposlenik_vlak.vlak_vlak_id = vlak.vlak_id;


--dohvacamo id kartice, kategoriju u koju spada kupac i iznos popusta koji svaki od kupaca ima
SELECT kartica_id, kategorija, iznos
FROM kartica
INNER JOIN popust ON kartica.kartica_id = popust.kartica_kartica_id;


--uzimamo ime i prezime zaposlenika i na kojoj postaji se nalazi
SELECT ime, prezime, naziv_mjesta
FROM zaposlenik 
INNER JOIN postaja ON zaposlenik.zaposlenik_id = postaja.postaja_id;


--dohvacamo id kupca, karte, vrijeme polaska i datum polaska za svakog kupca
SELECT kupac_id, karta_id, vrijeme_kupnje, datum_polaska
FROM karta 
INNER JOIN kupac ON karta.karta_id = kupac.kupac_id;


--dohvacamo ime i prezime kupca i id kartice koju ima
SELECT ime, prezime, kartica_id 
FROM kupac 
LEFT JOIN kartica ON kupac.kupac_id = kartica.kartica_id;


--dohvacamo id karte i id puta na odredenim relacijama
SELECT karta_id, trajanje, polaziste, odrediste
FROM karta
INNER JOIN put ON karta.karta_id = put.put_id;


--uzimamo puteve s pridruzenim vlakovima na putovanjima
SELECT DISTINCT put_id, trajanje, polaziste, odrediste, vlak_id, tip
FROM put
JOIN put_vlak ON put_id = put_id
JOIN vlak ON vlak_id = put_id;


--dohvacamo popuste s pridruzenim karticama i podacima kupca(ime, prezime)
SELECT iznos, kartica_id, kategorija, ime, prezime
FROM popust 
JOIN kartica ON popust.kartica_kartica_id = kartica.kartica_id
JOIN kupac ON kartica.kupac_kupac_id = kupac.kupac_id
ORDER BY iznos DESC;


--isti kao prethodni query ali je profiltriran da gleda samo di je iznos popusta 0.5
SELECT iznos, kartica_id, kategorija, ime, prezime
FROM popust 
LEFT JOIN kartica ON popust.kartica_kartica_id = kartica.kartica_id
LEFT JOIN kupac ON kartica.kupac_kupac_id = kupac.kupac_id
WHERE iznos = 0.5
ORDER BY iznos;


--dohvacamo podatke o karti i kupcu koji je kupio kartu
SELECT DISTINCT karta_id, vrijeme_kupnje, razred, vrijeme_polaska, datum_polaska,
       ime, prezime
FROM karta
INNER JOIN kupac ON karta.kupac_kupac_id = kupac.kupac_id;


--dohvacamo podatke o pojedinim kartama na pojedinim relacijama
SELECT karta_id, vrijeme_kupnje, razred, vrijeme_polaska, datum_polaska,
       trajanje, polaziste, odrediste
FROM karta 
LEFT JOIN put ON karta.karta_id = put.put_id;



--koristeci agregirajuce fje

SELECT COUNT(*) 
FROM karta;


SELECT COUNT(*) 
FROM karta 
WHERE razred = 1;


SELECT AVG(MAX(placa))
FROM zaposlenik
GROUP BY zaposlenik_id;


--trazimo medijan place za svaki opis posla
SELECT opis_posla, MEDIAN(placa)
FROM zaposlenik
GROUP BY opis_posla;


--rangiram zaposlenike po placi
SELECT zaposlenik_id, prezime, placa,
       RANK() OVER (ORDER BY placa DESC) RANK
  FROM zaposlenik; 



-- settanje default vrijednosti u razlicite tablice za razlicite atribute


ALTER TABLE karta 
MODIFY razred DEFAULT 2;


ALTER TABLE vlak 
MODIFY kapacitet DEFAULT 200;


ALTER TABLE vlak
MODIFY broj_vagona DEFAULT 5;


ALTER TABLE zaposlenik
MODIFY placa DEFAULT 3500;


ALTER TABLE vlak
MODIFY tip DEFAULT 'putnicki';



--subquerys, nested querys etc


SELECT ime, prezime, placa, pocetak_rada, postaja_postaja_id
FROM zaposlenik 
    WHERE placa = (SELECT MAX(placa) 
    FROM zaposlenik) 
    OR placa = (SELECT MIN(placa) 
    FROM zaposlenik
);                               


SELECT COUNT(*) 
FROM karta 
WHERE razred = 2 
    AND kupac_kupac_id 
    IN (SELECT kupac_id 
    FROM kupac 
    WHERE kupac_id 
    IN (SELECT kupac_kupac_id 
    FROM kartica 
    WHERE kategorija = 'student')
);


SELECT COUNT(*) 
FROM karta 
WHERE kupac_kupac_id 
    IN (SELECT kupac_id 
    FROM kupac 
    WHERE kupac_id 
    IN (SELECT kupac_kupac_id 
    FROM kartica 
    WHERE kategorija = 'student')) 
    AND put_put_id 
    IN (SELECT put_id 
    FROM put 
    WHERE polaziste = 'Zagreb' 
    AND odrediste = 'Split'
);


--trazimo ime i prezime kupca koji je kupio kartu s popustom
SELECT ime, prezime
FROM kupac
WHERE kupac_id IN (
    SELECT DISTINCT k.kupac_kupac_id
    FROM karta k
    JOIN popust p ON k.karta_id = p.kartica_kartica_id
);



--trazimo ukupan broj mjesta rezerviranih u svakom razredu za određeno putovanje
SELECT razred, COUNT(*) AS broj_rezervacija
FROM karta
WHERE put_put_id = (
    SELECT put_id
    FROM put
    WHERE polaziste = 'Zagreb' AND odrediste = 'Split'
)
GROUP BY razred;


--trazimo ime i prezime zaposlenika koji radi na vise vlakova
SELECT ime, prezime
FROM zaposlenik
WHERE zaposlenik_id IN (
    SELECT zv.zaposlenik_zaposlenik_id
    FROM zaposlenik_vlak zv
    GROUP BY zv.zaposlenik_zaposlenik_id
    HAVING COUNT(*) > 1
);




--dodani novi atributi u razlicite tablice


ALTER TABLE karta ADD broj_karte NUMBER(10);

UPDATE karta
SET broj_karte = 1536  --update tablice karta, postavljamo broj karte na 1536 gdje je id karte 1
WHERE karta_id = 1;

SELECT broj_karte, karta_id
FROM karta         --test query za prethodni update broja karte
WHERE broj_karte = 1536;



ALTER TABLE vlak ADD max_brzina INTEGER;

UPDATE vlak
SET max_brzina = 80   --update tablice vlak, postavljamo max_brzinu koju smo dodali u prethodnom redu na 80 gdje je id vlaka 5
WHERE vlak_id = 5;

SELECT max_brzina, vlak_id
FROM vlak                    --test query za prethodni update max_brzine
WHERE max_brzina = 80;



ALTER TABLE postaja ADD broj_perona INTEGER;

UPDATE postaja
SET broj_perona = 5   --update tablice postaja, postavljamo broj perona na 5 gdje je id postaje 1
WHERE postaja_id = 1;

SELECT broj_perona, postaja_id
FROM postaja                    --test query za prethodni update broja perona
WHERE broj_perona = 5;



--uvjeti


--treba bacit error jer mehaničar nije u opisu posla
ALTER TABLE zaposlenik ADD CONSTRAINT opis_posla_check 
CHECK (opis_posla IN ('strojovoda', 'blagajnik', 'kondukter'));

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (52, 'Mijo', 'Majić', 'Stipe Kruzica 23', 19, 7500, 'mehaničar', 988758403, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 130);


--treba bacit error jer niti jedan razred osim 1 i 2 ne mozemo insertati
ALTER TABLE karta ADD CONSTRAINT razred_check
CHECK (razred IN (1, 2));

INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (52, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 2, 3, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 100, 29);



--dodani komentari


COMMENT ON TABLE karta IS 'This table stores data about tickets';
COMMENT ON TABLE popust IS 'This table stores data about discount you can get with your card';
COMMENT ON TABLE postaja IS 'This table stores data about stations';
COMMENT ON TABLE zaposlenik IS 'This table stores data about every employee';
COMMENT ON TABLE kupac IS 'This table stores data about every customer';


SELECT table_name, comments
FROM all_tab_comments
WHERE table_name IN ('KARTA', 'POPUST', 'POSTAJA', 'ZAPOSLENIK', 'KUPAC');



-- indexi


CREATE INDEX karta_kupac_kupac_id_idx ON karta (kupac_kupac_id);
CREATE INDEX karta_put_put_id_idx ON karta (put_put_id);
CREATE INDEX karta_vrijeme_polaska_idx ON karta (vrijeme_polaska);
CREATE INDEX zaposlenik_placa_idx ON zaposlenik (placa);
CREATE INDEX popust_iznos_idx ON popust (iznos);

--bitmap koristim gdje imam manje podataka, npr razred samo prvi i drugi, rezervacija sjedala samo 0 i 1
CREATE BITMAP INDEX karta_razred_idx ON karta (razred);
CREATE BITMAP INDEX karta_rezervacija_sjedala_idx ON karta (rezervacija_sjedala);




-- procedure


--prva procedura
CREATE OR REPLACE PROCEDURE remove_zap (zaposlenik_id_to_delete NUMBER) AS
BEGIN
   DELETE FROM zaposlenik_vlak
   WHERE zaposlenik_zaposlenik_id = zaposlenik_id_to_delete;


   DELETE FROM zaposlenik
   WHERE zaposlenik.zaposlenik_id = zaposlenik_id_to_delete;
   COMMIT; 
END;
/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (51, 'Stipa', 'Stipić', 'Drniška 8', 24, 3000, 'kondukter', 222333444, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 130);

SELECT * FROM zaposlenik;      -- provjera nalazi li se zaposlenik s 54 id u tablici zaposlenik

CALL remove_zap(51);

SELECT * FROM zaposlenik;


--druga procedura
CREATE OR REPLACE PROCEDURE delete_ticket (karta_id NUMBER) AS 
   trip_count NUMBER;
BEGIN
   -- provjeravamo postoji li karta
   SELECT COUNT(*)
   INTO trip_count
   FROM karta
   WHERE karta_id = delete_ticket.karta_id;

   IF trip_count = 0 THEN
      -- bacamo error ako nema karte
      RAISE_APPLICATION_ERROR(-20002, 'Ticket not found!');
   ELSE
      -- provjeravamo je li karta na putovanju
      SELECT COUNT(*)
      INTO trip_count
      FROM put_vlak pv
      JOIN karta k ON pv.put_put_id = k.put_put_id
      WHERE k.karta_id = delete_ticket.karta_id;

      IF trip_count > 0 THEN
         -- bacamo error ako je karta trenutno na putovanju
         RAISE_APPLICATION_ERROR(-20001, 'Cannot delete ticket. Ticket is currently on a trip!');
      ELSE
         -- brisemo kartu ako nije na putovanju
         DELETE FROM karta
         WHERE karta_id = delete_ticket.karta_id;

         COMMIT;
      END IF;
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      --handlamo ostale error-e
      RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END;
/

--test case za delete karte ako nije pridruzena putovanju
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (102, 'Duje', 'Modric');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (32, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (51, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 2, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 102, 32);

SELECT * FROM karta;

CALL delete_ticket(51);

SELECT * FROM karta;

--test case da baci error ako je karta pridruzena putovanju
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (102,'Duje','Modric');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (32, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');
INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (51, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 2, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 54, 1);

CALL delete_ticket(51);

--test case da baci error 'Ticket not found!'
INSERT INTO kupac (kupac_id, ime, prezime) VALUES (102,'Duje','Modric');
INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (32, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');

CALL delete_ticket(51);



--treca procedura
CREATE OR REPLACE PROCEDURE update_discount (
    p_discount_id IN popust.popust_id%TYPE,
    p_new_amount IN popust.iznos%TYPE
)
AS
BEGIN
    IF p_new_amount > 0 AND p_new_amount < 1 THEN
        UPDATE popust
        SET iznos = p_new_amount
        WHERE popust_id = p_discount_id;
        COMMIT;
    ELSE 
        RAISE_APPLICATION_ERROR(-20022, 'Wrong discount amount!'); 
    END IF;
END;
/

SELECT * FROM popust;     --vadimo podatke koji su u tablici popust od prvih inserta gdje jos nismo pozvali proceduru

CALL update_discount('djeca', 0.6);
CALL update_discount('ucenik', 0.4);

SELECT * FROM popust;    --provjeravamo jesmo li nakon poziva procedure updateali popuste s id-jem djeca i ucenik

--bacit ce error na ovaj poziv jer je iznos popusta veci od 1
CALL update_discount('djeca', 2);




-- triggeri

--prvi trigger
--preventa brisanje zaposlenika iz baze ako je on jos zaposlen
CREATE OR REPLACE TRIGGER prevent_zaposlenik_delete
BEFORE DELETE ON zaposlenik
FOR EACH ROW
BEGIN
    IF :OLD.kraj_radnog_odnosa IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete this employee, he is still employed.');
    END IF;
END;
/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime, adresa, dob, placa, opis_posla, tel, pocetak_rada, kraj_radnog_odnosa, postaja_postaja_id)
VALUES (90, 'Andrija', 'Mijić', 'Petra Kruzica 24', 28, 10000, 'kondukter', 555666777, TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL, 50);

DELETE 
FROM zaposlenik 
WHERE zaposlenik_id = 90;


--drugi trigger
--triggerat ce se ako pokusamo obrisati put koji ima pridruzenih karata, odnosno ako su karte jos u opticaju za odredeni put
CREATE OR REPLACE TRIGGER prevent_put_delete
BEFORE DELETE ON put
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM karta
    WHERE put_put_id = :OLD.put_id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cannot delete this route, there are associated tickets.');
    END IF;
END;
/


INSERT INTO put (put_id, trajanje, polaziste, odrediste) VALUES (35, INTERVAL '3 3:45:00' DAY TO SECOND, 'Zadar', 'Rijeka');

INSERT INTO karta (karta_id, vrijeme_kupnje, rezervacija_sjedala, razred, vrijeme_polaska, datum_polaska, kupac_kupac_id, put_put_id)
VALUES (58, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 0, 2, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 51, 35);

DELETE FROM put
WHERE put_id = 35;



