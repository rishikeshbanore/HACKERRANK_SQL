/* PROBLEM STATEMENT: Type of Triangle
  Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

  Equilateral: It's a triangle with  sides of equal length.
  Isosceles: It's a triangle with  sides of equal length.
  Scalene: It's a triangle with  sides of differing lengths.
  Not A Triangle: The given values of A, B, and C don't form a triangle
*/

	SELECT CASE 
		WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle' 
		WHEN A = B AND B = C THEN 'Equilateral' 
		WHEN A = B OR B = C OR A = C THEN 'Isosceles' 
		ELSE 'Scalene' 
	END 
		FROM TRIANGLES;


/* PROBLEM STATEMENT:The PADS

Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/


select concat(Name,'(',substring(Occupation,1,1),')') as NAME 
	from Occupations 
	order by NAME;
Select concat ('There are a total of ', count(Occupation),' ', lower(Occupation),'s.') as TOTALS
	from Occupations
	group by Occupation
	order by TOTALS;