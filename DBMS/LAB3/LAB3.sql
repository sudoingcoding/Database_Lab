SELECT branch_name,branch_city FROM Branch WHERE assets>1000000;

SELECT account_number,balance FROM Account WHERE branch_name='Downtown' OR (balance>=600 AND balance<=750);

SELECT account_number FROM Account NATURAL JOIN Branch WHERE Branch.branch_city='Rye';

SELECT loan_number  FROM Customer NATURAL JOIN Loan WHERE Loan.amount>=1000 AND Customer.customer_city='Harrison';

SELECT * FROM Account ORDER BY balance DESC;

SELECT * FROM Customer ORDER BY customer_city;

SELECT customer_name FROM Depositor INTERSECT SELECT customer_name FROM Borrower;

SELECT Customer_name,Customer_street,Customer_city FROM Customer NATURAL JOIN Depositor 
UNION 
SELECT Customer_name,Customer_street,Customer_city FROM Customer NATURAL JOIN Borrower;

SELECT Customer_name,Customer_city FROM Customer NATURAL JOIN Borrower
MINUS
SELECT Customer_name,Customer_city FROM Customer NATURAL JOIN Depositor;

SELECT SUM(assets) AS Total_Assets FROM Branch;

SELECT branch_name,ROUND(AVG(balance),2) AS Average_balance FROM Branch NATURAL JOIN Account GROUP BY branch_name;

SELECT branch_city,ROUND(AVG(balance),2) AS Average_balance FROM Branch NATURAL JOIN Account GROUP BY branch_city;

SELECT branch_name,MIN(amount) AS Lowest_Loan FROM Branch NATURAL JOIN Loan GROUP BY branch_name;

SELECT branch_name,COUNT(*) AS Loan_Numbers FROM Branch NATURAL JOIN Loan GROUP BY branch_name;

SELECT customer_name,account_number FROM Depositor NATURAL JOIN Account WHERE balance=(SELECT MAX(balance) FROM Account);