
CREATE DATABASE IF NOT EXISTS themis CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE themis;

CREATE TABLE IF NOT EXISTS kunden(
    kundenID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    anrede VARCHAR(20),
    titel VARCHAR(100),
    nname VARCHAR(255),
    vname VARCHAR(255),
    geb DATE, 
    sozialvnr VARCHAR(50),
    famstand VARCHAR(255),
    tel1 VARCHAR(50),
    tel2 VARCHAR(50),
    email VARCHAR(100),
    plz VARCHAR(20),
    ort VARCHAR(100), 
    land VARCHAR(100),
    staatsbuergerschaft VARCHAR(100),
    str VARCHAR(255),
    hausnr VARCHAR(20),
    tuernr VARCHAR(20),
    beruf VARCHAR(255),
    bank VARCHAR(255),
    iban VARCHAR(255),
    bic VARCHAR(255)
);


create table if not exists vertrag_allg(
    vertragsID int not null auto_increment primary key,
    gesellschaft VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    pol VARCHAR(255), 
    vertragsart VARCHAR(255),
    status VARCHAR(255),
    beginn date,
    ende date,
    kuedatum date,
    kuefrist VARCHAR(255) default '1 Monat',
    zahlweise VARCHAR(255),
    praemie float,
    sparte VARCHAR(255),
    verssumme int,
    kundenID int,
    gesID int
);

create table if not exists besitzt(
    besitztID int not null auto_increment primary key,
    kundenID int,
    vertragsID int,
    foreign key (kundenID) references Kunden (kundenID),
    foreign key (vertragsID) references Vertrag_allg (vertragsID)
);

create table if not exists kfz(
    kfzID int not null auto_increment primary key,
    fhzgart VARCHAR(255),
    marke VARCHAR(255),
    typ VARCHAR(255),
    nat int,
    kz VARCHAR(255),
    bj int,
    leistung int, 
    ccm int,
    plaetze int,
    fin int,
    eigengewicht float,
    gesamtgewicht float,
    leasing boolean,
    antrieb VARCHAR(255), 
    co2 VARCHAR(255),
    freischaden boolean,
    listenpreis float,
    sonderaustattung float,
    kasko boolean,
    mvstBefreit boolean default false,

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)    
);

create table if not exists kasko(
    kaskoID int not null auto_increment primary key,
    kaskoVariante VARCHAR(255),
    sb int,
    parkschaden boolean default true,
    vandalismus boolean default true,
    kleinglasOhneSb boolean default false,
    naturOhneSb boolean default false,
    vstAbzugsberechtig boolean default false,
    gapDeckung boolean default false,
    grobeFahrlaessigkeit boolean default false,

    kfzID int,
    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID),
    foreign key (kfzID) references kfz (kfzID)

    );

create table if not exists haushalt(
    haushaltID int not null auto_increment primary key,
    risikoAdresse VARCHAR(255),
    wohnnutzflaeche int,
    anzPersonen int,
    vsu int,
    sb VARCHAR(255) default 'kein Selbstbehalt',
    privatHp int,
    hundehp boolean,
    mitverAllerImHH boolean,

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)    
);


create table if not exists eigenheim(
    eigenheimID int not null auto_increment primary key,
    gebaeudetyp VARCHAR(255) default 'privates Wohngebaeude',
    bj int,
    bauart VARCHAR(255) default 'massive Bauweise',
    betrieblicheNutzung VARCHAR(255),
    blitzschutzanlage boolean,
    solaranlage boolean,
    fussWandDeckenHeizung boolean,
    ausstattung VARCHAR(255) default 'durchschnittlich',
    flaecheEG int,
    flaecheOG int,
    flaecheDG int,
    flaecheKeller int,
    garage boolean,
    wintergarten int,

    feuer boolean default true,
    sturm boolean default true,
    lw boolean default true,
    haftpflicht boolean default true,
    haftpflichtvsu int,
    unbenannteGefahren boolean default true,

    haushaltID int,
    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID),
    foreign key (haushaltID) references haushalt (haushaltID)
);

create table if not exists unfall(
    unfallID int not null auto_increment primary key,
    versichertePerson VARCHAR(255),
    invaliditaet int,
    progression int,
    maxinvaliditaet int,
    existenzschutz boolean,
    tod int,
    spital int,
    taggeld int,
    rente int,
    knbr int,
    unfallkosten int,
    unfallgeld int,
    heilkosten int,
    bergekosten int,
    rueckholkosten int,
    rehabilitationskosten int,
    kosmetischeOP int,
    soforthilfe int,
    kvNachUnfall boolean,
    hobbytaucher boolean default false,
    bergsteigerRisiko boolean default false,

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)
);

create table if not exists leben(
    lebenID int not null auto_increment primary key,
    sparte VARCHAR(255),

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)
);

create table if not exists rechtsschutz(
    rsID int not null auto_increment primary key,
    schadenersatzRS boolean default true,
    strafRS boolean default true,
    sozialVersRS boolean default true,
    arbeitsgerichtRS boolean default true,
    beratungsRS boolean default true,
    allgVertragsRS boolean default true,
    kfzRS boolean,
    kennzeichen VARCHAR(255),
    lenkerRS boolean,
    grundstueckRS boolean,
    vermieterrisiko VARCHAR(255),
    erbUndFamilienRS boolean,
    ermittlungsRS boolean,
    europadeckung boolean,
    vorsatzdelikte boolean,
    sb int,
    reiseRS boolean,
    patientenRS boolean,
    antiStalkingRS boolean,

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)
);

create table if not exists haftpflicht(
    haftpflichtID int not null auto_increment primary key,
    privatHP boolean,
    grundstueckHP boolean,
    tierHP boolean,
    anzHunde int,
    anzPferde int,
    jagtHP boolean,

    vertragsID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID)
);

create table if not exists t_gesellschaft(
    gesID int not null auto_increment primary key,
    unternehmen VARCHAR(255),
    adresse VARCHAR(255),
    plz int,
    ort VARCHAR(255), 
    ansprechpartner VARCHAR(255), 
    email VARCHAR(255),
    tel VARCHAR(255), 
    vermittlernr VARCHAR(255), 
    rabatte int
);

ALTER TABLE Vertrag_allg
ADD CONSTRAINT gesID
FOREIGN KEY (gesID) REFERENCES t_gesellschaft(gesID);

create table if not exists notizen(
    notizID int not null auto_increment primary key,
    notiz VARCHAR(255),
    kundenID int,
    vertragsID int,
    gesID int,
    foreign key (vertragsID) references Vertrag_allg (vertragsID),
    foreign key (kundenID) references Kunden (kundenID),
    FOREIGN KEY (gesID) REFERENCES t_gesellschaft(gesID)
);



create table if not exists hat(
    hatID int not null auto_increment primary key,
    kundenID int,
    vertragsID int,
    kfzID int,
    kaskoID int,
    haushaltID int,
    eigenheimID int,
    unfallID int,
    lebenID int,
    rsID int,
    haftpflichtID int,
    gesID int,
    notizID int,
    
    foreign key (kundenID) references Kunden (kundenID),
    foreign key (vertragsID) references Vertrag_allg (vertragsID),
    foreign key (kfzID) references kfz (kfzID),
    foreign key (kaskoID) references kasko(kaskoID),
    foreign key (haushaltID) references haushalt(haushaltID),
    foreign key (eigenheimID) references eigenheim (eigenheimID),
    foreign key (unfallID) references unfall(unfallID),
    foreign key (lebenID) references leben (lebenID),
    foreign key (rsID) references rechtsschutz (rsID),
    foreign key (haftpflichtID) references haftpflicht (haftpflichtID),
    foreign key (gesID) references t_gesellschaft (gesID),
    foreign key (notizID) references notizen (notizID)
);
INSERT INTO Kunden 
(anrede, titel, nname, vname, geb, sozialvnr, famstand, tel1, tel2, email, plz, ort, land, staatsbuergerschaft, str, hausnr, tuernr, beruf, bank, iban, bic)
VALUES
('Herr', 'Dr.', 'Moser', 'Johann', '1980-01-15', '1234', 'Verheiratet', '06641234567', '06649876543', 'johann.moser@example.com', '1010', 'Wien', 'Österreich', 'Österreichisch', 'Kärntner Straße', '1', '2', 'Arzt', 'Erste Bank', 'AT611904300234573201', 'GIBAATWWXXX'),
('Frau', 'Mag.', 'Huber', 'Martina', '1975-05-20', '5678', 'Ledig', '06641234568', '06649876544', 'martina.huber@example.com', '5020', 'Salzburg', 'Österreich', 'Österreichisch', 'Getreidegasse', '3', '4', 'Juristin', 'Raiffeisen Bank', 'AT611904300234573202', 'RZBAATWWXXX'),
('Herr', 'Ing.', 'Bauer', 'Thomas', '1985-03-12', '2345', 'Verheiratet', '06641234569', '06649876545', 'thomas.bauer@example.com', '8010', 'Graz', 'Österreich', 'Österreichisch', 'Hauptplatz', '5', '6', 'Ingenieur', 'Bank Austria', 'AT611904300234573203', 'BKAUATWWXXX'),
('Frau', 'Dr.', 'Steiner', 'Eva', '1990-10-25', '6789', 'Verheiratet', '06641234570', '06649876546', 'eva.steiner@example.com', '6020', 'Innsbruck', 'Österreich', 'Österreichisch', 'Maria-Theresien-Straße', '7', '8', 'Ärztin', 'Volksbank', 'AT611904300234573204', 'VBOEATWWXXX'),
('Herr', 'Mag.', 'Hofer', 'Michael', '1988-09-30', '3456', 'Verheiratet', '06641234571', '06649876547', 'michael.hofer@example.com', '4020', 'Linz', 'Österreich', 'Österreichisch', 'Landstraße', '9', '10', 'Jurist', 'BKS Bank', 'AT611904300234573205', 'BKSAATWWXXX'),
('Frau', '', 'Schmidt', 'Klara', '1978-04-15', '7890', 'Geschieden', '06641234572', '06649876548', 'klara.schmidt@example.com', '5020', 'Salzburg', 'Österreich', 'Österreichisch', 'Makartplatz', '11', '12', 'Lehrerin', 'Erste Bank', 'AT611904300234573206', 'GIBAATWWXXX'),
('Herr', '', 'Gruber', 'Florian', '1995-07-21', '4567', 'Ledig', '06641234573', '06649876549', 'florian.gruber@example.com', '1010', 'Wien', 'Österreich', 'Österreichisch', 'Stephansplatz', '13', '14', 'Architekt', 'Raiffeisen Bank', 'AT611904300234573207', 'RZBAATWWXXX'),
('Frau', '', 'Wagner', 'Anna', '1982-02-18', '8901', 'Verheiratet', '06641234574', '06649876550', 'anna.wagner@example.com', '5020', 'Salzburg', 'Österreich', 'Österreichisch', 'Mirabellplatz', '15', '16', 'Journalistin', 'Bank Austria', 'AT611904300234573208', 'BKAUATWWXXX'),
('Herr', '', 'Lehner', 'David', '1992-11-11', '5670', 'Ledig', '06641234575', '06649876551', 'david.lehner@example.com', '8010', 'Graz', 'Österreich', 'Österreichisch', 'Jakominiplatz', '17', '18', 'Bankkaufmann', 'Volksbank', 'AT611904300234573209', 'VBOEATWWXXX'),
('Frau', '', 'Mayr', 'Sabine', '1986-06-08', '6781', 'Verheiratet', '06641234576', '06649876552', 'sabine.mayr@example.com', '4020', 'Linz', 'Österreich', 'Österreichisch', 'Schillerstraße', '19', '20', 'Künstlerin', 'BKS Bank', 'AT611904300234573210', 'BKSAATWWXXX'),
('Herr', '', 'Pichler', 'Lukas', '1989-12-30', '3450', 'Verheiratet', '06641234577', '06649876553', 'lukas.pichler@example.com', '6020', 'Innsbruck', 'Österreich', 'Österreichisch', 'Höttinger Gasse', '21', '22', 'Lehrer', 'Erste Bank', 'AT611904300234573211', 'GIBAATWWXXX'),
('Frau', '', 'Ebner', 'Sophie', '1973-03-15', '2341', 'Ledig', '06641234578', '06649876554', 'sophie.ebner@example.com', '8010', 'Graz', 'Österreich', 'Österreichisch', 'Sporgasse', '23', '24', 'Rechtsanwältin', 'Raiffeisen Bank', 'AT611904300234573212', 'RZBAATWWXXX'),
('Herr', '', 'Fischer', 'Maximilian', '1984-09-29', '4562', 'Verheiratet', '06641234579', '06649876555', 'maximilian.fischer@example.com', '5020', 'Salzburg', 'Österreich', 'Österreichisch', 'Residenzplatz', '25', '26', 'Musiker', 'Bank Austria', 'AT611904300234573213', 'BKAUATWWXXX'),
('Frau', '', 'Berger', 'Katharina', '1991-01-19', '6783', 'Verheiratet', '06641234580', '06649876556', 'katharina.berger@example.com', '1010', 'Wien', 'Österreich', 'Österreichisch', 'Rathausplatz', '27', '28', 'Ärztin', 'Volksbank', 'AT611904300234573214', 'VBOEATWWXXX'),
('Herr', '', 'Winter', 'Stefan', '1993-07-14', '7894', 'Ledig', '06641234581', '06649876557', 'stefan.winter@example.com', '4020', 'Linz', 'Österreich', 'Österreichisch', 'Froschberg', '29', '30', 'Designer', 'BKS Bank', 'AT611904300234573215', 'BKSAATWWXXX'),
('Frau', '', 'Weber', 'Maria', '1980-05-25', '8905', 'Verheiratet', '06641234582', '06649876558', 'maria.weber@example.com', '8010', 'Graz', 'Österreich', 'Österreichisch', 'Herrengasse', '31', '32', 'Lehrerin', 'Erste Bank', 'AT611904300234573216', 'GIBAATWWXXX'),
('Herr', '', 'Hofer', 'Sebastian', '1997-09-10', '3456', 'Ledig', '06641234583', '06649876559', 'sebastian.hofer@example.com', '5020', 'Salzburg', 'Österreich', 'Österreichisch', 'Hellbrunner Allee', '33', '34', 'Student', 'Raiffeisen Bank', 'AT611904300234573217', 'RZBAATWWXXX'),
('Frau', '', 'Kofler', 'Theresa', '1983-12-04', '2347', 'Verheiratet', '06641234584', '06649876560', 'theresa.kofler@example.com', '6020', 'Innsbruck', 'Österreich', 'Österreichisch', 'Sillgasse', '35', '36', 'Journalistin', 'Bank Austria', 'AT611904300234573218', 'BKAUATWWXXX'),
('Herr', '', 'Leitner', 'Philipp', '1990-08-07', '4568', 'Ledig', '06641234585', '06649876561', 'philipp.leitner@example.com', '1010', 'Wien', 'Österreich', 'Österreichisch', 'Opernring', '37', '38', 'Architekt', 'Volksbank', 'AT611904300234573219', 'VBOEATWWXXX'),
('Frau', '', 'Schwarz', 'Nina', '1987-02-28', '7899', 'Verheiratet', '06641234586', '06649876562', 'nina.schwarz@example.com', '8010', 'Graz', 'Österreich', 'Österreichisch', 'Murinsel', '39', '40', 'Rechtsanwältin', 'BKS Bank', 'AT611904300234573220', 'BKSAATWWXXX');