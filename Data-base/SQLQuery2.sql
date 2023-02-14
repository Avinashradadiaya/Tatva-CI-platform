SELECT * from orders
SELECT * from salesman
SELECT * from customer

/* assignment --2 ( Q-1 ) */

SELECT salesman.name AS "Salesman",customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city
order by city

/* assignment --2 ( Q-2 ) */ 

SELECT  a.ord_no,a.purch_amt,b.cust_name,b.city 
FROM orders a,customer b 
WHERE a.customer_id=b.customer_id AND a.purch_amt BETWEEN 500 AND 2000;

/* assignment --2 ( Q-3 ) */

SELECT a.cust_name,a.city,b.salesman_id,b.commission
FROM customer a,salesman b
WHERE a.salesman_id=b.salesman_id
ORDER BY a.salesman_id

/* assignment --2 ( Q-4 ) */

SELECT a.cust_name,a.city,b.salesman_id,b.commission
FROM customer a,salesman b
WHERE a.salesman_id=b.salesman_id AND b.commission > 0.12
ORDER BY a.salesman_id

/* assignment --2 ( Q-5 ) */

SELECT a.cust_name, a.city, b.name, b.city,b.commission  
FROM customer a , salesman b  
WHERE a.salesman_id=b.salesman_id AND b.commission>.12 AND a.city<>b.city;

/* assignment --2 ( Q-6 ) */

SELECT	a.ord_no,a.ord_date,a.purch_amt,b.Cust_name,b.grade,c.name,c.commission
FROM orders a
INNER JOIN customer b
ON a.customer_id=b.customer_id
INNER JOIN salesman c
ON a.salesman_id=c.salesman_id

/* assignment --2 ( Q-7 ) */

SELECT a.salesman_id,a.name,a.city,a.commission,b.customer_id,b.cust_name,
b.grade,c.ord_no,c.ord_date,c.purch_amt
FROM salesman a
INNER JOIN customer b
ON a.salesman_id=b.salesman_id
INNER JOIN orders c
ON b.customer_id=c.customer_id

/* assignment --2 ( Q-8 ) */

SELECT a.cust_name,a.city,a.grade, b.name ,b.city
FROM customer a,salesman b
WHERE a.salesman_id=b.salesman_id 
order by a.customer_id

/* assignment --2 ( Q-9 ) */

SELECT a.cust_name,a.city,a.grade, b.name , b.city 
FROM customer a,salesman b  
WHERE a.salesman_id=b.salesman_id AND a.grade<300 
ORDER BY a.customer_id;

/* assignment --2 ( Q-10 ) */

SELECT a.cust_name,a.city, b.ord_no,b.ord_date,b.purch_amt
FROM customer a,orders b
WHERE a.customer_id=b.customer_id 
order by b.ord_date;

/* assignment --2 ( Q-11 ) */

SELECT a.cust_name,a.city, b.ord_no,b.ord_date,b.purch_amt,c.name,c.commission 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id=b.salesman_id;

/* assignment --2 ( Q-12 ) */

SELECT a.cust_name,a.city,a.grade, b.name, b.city 
FROM customer a,salesman b  
WHERE b.salesman_id=a.salesman_id 
ORDER BY b.salesman_id;

/* assignment --2 ( Q-13 ) */

SELECT a.cust_name,a.city,a.grade, b.name, c.ord_no, c.ord_date, c.purch_amt 
FROM customer a ,salesman b ,orders c 
WHERE b.salesman_id=a.salesman_id AND c.customer_id=a.customer_id

/* assignment --2 ( Q-14 ) */

SELECT a.cust_name,a.city,a.grade, b.name, c.ord_no, c.ord_date, c.purch_amt 
FROM customer a ,salesman b ,orders c 
WHERE  b.salesman_id=a.salesman_id AND c.customer_id=a.customer_id AND
c.purch_amt>=2000 AND a.grade IS NOT NULL

/* assignment --2 ( Q-15 ) */

SELECT a.cust_name,a.city,a.grade, b.name, c.ord_no, c.ord_date, c.purch_amt 
FROM customer a ,salesman b ,orders c 
WHERE  b.salesman_id=a.salesman_id AND c.customer_id=a.customer_id AND
c.purch_amt>=2000 AND a.grade IS NOT NULL

/* assignment --2 ( Q-16) */

SELECT a.cust_name,a.city, b.ord_no,b.ord_date,b.purch_amt
FROM customer a ,orders b 
WHERE a.customer_id=b.customer_id AND a.grade IS NOT NULL

/* assignment --2 ( Q-17) */
SELECT * FROM salesman a 
CROSS JOIN customer b;

/* assignment --2 ( Q-18) */

SELECT * FROM salesman a 
CROSS JOIN  customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL;

/* assignment --2 ( Q-19) */

SELECT * FROM salesman a 
CROSS JOIN  customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL;

/* assignment --2 ( Q-20) */












