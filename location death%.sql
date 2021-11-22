-- What is the liklihood of dying from COVID19 in a specific country in the year 2020?
-- Percentage of deaths from COVID19 per country per day in 2020

SELECT location, DATE, total_cases, total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM Deaths
WHERE location LIKE '%Guyana%'
ORDER BY location,DATE DESC;