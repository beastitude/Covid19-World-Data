SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM Deaths
GROUP BY location
ORDER BY PercentPopulationInfected DESC;