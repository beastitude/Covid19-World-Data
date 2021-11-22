SELECT location AS continent, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM Deaths
WHERE continent ='' AND (location != 'World' AND location !='International')
GROUP BY location
ORDER BY TotalDeathCount DESC;