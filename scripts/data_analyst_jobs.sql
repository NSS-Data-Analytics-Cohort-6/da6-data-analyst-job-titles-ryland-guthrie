--Q1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs
--Answer: There are 1793 rows in the table.

--Q2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT title, company
FROM data_analyst_jobs
LIMIT 10;
--Answer: ExxonMobil

--Q3. How many postings are in Tennessee? How many are either in Tennessee or Kentucky? 
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN'

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' OR location ='KY';
--Answer: 21 postings in TN; 27 postings in TN or KY.

--Q4. How many postings in Tennessee have a star rating above 4? 
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--Answer: 3

--Q5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--Answer: 151

--Q6. Show the average star rating for companies in each state. The output should show the state as 'state' and the average rating for the state as 'avg_rating'. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--Answer: Nebraska

--Q7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
--Answer: 881

--Q8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';
--Answer: 230

--Q9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL 
	AND review_count>5000
GROUP BY company;
--Answer: 40

--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL 
	AND review_count>5000
GROUP BY company
ORDER BY avg_rating DESC;
--Answer: Unilever, General Motors, Nike, American Express, Microsoft, and Kaiser Permanente all have an average rating of 4.19999.

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
--Answer: 774

--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%'
	AND title NOT ILIKE '%analytics%';
--Answer: 4

--**BONUS:** You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT domain, COUNT(domain)
FROM data_analyst_jobs
WHERE domain IS NOT NULL
	AND skill ILIKE '%sql%'
	AND days_since_posting > 21
GROUP BY domain
ORDER BY COUNT(domain) DESC;
--Answer: Internet and Software (62), Banks and Financial Services (61), Consulting and Business Services (57), and Health Care (52).