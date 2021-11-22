-- CTE to be able to calculate with Total_New_Vaccinations
WITH PopvsVax (continent, location, DATE, population, new_vaccinations, Total_New_Vaccinations) AS 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vax.new_vaccinations,
-- seperates new_vaccinations by location to show the total new_vaccinations of that location ordered by date
	SUM(vax.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS Total_New_Vaccinations
FROM Deaths AS dea
INNER JOIN Vaccinations AS vax
 ON dea.location = vax.location
 AND dea.date = vax.date
WHERE dea.continent IS NOT NULL
)

SELECT *, (Total_New_Vaccinations/population) * 100 AS Percentage_Vax_Population
FROM PopvsVax;