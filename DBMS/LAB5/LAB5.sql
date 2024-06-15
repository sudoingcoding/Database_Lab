--1 Without Using Subqueries
SELECT C.CUSTOMER_NAME, C.CUSTOMER_STREET, C.CUSTOMER_CITY, D.ACCOUNT_NUMBER
FROM Customer C
JOIN Depositor D ON C.CUSTOMER_NAME = D.CUSTOMER_NAME
JOIN Account A ON A.ACCOUNT_NUMBER = D.ACCOUNT_NUMBER
JOIN Branch B ON A.BRANCH_NAME = B.BRANCH_NAME
WHERE B.Branch_city = C.Customer_city;

--1 Using Subqueries
SELECT CUSTOMER_NAME, CUSTOMER_STREET, CUSTOMER_CITY, ACCOUNT_NUMBER
FROM (
    SELECT C.CUSTOMER_NAME, C.CUSTOMER_STREET, C.CUSTOMER_CITY, D.ACCOUNT_NUMBER, B.BRANCH_CITY
    FROM Customer C
    JOIN Depositor D ON C.CUSTOMER_NAME = D.CUSTOMER_NAME
    JOIN Account A ON D.ACCOUNT_NUMBER = A.ACCOUNT_NUMBER
    JOIN Branch B ON A.BRANCH_NAME = B.BRANCH_NAME
)
WHERE CUSTOMER_CITY = BRANCH_CITY;

--2 Without Using Subqueries
SELECT C.CUSTOMER_NAME, C.CUSTOMER_STREET, C.CUSTOMER_CITY, Bo.LOAN_NUMBER
FROM Customer C
JOIN Borrower Bo ON C.CUSTOMER_NAME = Bo.CUSTOMER_NAME
JOIN Loan L ON Bo.LOAN_NUMBER = L.LOAN_NUMBER
JOIN Branch B ON L.BRANCH_NAME = B.BRANCH_NAME
WHERE B.Branch_city = C.Customer_city;

--2 Using Subqueries
SELECT CUSTOMER_NAME, CUSTOMER_STREET, CUSTOMER_CITY, LOAN_NUMBER
FROM (
    SELECT C.CUSTOMER_NAME, C.CUSTOMER_STREET, C.CUSTOMER_CITY, Bo.LOAN_NUMBER, B.BRANCH_CITY
    FROM Customer C
    JOIN Borrower Bo ON C.CUSTOMER_NAME = Bo.CUSTOMER_NAME
    JOIN Loan L ON Bo.LOAN_NUMBER = L.LOAN_NUMBER
    JOIN Branch B ON L.BRANCH_NAME = B.BRANCH_NAME
) 
WHERE CUSTOMER_CITY = BRANCH_CITY;

--3 with having clause
SELECT B.branch_city, AVG(A.balance) AS AVG_BALANCE 
FROM Branch B JOIN Account A ON B.branch_name=A.branch_name 
GROUP BY B.branch_city HAVING SUM(A.balance)>=1000;

--3 without having clause
WITH temp1(branch_city,AVG_BALANCE,SUM_BALANCE) AS(
    SELECT B.branch_city, AVG(A.balance) AS AVG_BALANCE,SUM(A.balance) AS SUM_BALANCE
    FROM Branch B JOIN Account A ON B.branch_name=A.branch_name
    GROUP BY B.branch_city 
)
SELECT branch_city,AVG_BALANCE FROM temp1 WHERE SUM_BALANCE>=1000;

--4 with having clause
SELECT B.branch_city, AVG(L.amount) AS AVG_BALANCE 
FROM Branch B JOIN Loan L ON B.branch_name=L.branch_name 
GROUP BY B.branch_city HAVING SUM(L.amount)>=1500;

--4 without having clause
WITH temp1(branch_city,AVG_AMOUNT,SUM_AMOUNT) AS(
    SELECT B.branch_city, AVG(L.amount) AS AVG_AMOUNT,SUM(L.amount) AS SUM_AMOUNT
    FROM Branch B JOIN Loan L ON B.branch_name=L.branch_name
    GROUP BY B.branch_city 
)
SELECT branch_city,AVG_AMOUNT FROM temp1 WHERE SUM_AMOUNT>=1000;

--5 With all keyword
SELECT C.customer_name,C.customer_street,C.customer_city 
FROM Customer C
JOIN Depositor D ON C.CUSTOMER_NAME = D.CUSTOMER_NAME
JOIN Account A ON D.ACCOUNT_NUMBER = A.ACCOUNT_NUMBER
WHERE A.balance>=ALL(SELECT balance FROM Account);

--5 Without all keyword
SELECT C.customer_name,C.customer_street,C.customer_city 
FROM Customer C
JOIN Depositor D ON C.CUSTOMER_NAME = D.CUSTOMER_NAME
JOIN Account A ON D.ACCOUNT_NUMBER = A.ACCOUNT_NUMBER
WHERE A.balance=(SELECT MAX(balance) FROM Account);

--6 With all keyword
SELECT C.customer_name,C.customer_street,C.customer_city 
FROM Customer C
JOIN Borrower Bo ON C.CUSTOMER_NAME = Bo.CUSTOMER_NAME
JOIN Loan L ON Bo.LOAN_NUMBER = L.LOAN_NUMBER
WHERE L.amount<=ALL(SELECT amount FROM Loan);

--6 Without all keyword
SELECT C.customer_name,C.customer_street,C.customer_city 
FROM Customer C
JOIN Borrower Bo ON C.CUSTOMER_NAME = Bo.CUSTOMER_NAME
JOIN Loan L ON Bo.LOAN_NUMBER = L.LOAN_NUMBER
WHERE L.amount=(SELECT MIN(amount) FROM Loan);

--7 using in keyword
SELECT DISTINCT branch_name,branch_city 
FROM Branch
WHERE branch_name IN(
    SELECT branch_name FROM Account 
    UNION 
    SELECT branch_name FROM Account
);

--7 using exists keyword
SELECT DISTINCT branch_name,branch_city 
FROM Branch
WHERE EXISTS(
    SELECT branch_name
    FROM Account
) AND
EXISTS(
    SELECT branch_name
    FROM Loan
);

--8 with not in keywords
SELECT DISTINCT customer_name,customer_city 
FROM Customer NATURAL JOIN Depositor
WHERE customer_name NOT IN(
    SELECT customer_name FROM Borrower
);

--8 with not exists keyword
SELECT DISTINCT customer_name,customer_city 
FROM Customer C
WHERE NOT EXISTS(
    SELECT *
    FROM Borrower B
    WHERE B.customer_name=C.customer_name
)
AND
EXISTS(
    SELECT *
    FROM Depositor D
    WHERE D.customer_name=C.customer_name
);

--9 with using with clause
WITH temp1 AS (
    SELECT B.branch_name, SUM(A.balance) AS total_balance
    FROM Branch B
    JOIN Account A ON B.branch_name = A.branch_name
    GROUP BY B.branch_name
)
SELECT branch_name
FROM temp1
WHERE total_balance > (
    SELECT AVG(total_balance)
    FROM temp1
);

--9 without using with clause
SELECT branch_name
FROM (
    SELECT branch_name, SUM(balance) AS total_balance
    FROM Account
    GROUP BY branch_name
)
WHERE total_balance > (
    SELECT AVG(total_balance)
    FROM (
        SELECT branch_name, SUM(balance) AS total_balance
        FROM Account
        GROUP BY branch_name
    )
);

--10 with using with clause
WITH temp1 AS (
    SELECT B.branch_name, SUM(L.amount) AS total_amount
    FROM Branch B
    JOIN Loan L ON B.branch_name = L.branch_name
    GROUP BY B.branch_name
)
SELECT branch_name
FROM temp1
WHERE total_amount < (
    SELECT AVG(total_amount)
    FROM temp1
);

--10 without using with clause
SELECT branch_name
FROM (
    SELECT branch_name, SUM(amount) AS total_amount
    FROM Loan
    GROUP BY branch_name
)
WHERE total_amount < (
    SELECT AVG(total_amount)
    FROM (
        SELECT branch_name, SUM(amount) AS total_amount
        FROM Loan
        GROUP BY branch_name
    )
);