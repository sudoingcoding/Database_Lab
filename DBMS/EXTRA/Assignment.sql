--Task 1
--Create table for PATIENTS_2022_1_60_356
CREATE TABLE PATIENTS_2022_1_60_356(
    patientid VARCHAR2(20),
    name VARCHAR2(20),
    gender VARCHAR2(10),
    age NUMBER,
    contactnumber VARCHAR2(14),
    PRIMARY KEY(patientid)
);

--Create table for DOCTORS_2022_1_60_356
CREATE TABLE DOCTORS_2022_1_60_356(
    doctorid VARCHAR2(20),
    name VARCHAR2(20),
    specialization VARCHAR2(20),
    contactnumber VARCHAR2(14),
    yearsexperience NUMBER,
    PRIMARY KEY(doctorid)
);

--Create table for APPOINTMENTS_2022_1_60_356
CREATE TABLE APPOINTMENTS_2022_1_60_356(
    appointmentid VARCHAR2(20),
    appointmentdate VARCHAR2(20),
    patientid VARCHAR2(20),
    doctorid VARCHAR2(20),
    appointmentstatus VARCHAR2(20),
    PRIMARY KEY(appointmentid),
    FOREIGN KEY (patientid) REFERENCES PATIENTS_2022_1_60_356,
    FOREIGN KEY (doctorid) REFERENCES DOCTORS_2022_1_60_356
);

--Create table for BILLING_2022_1_60_356
CREATE TABLE BILLING_2022_1_60_356(
    billid VARCHAR2(20),
    appointmentid VARCHAR2(20),
    billamount NUMBER,
    billstatus VARCHAR2(20),
    PRIMARY KEY(billid),
    FOREIGN KEY (appointmentid) REFERENCES APPOINTMENTS_2022_1_60_356
);

--TASK 2
--Insert tuples for PATIENTS_2022_1_60_356
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-101','Suddip','Male',22,'01670923858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-102','Rahin','Male',23,'01644923858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-103','Reza','Male',23,'01744923858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-104','Maliha','Female',23,'01714923858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-105','Anik','Male',23,'01644944858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-106','Ankon','Male',23,'01711944858');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-107','Ifti','Male',23,'01711944999');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-108','Chinmoy','Male',23,'01711966699');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-109','Sammo','Female',23,'01714924444');
INSERT INTO PATIENTS_2022_1_60_356 VALUES('P-110','Suchi','Female',23,'01714955444');

--Insert tuples for DOCTORS_2022_1_60_356
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-101','Samiul','Pediatrics','01714933444',4);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-102','Inzamam','Cardiology','01654933444',3);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-103','Wasif','Neurology','01715633444',4);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-104','Zarif','Surgery','01714933333',5);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-105','Mahadi','Dermatology','01714931234',7);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-106','Biojid','Urology','01714934564',4);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-107','Peya','Surgery','01714933789',2);
INSERT INTO DOCTORS_2022_1_60_356 VALUES('D-108','Nazia','Pediatrics','01714933167',1);

--Insert tuples for APPOINTMENTS_2022_1_60_356
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-101','24-Mar-2024','P-102','D-101','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-102','25-Mar-2024','P-103','D-102','Pending');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-103','26-Mar-2024','P-101','D-102','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-104','24-Mar-2024','P-104','D-108','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-105','23-Mar-2024','P-107','D-103','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-106','26-Mar-2024','P-109','D-107','Pending');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-107','25-Mar-2024','P-106','D-105','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-108','23-Mar-2024','P-102','D-101','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-109','25-Mar-2024','P-104','D-108','Confirmed');
INSERT INTO APPOINTMENTS_2022_1_60_356 VALUES('A-110','29-Mar-2024','P-102','D-101','Pending');

--Insert tuples for BILLING_2022_1_60_356
INSERT INTO BILLING_2022_1_60_356 VALUES('B-101','A-101',500,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-102','A-103',5000,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-103','A-104',2500,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-104','A-105',3000,'paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-105','A-107',2500,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-106','A-108',2500,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-107','A-109',2500,'Paid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-108','A-101',2000000,'Unpaid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-109','A-102',3000000,'Unpaid');
INSERT INTO BILLING_2022_1_60_356 VALUES('B-110','A-103',5000000,'Paid');

--TASK 3
--Find the name and contact number of the doctor who has the most experience.
SELECT Name,ContactNumber 
FROM DOCTORS_2022_1_60_356 
WHERE YearsExperience=(
    SELECT MAX(YearsExperience) FROM DOCTORS_2022_1_60_356
    );

--Find the number of appointments for each doctor on ‘24-Mar-2024’.
SELECT Name,COUNT(AppointmentID) AS TotalAppointments
FROM DOCTORS_2022_1_60_356 NATURAL JOIN
APPOINTMENTS_2022_1_60_356
WHERE AppointmentDate='24-Mar-2024'
GROUP BY Name;

--Prepare a list of patients who have appointments with ‘Pediatrics’ specialized doctors on ‘24-Mar-2024’. Show the patient's name and contact Number. Sort the list alphabetically by the patient's name.
SELECT P.Name,P.ContactNumber 
FROM PATIENTS_2022_1_60_356 P
JOIN APPOINTMENTS_2022_1_60_356 A ON P.PatientID=A.PatientID
JOIN DOCTORS_2022_1_60_356 D ON D.DoctorID=A.DoctorID
WHERE D.Specialization ='Pediatrics' AND A.AppointmentDate='24-Mar-2024'
ORDER BY P.Name;

--Find unique doctors who have ‘Confirmed’ appointments (AppoitnmentStatus = ‘Confirmed’) between ‘24-Mar-2024’ and ‘26-Mar-2024’. Show the doctor's name and contact number.
SELECT DISTINCT D.Name,D.ContactNumber 
FROM DOCTORS_2022_1_60_356 D 
NATURAL JOIN APPOINTMENTS_2022_1_60_356
WHERE AppointmentStatus='Confirmed'
AND AppointmentDate BETWEEN '24-Mar-2024' AND '26-Mar-2024';

--Find patients who have not booked any appointments yet. Show patient ID and patient name.
SELECT PatientID,Name 
FROM PATIENTS_2022_1_60_356 P
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID 
    FROM APPOINTMENTS_2022_1_60_356);

-- Retrieve the last five records of Billing relation.
SELECT * FROM (
    SELECT * 
    FROM BILLING_2022_1_60_356 
    ORDER BY BillID DESC)
WHERE ROWNUM<=5;

--Find the average age of both male and female patients.
SELECT Gender,ROUND(AVG(Age),2) AS AVG_AGE
FROM PATIENTS_2022_1_60_356
GROUP BY Gender;

--Find patients who have multiple appointments. Show the patient's name and contact number.
SELECT Name,ContactNumber
FROM PATIENTS_2022_1_60_356 P JOIN (
    SELECT PatientID 
    FROM APPOINTMENTS_2022_1_60_356 
    GROUP BY PatientID
    HAVING COUNT(AppointmentID)>1) A 
ON P.PatientID=A.PatientID;

--Generate a list of patients and the number of appointments made by each of them. Include patients with zero appointments too. The result must have three columns: patient ID, patient name, and number of appointments made.
SELECT P.PatientID, P.Name, COUNT(A.AppointmentID) AS NumAppointments
FROM PATIENTS_2022_1_60_356 P
LEFT JOIN Appointments_2022_1_60_356 A ON P.PatientID = A.PatientID
GROUP BY P.PatientID, P.Name;

--Update the bill amount in the billing relation according to the following conditions.                              
--i.If the bill amount is less than 500, the hospital gives a 15% discount.
--ii.If the bill amount is more than or equal to 500 and less than 2000, the hospital gives a 10% discount.
--iii.If the bill amount is more than or equal to 2000, the hospital gives a 5% discount.
UPDATE BILLING_2022_1_60_356
SET BillAmount=
CASE 
WHEN BillAmount<500 THEN BillAmount*0.85
WHEN BillAmount>=500 AND BillAmount<2000 THEN BillAmount*0.90
WHEN BillAmount>=2000 THEN BillAmount*0.95
END;

-- Add a new attribute EmailAddress to the Doctors relation. The EmailAddress must be set to NOT NULL. Use appropriate data type.
ALTER TABLE DOCTORS_2022_1_60_356
ADD EmailAddress VARCHAR2(50) NOT NULL;

--Create a view named PediatricsAppointment that shows the patient name, doctor name, appointment date, and appointment status of appointments made with specialized ‘Pediatrics’ doctors. 
CREATE VIEW PediatricsAppointment AS
SELECT P.Name AS PatientName, D.Name AS DoctorName, A.AppointmentDate, A.AppointmentStatus
FROM PATIENTS_2022_1_60_356 P
JOIN APPOINTMENTS_2022_1_60_356 A ON P.PatientID = A.PatientID
JOIN DOCTORS_2022_1_60_356 D ON D.DoctorID = A.DoctorID
WHERE D.Specialization = 'Pediatrics';