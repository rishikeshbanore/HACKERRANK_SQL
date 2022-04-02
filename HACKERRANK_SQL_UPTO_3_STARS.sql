/* PROBLEM STATEMENT:
   Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
   The STATION table is described as follows:
   where LAT_N is the northern latitude and LONG_W is the western longitude
*/

	select distinct CITY from STATION where (ID % 2) = 0;

/* PROBLEM STATEMENT:
   Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table
*/

	select COUNT(CITY) - COUNT (distinct CITY) FROM STATION ;


/* PROBLEM STATEMENT:
   Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
   If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/

	select TOP 1 CITY CT, len(CITY) l from STATION
	order by l desc, CT asc;

	select top 1 CITY CT, len(CITY) l
	from  STATION
	order by l asc, CT asc;

/* PROBLEM STATEMENT:
   Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/

	select Distinct (CITY) from STATION where CITY like '[aeiou]%'

/* PROBLEM STATEMENT:
   Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates
*/

	select Distinct (CITY) from STATION where CITY like '%[aeiou]';

/* PROBLEM STATEMENT:
   Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates
*/

	select Distinct (CITY) from STATION where CITY like '[aeiou]%[aeiou]';


/* PROBLEM STATEMENT:
   Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/

	select Distinct (CITY) from STATION where CITY like '[^aeiou]%'

/* PROBLEM STATEMENT:
   Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/

	select Distinct (CITY) from STATION where CITY like '%[^aeiou]';

/* PROBLEM STATEMENT:
   Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/

	select distinct CITY from  STATION where LEFT(CITY,1) NOT IN ('a','e','i','o','u') OR RIGHT(CITY,1) NOT IN ('a','e','i','o','u')

/* PROBLEM STATEMENT:
   Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/

--Solution 1:

	select distinct CITY from  STATION where LEFT(CITY,1) NOT IN '[aeiou]%' AND RIGHT(CITY,1) NOT IN '%[aeiou]';

--Solution 2:

	select distinct CITY from  STATION where LEFT(CITY,1) NOT IN ('a','e','i','o','u') AND RIGHT(CITY,1) NOT IN ('a','e','i','o','u')


/* PROBLEM STATEMENT:
   Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have
   names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID
*/

	select NAME from STUDENTS where MARKS > 75 order by  RIGHT(NAME, 3), ID;

/* PROBLEM STATEMENT:
   Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/

	select NAME from EMPLOYEE order by name ASC;

/* PROBLEM STATEMENT:
   Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  
   key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), 
   and the actual average salary. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer
*/

	select CEILING(avg(SALARY)-avg(replace(SALARY,'0',''))) from EMPLOYEES;

/* PROBLEM STATEMENT:
   We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
   Write a query to find the maximum total earnings for
   all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
*/

   select MAX(SALARY*MONTHS), COUNT(*) from EMPLOYEE where (SALARY*MONTHS) = (SELECT MAX(SALARY*MONTHS) from EMPLOYEE);