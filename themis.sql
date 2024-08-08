
create database if not exists themis;
use themis;

create table if not exists Kunden(
    kundenID int not null auto_increment primary key,
    anrede VARCHAR(20),
    titel VARCHAR(100),
    nname VARCHAR(255),
    vname VARCHAR(255),
    geb date, 
    sozialvnr VARCHAR(50),
    famstand VARCHAR(255),
    tel1 VARCHAR(50),
    tel2 VARCHAR(50),
    email VARCHAR(100),
    plz VARCHAR(20),
    ort VARCHAR(100), 
    str VARCHAR(255),
    hausnr VARCHAR(20),
    tuernr VARCHAR(20),
    wohnart VARCHAR(255),
    beruf VARCHAR(255),
    bankkonto VARCHAR(255)
);


create table if not exists Vertrag_allg(
    vertragsID int not null auto_increment primary key,
    gesellschaft VARCHAR(255),
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

INSERT INTO Kunden (titel, nname, vname, geb, sozialvnr, famstand, tel1, email, plz, ort, str, wohnart, beruf)
VALUES 
    (NULL, 'Mustermann', 'Matthias', '1996-11-09', '5052 091196', 'ledig', '06761234567', 'max.mustermann@example.com', '1010', 'Wien', 'Stephansplatz 1', 'Wohnung', 'Student'),
    ('Dr.', 'Müller', 'Anna', '1985-05-21', '3034 210585', 'verheiratet', '066012345678', 'anna.mueller@example.com', '4020', 'Linz', 'Hauptstraße 10', 'Eigentumshaus', 'Ärztin'),
    (NULL, 'Schmidt', 'Julia', '1978-09-15', '4012 150978', 'verheiratet', '069912345678', 'julia.schmidt@example.com', '5020', 'Salzburg', 'Mozartgasse 5', 'Wohnung', 'Lehrerin'),
    (NULL, 'Wagner', 'Markus', '1990-03-30', '8013 300390', 'ledig', '067612345678', 'markus.wagner@example.com', '8020', 'Graz', 'Hauptplatz 3', 'Wohnung', 'Informatiker'),
    ('Mag.', 'Huber', 'Sabine', '1973-07-12', '6011 120773', 'geschieden', '066012345678', 'sabine.huber@example.com', '6020', 'Innsbruck', 'Universitätsstraße 10', 'Wohnung', 'Juristin'),
    (NULL, 'Fischer', 'Thomas', '1982-04-18', '3056 180482', 'ledig', '069912345678', 'thomas.fischer@example.com', '1030', 'Wien', 'Landstraßer Hauptstraße 15', 'Wohnung', 'Verkäufer'),
    ('Dr.', 'Neumann', 'Monika', '1967-12-05', '4059 051267', 'ledig', '067612345678', 'monika.neumann@example.com', '1130', 'Wien', 'Hietzinger Hauptstraße 20', 'Wohnung', 'Psychologin'),
    (NULL, 'Weber', 'Andreas', '1975-06-29', '8054 290675', 'verheiratet', '066012345678', 'andreas.weber@example.com', '8045', 'Graz', 'Griesplatz 7', 'Eigentumshaus', 'Architekt'),
    (NULL, 'Leitner', 'Petra', '1989-08-07', '3076 070889', 'ledig', '069912345678', 'petra.leitner@example.com', '9020', 'Klagenfurt', 'Villacher Ring 1', 'Wohnung', 'Ingenieurin'),
    (NULL, 'Maier', 'Stefan', '1980-01-25', '7035 250180', 'ledig', '067612345678', 'stefan.maier@example.com', '6020', 'Innsbruck', 'Rennweg 8', 'Wohnung', 'Journalist'),
    (NULL, 'Berger', 'Martina', '1995-10-03', '5071 031095', 'ledig', '066012345678', 'martina.berger@example.com', '5020', 'Salzburg', 'Mirabellplatz 4', 'Wohnung', 'Studentin'),
    ('Dr.', 'Winkler', 'Andreas', '1971-02-14', '4096 140271', 'verheiratet', '069912345678', 'andreas.winkler@example.com', '5020', 'Salzburg', 'Schlossallee 15', 'Eigentumshaus', 'Anwalt'),
    (NULL, 'Schuster', 'Christina', '1986-11-28', '6053 281186', 'ledig', '067612345678', 'christina.schuster@example.com', '6020', 'Innsbruck', 'Höttinger Gasse 9', 'Wohnung', 'Designerin'),
    (NULL, 'Mayr', 'Philipp', '1979-03-17', '7059 170379', 'verheiratet', '066012345678', 'philipp.mayr@example.com', '9020', 'Klagenfurt', 'Heuplatz 2', 'Eigentumshaus', 'Unternehmer'),
    (NULL, 'Wiesinger', 'Nicole', '1992-07-06', '6092 060792', 'ledig', '069912345678', 'nicole.wiesinger@example.com', '4040', 'Linz', 'Donaulände 12', 'Wohnung', 'Grafikdesignerin'),
    (NULL, 'Hofmann', 'Alexander', '1987-05-12', '5016 120587', 'verheiratet', '067612345678', 'alexander.hofmann@example.com', '5020', 'Salzburg', 'Mozartstraße 7', 'Eigentumshaus', 'Ingenieur'),
    (NULL, 'Schmid', 'Laura', '1998-09-09', '6073 090998', 'ledig', '066012345678', 'laura.schmid@example.com', '6020', 'Innsbruck', 'Amraser Straße 6', 'Wohnung', 'Studentin'),
    (NULL, 'Binder', 'Dominik', '1984-06-07', '7042 070684', 'ledig', '069912345678', 'dominik.binder@example.com', '6020', 'Innsbruck', 'Sillgasse 3', 'Wohnung', 'Softwareentwickler'),
    ('Dr.', 'Pfeiffer', 'Nadine', '1977-04-30', '8034 300477', 'geschieden', '067612345678', 'nadine.pfeiffer@example.com', '8045', 'Graz', 'Elisabethstraße 18', 'Eigentumshaus', 'Ärztin'),
    (NULL, 'Wolf', 'Julian', '1993-12-15', '5126 151293', 'ledig', '066012345678', 'julian.wolf@example.com', '1010', 'Wien', 'Kärntner Straße 1', 'Wohnung', 'Lehrer');


    -- KFZ-Verträge zuweisen
INSERT INTO Vertrag_allg (gesellschaft, pol, vertragsart, status, beginn, ende, kuedatum, zahlweise, praemie, sparte, verssumme, kundenID)
SELECT 'Allianz', 'A80467891', 'Eigenenvertrag', 'aufrecht', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), CURDATE(), 'monatlich', 150, 'KFZ', 
       CASE 
           WHEN kundenID % 3 = 0 THEN 12000000
           WHEN kundenID % 3 = 1 THEN 15000000
           ELSE 20000000
       END AS verssumme,
       kundenID
FROM Kunden;

-- Haushalts- oder Eigenheimverträge zuweisen
INSERT INTO Vertrag_allg (gesellschaft, pol, vertragsart, status, beginn, ende, kuedatum, zahlweise, praemie, sparte, kundenID)
SELECT 'Allianz', 'A80467891', 'Eigenenvertrag', 'aufrecht', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), CURDATE(), 'monatlich', 300, 
       CASE 
           WHEN kundenID % 2 = 0 THEN 'Haushalt'
           ELSE 'Eigenheim'
       END AS sparte,
       kundenID
FROM Kunden;

-- Unfallversicherungen zuweisen
INSERT INTO Vertrag_allg (gesellschaft, pol, vertragsart, status, beginn, ende, kuedatum, zahlweise, praemie, sparte, kundenID)
SELECT 'Allianz', 'A80467891', 'Eigenenvertrag', 'aufrecht', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), CURDATE(), 'monatlich', 300, 'Unfall', kundenID
FROM Kunden;

-- Lebensversicherungen zuweisen (nur jedem 1/3 Kunden)
INSERT INTO Vertrag_allg (gesellschaft, pol, vertragsart, status, beginn, ende, kuedatum, zahlweise, praemie, sparte, kundenID)
SELECT 'Allianz', 'A80467891', 'Eigenenvertrag', 'aufrecht', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), CURDATE(), 'monatlich', 300, 'Leben', kundenID
FROM Kunden
WHERE kundenID % 3 = 0;

-- Kasko-Versicherungen zuweisen (jedem 5. KFZ-Vertrag)
UPDATE Vertrag_allg 
SET sparte = 'Kasko'
WHERE vertragsID IN (
    SELECT vertragsID
    FROM (
        SELECT vertragsID, ROW_NUMBER() OVER () AS row_num
        FROM Vertrag_allg
        WHERE sparte = 'KFZ'
    ) AS temp
    WHERE row_num % 5 = 0
);
