
CREATE DATABASE IF NOT EXISTS themis CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE themis;

create table if not exists Kunden(
    kundenID int not null auto_increment primary key,
    anrede VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    titel VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    nname VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    vname VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    geb date, 
    sozialvnr VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    famstand VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    tel1 VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    tel2 VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    email VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    plz VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    ort VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    land VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    staatsbuergerschaft VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    str VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    hausnr VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    tuernr VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    beruf VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    bank VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    iban VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    bic VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);


create table if not exists Vertrag_allg(
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
('Herr', 'Dr.', 'Müller', 'Hans', '1980-01-15', '1234', 'Verheiratet', '0123456789', '0987654321', 'hans.mueller@example.com', '10115', 'Berlin', 'Deutschland', 'Deutsch', 'Hauptstraße', '1', '2', 'Arzt', 'Deutsche Bank', 'DE12345678901234567890', 'DEUTDEBBXXX'),
('Frau', 'Prof.', 'Schmidt', 'Anna', '1975-05-20', '5678', 'Ledig', '0123456780', '0987654320', 'anna.schmidt@example.com', '80331', 'München', 'Deutschland', 'Deutsch', 'Bahnhofstraße', '3', '4', 'Professorin', 'Commerzbank', 'DE22345678901234567890', 'COBADEFFXXX'),
('Herr', 'Dipl.-Ing.', 'Schneider', 'Peter', '1985-03-12', '2345', 'Verheiratet', '0123456781', '0987654321', 'peter.schneider@example.com', '50667', 'Köln', 'Deutschland', 'Deutsch', 'Schulstraße', '5', '6', 'Ingenieur', 'Volksbank', 'DE32345678901234567890', 'GENODEF1V01'),
('Frau', '', 'Weber', 'Katrin', '1990-10-25', '6789', 'Verheiratet', '0123456782', '0987654322', 'katrin.weber@example.com', '20095', 'Hamburg', 'Deutschland', 'Deutsch', 'Ringstraße', '7', '8', 'Lehrerin', 'Postbank', 'DE42345678901234567890', 'PBNKDEFFXXX'),
('Herr', 'Mag.', 'Fischer', 'Stefan', '1988-09-30', '3456', 'Verheiratet', '0123456783', '0987654323', 'stefan.fischer@example.com', '60311', 'Frankfurt', 'Deutschland', 'Deutsch', 'Musterweg', '9', '10', 'Jurist', 'Sparkasse', 'DE52345678901234567890', 'SPARKDEFFXXX'),
('Frau', '', 'Bauer', 'Sabine', '1978-04-15', '7890', 'Geschieden', '0123456784', '0987654324', 'sabine.bauer@example.com', '01067', 'Dresden', 'Deutschland', 'Deutsch', 'Waldstraße', '11', '12', 'Ärztin', 'Deutsche Bank', 'DE62345678901234567890', 'DEUTDEDBXXX'),
('Herr', '', 'Wagner', 'Thomas', '1995-07-21', '4567', 'Ledig', '0123456785', '0987654325', 'thomas.wagner@example.com', '68159', 'Mannheim', 'Deutschland', 'Deutsch', 'Blumenstraße', '13', '14', 'Architekt', 'Commerzbank', 'DE72345678901234567890', 'COBADEFFXXX'),
('Frau', '', 'Wolf', 'Petra', '1982-02-18', '8901', 'Verheiratet', '0123456786', '0987654326', 'petra.wolf@example.com', '60311', 'Frankfurt', 'Deutschland', 'Deutsch', 'Gartenstraße', '15', '16', 'Lehrerin', 'Volksbank', 'DE82345678901234567890', 'GENODEF1V02'),
('Herr', '', 'Meyer', 'Michael', '1992-11-11', '5670', 'Ledig', '0123456787', '0987654327', 'michael.meyer@example.com', '10785', 'Berlin', 'Deutschland', 'Deutsch', 'Seestraße', '17', '18', 'Bankkaufmann', 'Postbank', 'DE92345678901234567890', 'PBNKDEFFXXX'),
('Frau', '', 'Becker', 'Julia', '1986-06-08', '6781', 'Verheiratet', '0123456788', '0987654328', 'julia.becker@example.com', '04109', 'Leipzig', 'Deutschland', 'Deutsch', 'Parkstraße', '19', '20', 'Ärztin', 'Sparkasse', 'DE02345678901234567890', 'SPARKDEFFXXX'),
('Herr', '', 'Schulz', 'Martin', '1989-12-30', '3450', 'Verheiratet', '0123456789', '0987654329', 'martin.schulz@example.com', '90402', 'Nürnberg', 'Deutschland', 'Deutsch', 'Schillerstraße', '21', '22', 'Lehrer', 'Deutsche Bank', 'DE12345678901234567891', 'DEUTDEBBXXX'),
('Frau', '', 'Koch', 'Sabrina', '1973-03-15', '2341', 'Ledig', '0123456790', '0987654330', 'sabrina.koch@example.com', '39104', 'Magdeburg', 'Deutschland', 'Deutsch', 'Mozartstraße', '23', '24', 'Künstlerin', 'Commerzbank', 'DE22345678901234567891', 'COBADEFFXXX'),
('Herr', '', 'Richter', 'Lukas', '1984-09-29', '4562', 'Verheiratet', '0123456791', '0987654331', 'lukas.richter@example.com', '70173', 'Stuttgart', 'Deutschland', 'Deutsch', 'Beethovenstraße', '25', '26', 'Musiker', 'Volksbank', 'DE32345678901234567891', 'GENODEF1V03'),
('Frau', '', 'Neumann', 'Laura', '1991-01-19', '6783', 'Verheiratet', '0123456792', '0987654332', 'laura.neumann@example.com', '48143', 'Münster', 'Deutschland', 'Deutsch', 'Bachstraße', '27', '28', 'Journalistin', 'Postbank', 'DE42345678901234567891', 'PBNKDEFFXXX'),
('Herr', '', 'Schwarz', 'Tim', '1993-07-14', '7894', 'Ledig', '0123456793', '0987654333', 'tim.schwarz@example.com', '28195', 'Bremen', 'Deutschland', 'Deutsch', 'Lindenstraße', '29', '30', 'Designer', 'Sparkasse', 'DE52345678901234567891', 'SPARKDEFFXXX'),
('Frau', '', 'Zimmermann', 'Claudia', '1980-05-25', '8905', 'Verheiratet', '0123456794', '0987654334', 'claudia.zimmermann@example.com', '40213', 'Düsseldorf', 'Deutschland', 'Deutsch', 'Eichenstraße', '31', '32', 'Ärztin', 'Deutsche Bank', 'DE62345678901234567891', 'DEUTDEDBXXX'),
('Herr', '', 'Krüger', 'Jan', '1997-09-10', '3456', 'Ledig', '0123456795', '0987654335', 'jan.krueger@example.com', '99084', 'Erfurt', 'Deutschland', 'Deutsch', 'Weinstraße', '33', '34', 'Student', 'Commerzbank', 'DE72345678901234567891', 'COBADEFFXXX'),
('Frau', '', 'Hofmann', 'Lisa', '1983-12-04', '2347', 'Verheiratet', '0123456796', '0987654336', 'lisa.hofmann@example.com', '30159', 'Hannover', 'Deutschland', 'Deutsch', 'Rosenstraße', '35', '36', 'Ärztin', 'Volksbank', 'DE82345678901234567891', 'GENODEF1V04'),
('Herr', '', 'Walter', 'Felix', '1990-08-07', '4568', 'Ledig', '0123456797', '0987654337', 'felix.walter@example.com', '60311', 'Frankfurt', 'Deutschland', 'Deutsch', 'Kirchstraße', '37', '38', 'Architekt', 'Postbank', 'DE92345678901234567891', 'PBNKDEFFXXX'),
('Frau', '', 'Klein', 'Nina', '1987-02-28', '7899', 'Verheiratet', '0123456798', '0987654338', 'nina.klein@example.com', '50667', 'Köln', 'Deutschland', 'Deutsch', 'Hafenstraße', '39', '40', 'Rechtsanwältin', 'Sparkasse', 'DE02345678901234567891', 'SPARKDEFFXXX');