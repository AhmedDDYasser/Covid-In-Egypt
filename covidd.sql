-- I wanna see how Egypt did in corona virus era
select location , date , total_cases , total_deaths , population 
from covid..coviddeaths 
where location = 'Egypt'

-- Death percentage in Egypt 
select location , date , total_cases ,
total_deaths , (cast (total_deaths as decimal) /total_cases)*100 as deathpercentage
from covid..coviddeaths 
where location = 'Egypt'


-- total cases vs population 
select location , date , total_cases ,
total_deaths ,(total_cases/population)*100 as infectedpercentage , population
from covid..coviddeaths 
where location = 'Egypt'
order by 1,2

-- countries with highest with highest infect percentage
select location , population  ,
 MAX (total_cases)as highestinfectcount ,
MAX((total_cases/population)*100 )as infectedpercentage 
from covid..coviddeaths 
--where location like '%Egypt%'
group by location , population 
order by infectedpercentage desc

-- countries with highest death 
select location , MAX(cast (total_deaths as decimal)) as deaths
from covid..coviddeaths
where continent is not null
group by location
order by deaths Desc

-- Continents
select continent , MAX(cast (total_deaths as decimal)) as deaths 
from covid..coviddeaths
where continent is not null
group by continent
order by deaths Desc


--Global Numbers 
select  SUM(new_cases) as total_cases , SUM(cast(new_deaths as int)) as total_deaths , 
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as deathpercentage
from covid..coviddeaths 
where continent is not null
order by 1 


