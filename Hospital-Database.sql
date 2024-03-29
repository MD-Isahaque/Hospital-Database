create database hospital_management;
use hospital_management;
# hospital table
create table hospital(hosp_name varchar(30) primary key, country varchar(30), address varchar(50));
# medicine table
create table medicine(reg_no int primary key, Med_name varchar(30) not null, price numeric(4, 3), exp_name date);
# doctor table
create table doctor(doc_id int primary key, dname varchar(20), gender varchar(20), qualification varchar(50),
job_specification varchar(30), hosp_name varchar(30), foreign key(hosp_name) references hospital(hosp_name));
# nurse table
create table nurse(nurse_id int primary key, name varchar(30), gender varchar(5), doc_id int, hosp_name varchar(30),
foreign key(doc_id) references doctor(doc_id),
foreign key(hosp_name) references hospital(hosp_name));
# patient table
create table patient(ssn int primary key, fname varchar(30), lname varchar(40), age int, gender varchar(5), nurse_id int, rec_id int,
foreign key(nurse_id) references nurse(nurse_id),
foreign key(rec_id) references reception(rec_id));
# reception table
create table reception(rec_id int primary key, tel_no varchar(20), email varchar(30), hosp_name varchar(30),
foreign key(hosp_name) references hospital(hosp_name));
# appointment table
create table appointment(appoint_no int primary key, appoint_date date, appoint_time time, rec_id int,
foreign key(rec_id) references reception(rec_id));
# diagnosis Table
create table diagnosis(diagnos_id int primary key, issue_date date, treatment varchar(50), remarks varchar(20), nurse_id int,doc_id int,
foreign key(nurse_id) references nurse(nurse_id),
foreign key(doc_id) references doctor(doc_id));
#visit table
create table visit(visit_date date, ssn int, hosp_name varchar(30),
foreign key(ssn) references patient(ssn),
foreign key(hosp_name) references hospital(hosp_name));
# purchase table
CREATE TABLE PURCHASE
(
    SSN int,
    REG_NO int,
    FOREIGN KEY(SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY(REG_NO) REFERENCES MEDICINE (REG_NO)
);
# examine table
CREATE TABLE EXAMINE
(
    SSN int,
    DOC_ID int,
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID)
);
# medicine country table
CREATE TABLE MEDICINE_COUNTRY
(
    REG_NO int,
    MAN_COUNTRY VARCHAR(20),
    PRIMARY KEY (REG_NO, MAN_COUNTRY)
);
# hospital values
INSERT INTO HOSPITAL VALUES
("King Hamad University Hospital", "Kingdom of Bahrain", "Sheikh Isa bin Salman Bridge, Al Sayh, Busaiteen, Bahrain"),
("Mayo Clinic", "United States", "4500 San Pablo Road, US"),
("Bahrain Defence Force Hospital", "Kingdom of Bahrain", "Waly Alahed Avenue, West Riffa, Bahrain"),
("Salamaniya Hospital", "Kindgom of Bahrain", "Salmaniya Medical Complex, Manama, Bahrain"),
("St Thomas' Hospital London", "United Kingdom", "Westminster Bridge Rd, London"),
("King Faisal Specialist Hospital & Research Centre", "Kingdom of Saudi Arabia", "Al Mathar Ash Shamali, Riyadh 11564, Saudi Arabia"),
("Al-Hilal Hospital", "Kingdom of Bahrain", "Al-Hilal Hospital, Muharraq, Bahrain"),
("Emirates Hospital", "United Arab Emirates", "Jumeirah Beach Rd, Dubai, UAE"),
("American Mission Hospital","Kingdom of Bahrain", "Sheikh Essa Road, Manama, Bahrain"),
("Dar Al Shifa Hospital", "Kuwait", "Beirut Street, Hawally, Kuwait");
select * from hospital;
# insert medicine values
INSERT INTO MEDICINE VALUES
(020, "Adol Syrup", 0.300, '2023-10-11'),
(021, "Amoxil Capsules", 0.700, '2023-10-11'),
(022, "Aspirin", 1.000, '2023-10-11'),
(023, "Bonjela Gel", 0.400, '2023-10-11'),
(024, "Paracetamol", 1.200, '2023-10-11'),
(025, "Atorvastatin", 1.500, '2023-10-11'),
(026, "Coversyl", 1.000, '2023-10-11'),
(027, "Diamicron", 0.900, '2023-10-11'),
(028, "Lipitor", 1.400, '2023-10-11'),
(029, "Glucophage", 1.700, '2023-10-11');
select * from medicine;
# patient values
INSERT INTO PATIENT VALUES
(100000001, "Sara", "Majeed", 27, 'F', 07, 046),
(100000002, "Ahmed", "Jamaal", 59, 'M', 03, 043),
(100000003, "Abdulla", "Hameed", 45, 'M', 09, 048),
(100000004, "Mariam", "Muhammad", 40, 'F', 01, 041),
(100000005, "Fatema", "Hasan", 64, 'F', 06, 047),
(100000006, "Zainab", "Abdulla", 55, 'F', 02, 049),
(100000007, "Khalil", "Ibrahim", 35, 'M', 08, 044),
(100000008, "Alyaa", "Husain", 57, 'F', 05, 042),
(100000009, "Khalid", "Ahmed", 60, 'M', 04, 050),
(100000010, "Jawad", "Ali", 20, 'M', 10, 045);

INSERT INTO DOCTOR VALUES 
(1, "Abdullah", 'M', "MBBS", "Dermatologist", "Bahrain Defence Force Hospital"),
(2, "Ahmed", 'M', "Board Certified", "Opthalmologist", "King Hamad University Hospital"),
(3, "Ameera", 'F', "MD", "Pediatrician", "Salmaniya Hospital"),
(4, "Ali", 'M', "BPT", "Physiotherapist", "Al-Hilal Hospital"),
(5, "Carolina", 'F', "MS", "Surgeon", "Mayo Clinic"),
(6, "Sarah", 'F', "MD", "Anatomy", "Emirates Hospital"),
(7, "Qasim", 'M', "MD", "Radiologist", "King Hamad University Hospital"),
(8, "Fatema", 'F', "Residency", "Anesthologist", "Salmaniya Hospital"),
(9, "Khalid", 'M', "MBBS", "Psychiatrist", "American Misson Hospital"),
(10, "Amal", 'F', "D.M.", "Nephrologist", "King Hamad University Hospital");

INSERT INTO NURSE VALUES
(01, "Sanaa", 'F', 2, "King Hamad University Hospital"),
(02, "Kathy", 'F', 7, "King Hamad University Hospital"),
(03, "Mary", 'F', 5, "Mayo Clinic"),
(04, "Ibrahim",'M', 8, "Salmaniya Hospital"),
(05, "Anaya",'F', 3, "Salamaniya Hospital"),
(06, "Asha",'F', 9, "American Mission Hospital"),
(07, "Zainab",'F', 1, "Bahrain Defence Force Hospital"),
(08, "Zeshan", 'M', 10, "King Hamad University Hospital"),
(09, "Adam", 'M', 4, "Al-Hilal Hospital"),
(10, "Hawra", 'F', 6, "Emirtes Hospital");

INSERT INTO RECEPTION VALUES
(041, 39123456, "khuh@gmail.com", "King Hamad University Hospital"),
(042, 39123456, "khuh@gmail.com", "King Hamad University Hospital"),
(043, 39456780, "mayoclinic@facebook.com", "Mayo Clinic"),
(044, 33456780, "emirateshospital@yahoo.com", "Emirates Hospital"),
(045, 33123456, "bdf@yahoo.com", "Bahrain Defence Force Hospital"),
(046, 33678901, "alhilal@facebook.com", "Al-Hilal Hospital"),
(047, 39678901, "daralshifa@gmail.com", "Dar Al Shifa Hospital"),
(048, 33912045, "st.thomashospital@gmail.com", "St Thomas Hospital London"),
(049, 39912045, "kingfaisalshrc@yahoo.com", "King Faisal Specialist Hospital & Research Centre"),
(050, 39678901, "daralshifa@gmail.com", "Dar Al Shifa Hospital");

INSERT INTO APPOINTMENT VALUES
(0001, '3/5/2022', '07:05:03', 045),
(0002, '17/3/2022', '13:30:00', 049),
(0003, '22/12/2022', '09:45:00', 044),
(0004, '9/7/2022', '17:20:00', 048),
(0005, '3/5/2022', '12:15:00', 041),
(0006, '20/11/2022', '08:05:00', 047),
(0007, '12/7/2022', '15:40:00', 042),
(0008, '1/4/2022', '14:00:00', 050),
(0009, '30/8/2022', '10:25:00', 043),
(0010, '15/6/2022', '16:50:00', 046);

INSERT INTO VISIT VALUES
('10/10/2021', 100000009, "Dar Al Shifa Hospital"),
('15/05/2020', 100000005, "Dar Al Shifa Hospital"),
('30/01/2022', 100000006, "King Faisal Specialist Hospital & Research Centre"),
('04/06/2019', 100000002, "Mayo Clinic"),
('24/12/2020', 100000010, "Bahrain Defence Force Hospital"),
('11/11/2020', 100000004, "King Hamad University Hospital"),
('06/02/2021', 100000001, "Al-Hilal Hospital"),
('21/04/2022', 100000003, "St'Thomas Hospital London"),
('19/04/2022', 100000007, "Emirates Hospital"),
('07/02/2021', 100000008, "King Hamad University Hospital");

INSERT INTO DIAGNOSIS VALUES
(31, '4/6/2022', "Physiotherapy", "Once a month", 04, 8),
(32, '29/5/2022', "Aromatherapy", "Twice a week", 07, 1),
(33, '18/6/2022', "Cyrotherapy", "Twice a month", 05, 3),
(34, '7/7/2022', "Phototherapy", "Once a month", 10, 6),
(35, '13/8/2022', "Radiotherapy", "Once in 3 months", 02, 7),
(36, '3/12/2022', "Immunotherapy", "Once a month", 06, 9),
(37, '4/7/2022', "Monotherapy", "Once a month", 01, 2),
(38, '4/6/2022', "Pharmacotherapy", "Once a month", 08, 10),
(39, '19/7/2022', "Oxygen therapy", "Once a week", 03, 5),
(40, '25/6/2022', "Gene therapy", "Once a month", 09, 4);

INSERT INTO PURCHASE VALUES
(020, 100000007),
(023, null),
(028, 100000004),
(025, 100000009),
(021, 100000003),
(029, 100000006),
(022, 100000008),
(027, 100000002),
(024, 100000007),
(026, null);

INSERT INTO EXAMINE VALUES
(01, 100000004),
(02, 100000006),
(03, 100000002),
(04, 100000009),
(05, 100000008),
(06, 100000005),
(07, 100000001),
(08, 100000007),
(09, 100000003),
(10, 100000010);

INSERT INTO MEDICINE_COUNTRY VALUES
("United States", 020),
("Australia", 021),
("United States", 022),
("Germany", 023),
("United Kingdom", 024),
("United Kingdom", 025),
("Kingdom of Saudi Arabia", 026),
("Germany", 027),
("Switzerland", 028),
("Germany", 029);

-- Queries
SELECT DOC_ID, DNAME, HOSP_NAME
FROM DOCTOR;

SELECT * 
FROM DIAGNOSIS
ORDER BY DIAGNOS_NO DESC; 

SELECT *
FROM HOSPITAL
WHERE COUNTRY LIKE 'Kingdom of Bahrain';