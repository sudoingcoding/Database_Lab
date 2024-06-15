DROP TABLE account2022160356;

CREATE TABLE account2022160356(
    account_no CHAR(5),
    balance NUMBER NOT NULL CHECK(balance>=0),
    PRIMARY KEY(account_no)
);

DESCRIBE account2022160356;

DROP TABLE customer2022160356;

CREATE TABLE customer2022160356(
    customer_no CHAR(5),
    customer_name VARCHAR2(20) NOT NULL,
    customer_city VARCHAR2(10),
    PRIMARY KEY(customer_no)
);

DESCRIBE customer2022160356;
DROP TABLE depositor2022160356;
CREATE TABLE depositor2022160356(
    account_no CHAR(5),
    customer_no CHAR(5),
    PRIMARY KEY(account_no,customer_no)
);

DESCRIBE depositor2022160356;

ALTER TABLE customer2022160356 ADD date_of_birth DATE;

ALTER TABLE customer2022160356 DROP COLUMN date_of_birth;

ALTER TABLE depositor2022160356 RENAME COLUMN account_no TO a_no;
ALTER TABLE depositor2022160356 RENAME COLUMN customer_no TO c_no;

ALTER TABLE depositor2022160356 ADD CONSTRAINT depositor_fk1 FOREIGN KEY(a_no) REFERENCES account2022160356;
ALTER TABLE depositor2022160356 ADD CONSTRAINT depositor_fk2 FOREIGN KEY(c_no) REFERENCES customer2022160356;

INSERT INTO account2022160356 VALUES('A-101',12000);
INSERT INTO account2022160356 VALUES('A-102',6000);
INSERT INTO account2022160356 VALUES('A-103',2500);

SELECT * FROM account2022160356;

INSERT INTO customer2022160356 VALUES('C-101','Alice','Dhaka');
INSERT INTO customer2022160356 VALUES('C-102','Annie','Dhaka');
INSERT INTO customer2022160356 VALUES('C-103','Bob','Chittagong');
INSERT INTO customer2022160356 VALUES('C-104','Charile','Khulna');

SELECT * FROM customer2022160356;

INSERT INTO depositor2022160356 VALUES('A-101','C-101');
INSERT INTO depositor2022160356 VALUES('A-103','C-102');
INSERT INTO depositor2022160356 VALUES('A-103','C-104');
INSERT INTO depositor2022160356 VALUES('A-102','C-103');

SELECT * FROM depositor2022160356;

SELECT customer_name,customer_city FROM customer2022160356;

SELECT DISTINCT customer_city FROM customer2022160356;

SELECT account_no FROM account2022160356 WHERE balance>7000;

SELECT customer_no,customer_name FROM customer2022160356 WHERE customer_city='Khulna';

SELECT customer_no,customer_name FROM customer2022160356 WHERE NOT customer_city='Dhaka';

SELECT customer2022160356.customer_no,customer2022160356.customer_name 
FROM customer2022160356,account2022160356,depositor2022160356
WHERE  customer2022160356.customer_no=depositor2022160356.c_no AND
depositor2022160356.a_no=account2022160356.account_no AND
account2022160356.balance>7000;

SELECT customer2022160356.customer_no,customer2022160356.customer_name 
FROM customer2022160356,account2022160356,depositor2022160356
WHERE  customer2022160356.customer_no=depositor2022160356.c_no AND
depositor2022160356.a_no=account2022160356.account_no AND
account2022160356.balance>7000 AND 
NOT customer2022160356.customer_city='Khulna';

SELECT account2022160356.account_no,account2022160356.balance 
FROM customer2022160356,account2022160356,depositor2022160356
WHERE  customer2022160356.customer_no=depositor2022160356.c_no AND
depositor2022160356.a_no=account2022160356.account_no AND 
customer2022160356.customer_no='C-102';

SELECT account2022160356.account_no,account2022160356.balance 
FROM customer2022160356,account2022160356,depositor2022160356
WHERE  customer2022160356.customer_no=depositor2022160356.c_no AND
depositor2022160356.a_no=account2022160356.account_no AND 
customer2022160356.customer_city IN('Dhaka','Khulna');

SELECT customer2022160356.* 
FROM customer2022160356,account2022160356,depositor2022160356
WHERE  customer2022160356.customer_no=depositor2022160356.c_no AND
depositor2022160356.a_no=account2022160356.account_no AND 
customer2022160356.customer_no IS NULL;