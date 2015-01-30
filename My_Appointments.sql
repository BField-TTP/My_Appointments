$sqlite3 My_Appointments.db

CREATE TABLE GP(
id INTEGER PRIMARY KEY,
Name VARCHAR(120) NOT NULL,
Office_Address VARCHAR(200) NOT NULL,
Phone VARCHAR(15) NOT NULL,
Email VARCHAR(30) NOT NULL,
UNIQUE (Email));

CREATE TABLE Patient(
id INTEGER PRIMARY KEY,
Name VARCHAR(120) NOT NULL,
Address VARCHAR(200) NOT NULL,
Phone VARCHAR(15) NOT NULL,
Email VARCHAR(30) NOT NULL,
History VARCHAR(256),
UNIQUE (Email));

CREATE TABLE Secretary(
id INTEGER PRIMARY KEY,
Name VARCHAR(120) NOT NULL,
Address VARCHAR(200) NOT NULL,
Phone VARCHAR(15) NOT NULL,
Email VARCHAR(30) NOT NULL);

CREATE TABLE Appointment(
id INTEGER PRIMARY KEY,
Date Date NOT NULL,
Time Time NOT NULL,
GP_id INTEGER NOT NULL,
Patient_id INTEGER NOT NULL,
Secretary_id INTEGER NOT NULL,
FOREIGN KEY (GP_id) REFERENCES GP (id),
FOREIGN KEY (Patient_id) REFERENCES Patient (id),
FOREIGN KEY (Secretary_id) REFERENCES Secretary (id));

Create table prescription(
id integer primary key,
Patient_id integer not null,
GP_id integer not null,
Type varchar(256) not null,
Date date not null,
foreign key (patient_id) references patient (id),
foreign key (gp_id) references gp (id));

INSERT INTO GP values (1, 'Dr Dave Charnock', '20 Bradley Road, Leeds', 01135645367, 'd.charnock@mail.com');
INSERT INTO GP values (2, 'Dr Jordan Brennan', '101 Colling Street, Leeds', 01135687876, 'j.brennn@mail.com');
INSERT INTO GP values (3, 'Dr Ru Paul', '3 Main Parade, Leeds', 011359898989898, 'r.paul@mail.com');
INSERT INTO GP values (4, 'Dr Tina Tuner', '176a Lovin Street, Leeds', 011355555568, 't.turner@mail.com');

INSERT INTO Patient values (1, 'Jonah Lomu', '85c Rugby Street, Leeds', 0766868686868, 'j.lomu@mail.com', 'Previously suffered from herendous rugby injuries and now has very sore legs. Smoker=N');
INSERT INTO Patient values (2, 'Peter Pan', '1000 Neverland Lane, Leeds', 077777777777, 'p.pan@mail.com', 'Believes he is being followed by Cpatain Hook. Does not suffer from ageing');
INSERT INTO Patient values (3, 'Prince Phillip', '50 Buckingham Palace, Leeds', 099837638235, 'pp@royalmail.com', 'Very very old');
INSERT INTO Patient values (4, 'Batman', '50 Gotham Road, Leeds', 079899898987, 'imthebat@mail.com', 'Previous traumatic experience losing parents. High level risk taker');

insert into secretary values (1, 'Margarita Pulido', '2 Clement Close, W4 5SS, London', '01234567899', 'margarita.pulido@gmail.com');
insert into secretary values (2, 'Pedro Romero', '4 Finland Avenue, NH7 8LD, Leeds', '01134895007', 'pedro.romero@gmail.com');

INSERT INTO Appointment values (1, '2014-10-10', '11:30', 1, 2, 1);
INSERT INTO Appointment values (2, '2014-11-09', '16:30', 2, 1, 2);
insert into appointment values (3, '2015-01-12', '15:00', 3, 3, 1);
insert into appointment values (4, '2015-02-12', '12:00', 4, 4, 2);
insert into appointment values (5, '2015-02-12', '13:00', 1, 2, 1);
insert into appointment values (6, '2015-01-30', '16:00', 3, 3, 2);
insert into appointment values (7, '2015-02-11', '17:00', 2, 1, 2);
insert into appointment values (8, '2015-01-21', '12:00', 4, 4, 1);
insert into appointment values (9, '2015-03-12', '14:00', 4, 1, 2);
insert into appointment values (10, '2015-03-18', '10:00', 3, 2, 1);
insert into appointment values (11, '2015-03-19', '16:30', 3, 4, 2);
insert into appointment values (12, '2015-03-24', '14:15', 2, 3, 2);
insert into appointment values (13, '2015-02-01', '12:00', 2, 3, 2);

insert into prescription values (1, 2, 1, 'Valium 200mg, 2xper day', '2014-10-10');
insert into prescription values (2, 1, 2, 'Valium 200mg, 2xper day', '2014-11-09');
insert into prescription values (3, 3, 3, 'Valium 200mg, 2xper day', '2015-01-12');
insert into prescription values (4, 3, 3, 'Valium 200mg, 2xper day', '2015-01-30');
insert into prescription values (5, 4, 4, 'Valium 200mg, 2xper day', '2015-01-21');

Select * from patient where patient.name='Prince Phillip';

select * from gp where gp.name='Dr Tina Tuner';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and appointment.date>='2015-01-12';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and gp.name='Dr Ru Paul' and appointment.date='2015-01-12' and appointment.time>='12:00:00';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and gp.name='Dr Ru Paul' and appointment.date='2015-01-12';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and gp.name='Dr Ru Paul';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and patient.name='Prince Phillip' and appointment.date>='2015-01-12';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and appointment.time>='12:00:00';

select appointment.date, appointment.time, patient.name as Patient, gp.name as Doctor from appointment, patient, gp where gp.id=appointment.gp_id and patient.id=patient_id and appointment.time<'12:00:00';

select Patient.name as Patient, GP.name as Doctor, prescription.type as Prescription, prescription.date from patient, gp, prescription where patient.id=prescription.patient_id and gp.id=prescription.gp_id and prescription.type like '%Valium%';

select Patient.name as Patient, GP.name as Doctor, prescription.type as Prescription, prescription.date from patient, gp, prescription where patient.id=prescription.patient_id and gp.id=prescription.gp_id and gp.name='Dr Ru Paul';

select Patient.name as Patient, GP.name as Doctor, prescription.type as Prescription, prescription.date from patient, gp, prescription where patient.id=prescription.patient_id and gp.id=prescription.gp_id and patient.name='Prince Phillip';
