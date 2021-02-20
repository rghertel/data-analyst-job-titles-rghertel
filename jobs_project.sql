--1.
SELECT COUNT(*) 
FROM data_analyst_jobs;
--1793

--2.
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--3a.
SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE location = 'TN';
--21

--3b.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--27

--4.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--3

--5.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151

--6.
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
AND star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;
--Nebraska

--7a.
SELECT DISTINCT(title)
FROM data_analyst_jobs;

--7b.
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--881

--8.
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
--230

--9a.
SELECT company, ROUND(AVG(star_rating),1) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

--9b.
SELECT COUNT(DISTINCT(company))
FROM data_analyst_jobs
WHERE review_count > 5000;
--40

--10.
SELECT company, ROUND(AVG(star_rating),1) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;
--Tie @ 4.2: General Motors, Unilever, Microsoft, Nike, American
--Express, Kaiser Permanente

--11a.
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--11b.
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--774

--12.
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'
--4

--12b.
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'
--They all involve Tableau

--BONUS.
SELECT COUNT(title) AS open_jobs_count, domain AS industry
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY open_jobs_count DESC;
--Internet and Software: 62, Banks and Financial Services: 61, 
--Consulting and Business Services: 57, Healthcare: 52
