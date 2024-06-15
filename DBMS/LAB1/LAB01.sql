DROP TABLE instructor_2022160356;
CREATE TABLE instructor_2022160356(
    id NUMBER,
    name VARCHAR(25),
    dept_name VARCHAR(25),
    salary NUMBER,
    PRIMARY KEY(id)
);
DROP TABLE course_2022160356;
CREATE TABLE course_2022160356(
    course_id VARCHAR(25),
    title VARCHAR(100),
    dept_name VARCHAR(25),
    credits NUMBER,
    PRIMARY KEY(course_id)
);

INSERT INTO instructor_2022160356 VALUES(10101,'Srinivasan','Comp. Sci.',65000);
INSERT INTO instructor_2022160356 VALUES(12121,'Wu','Finance',90000);
INSERT INTO instructor_2022160356 VALUES(15151,'Mozart','Music',40000);
INSERT INTO instructor_2022160356 VALUES(22222,'Einstein','Physics',95000);
INSERT INTO instructor_2022160356 VALUES(32343,'El Said','History',60000);
INSERT INTO instructor_2022160356 VALUES(33456,'Gold','Physics',87000);
INSERT INTO instructor_2022160356 VALUES(45565,'Katz','Comp. Sci.',75000);
INSERT INTO instructor_2022160356 VALUES(58583,'Califieri','History',62000);
INSERT INTO instructor_2022160356 VALUES(76543,'Singh','Finance',80000);
INSERT INTO instructor_2022160356 VALUES(76766,'Crick','Biology',72000);
INSERT INTO instructor_2022160356 VALUES(83821,'Brandt','Comp. Sci.',92000);
INSERT INTO instructor_2022160356 VALUES(98345,'Kim','Elec. Eng.',80000);

SELECT * FROM instructor_2022160356;

INSERT INTO course_2022160356 VALUES('BIO-101','Intro. to Biology','Biology',4);
INSERT INTO course_2022160356 VALUES('BIO-301','Genetics','Biology',4);
INSERT INTO course_2022160356 VALUES('BIO-399','Computational Biology','Biology',3);
INSERT INTO course_2022160356 VALUES('CS-101','Intro. to Computer Science','Comp. Sci.',4);
INSERT INTO course_2022160356 VALUES('CS-190','Game Design','Comp. Sci.',4);
INSERT INTO course_2022160356 VALUES('CS-315','Robotics','Comp. Sci.',3);
INSERT INTO course_2022160356 VALUES('CS-319','Image Processing','Comp. Sci.',3);
INSERT INTO course_2022160356 VALUES('CS-347','Database System Concepts','Comp. Sci.',3);
INSERT INTO course_2022160356 VALUES('EE-181','Intro. to Digital Systems','Elec. Eng.',3);
INSERT INTO course_2022160356 VALUES('FIN-201','Investment Banking','Finance',3);
INSERT INTO course_2022160356 VALUES('HIS-351','World History','History',3);
INSERT INTO course_2022160356 VALUES('MU-199','Music Video Production','Music',3);
INSERT INTO course_2022160356 VALUES('PHY-101','Physical Principles','Physics',4);

SELECT * FROM course_2022160356;

SELECT name FROM instructor_2022160356;

SELECT course_id,title FROM course_2022160356;

SELECT name,dept_name FROM instructor_2022160356 WHERE id=22222;

SELECT title,credits FROM course_2022160356 WHERE dept_name='Comp. Sci.';

SELECT name,dept_name FROM instructor_2022160356 WHERE salary>70000;

SELECT title FROM course_2022160356 WHERE credits>=4;

SELECT name,dept_name FROM instructor_2022160356 WHERE salary>=80000 AND salary<=100000;

SELECT title,credits FROM course_2022160356 WHERE NOT dept_name='Comp. Sci.';

SELECT * FROM instructor_2022160356;

SELECT * FROM course_2022160356 WHERE dept_name='Biology' AND NOT credits=4;