select*from portfolioproject..coviddeaths$ where continent is not null
order by date desc

select*from portfolioproject..covidvaccinated$ where continent is not null
order by date desc


--looking at location,death rate vs date in descending order
select location,date,total_deaths from portfolioproject..coviddeaths$
where total_deaths is not null
order by date desc

--looking at total cases vs new_cases based on contient and location
select location, continent, total_deaths,new_cases from portfolioproject..coviddeaths$
where continent is not null
order by total_deaths desc

--using at countries with highest infection rare compared to population
select location, total_deaths, MAX(new_cases) as HighestinfectionCount, MAX(new_cases/total_deaths)*100 as PrecentpopulationInfeted
from portfolioproject..coviddeaths$
--where location like "%states%"
group by location, total_deaths
order by PrecentpopulationInfeted desc

--showing continent with highest death count per population
select continent, MAX(total_deaths) as TotaldeathCount
from portfolioproject..coviddeaths$ 
where continent is not null
group by continent
order by TotaldeathCount desc

--showing countries with highest death count per population
select location, MAX(total_deaths) as TotaldeathCount
from portfolioproject..coviddeaths$ 
where total_deaths is not null
group by location
order by TotaldeathCount desc

--showing global numbers
select continent,max(cast(total_deaths as int)) as totaldeathcount
from portfolioproject..coviddeaths$
where continent is not null
group by continent
order by totaldeathcount desc

--showing maximum based on newcasescount
select continent,max(cast(new_cases as int)) as newcasescount
from portfolioproject..coviddeaths$
where continent is not null
group by continent
order by newcasescount desc

--showing continent vs average of deaths
select continent,AVG(cast(total_deaths as int)) as totaldeathcount
from portfolioproject..coviddeaths$
where continent is not null
group by continent
order by totaldeathcount desc

--showing continent vs newcasecount
select continent,AVG(cast(new_cases as int)) as newcasescount
from portfolioproject..coviddeaths$
where continent is not null
group by continent
order by newcasescount desc

--showing location vs totaltests
select location,total_deaths_per_million,total_tests
from portfolioproject..coviddeaths$
where total_tests is not null

--showing isco_code vs count of continent
select iso_code,count(continent) as count_of_continent from portfolioproject..coviddeaths$
group by iso_code 

--select sum of new_death and total_deaths as new_registering
select date,sum(total_deaths+new_deaths) as total_newly_registered from portfolioproject..coviddeaths$
group by date

--count of location vs sumof test

select iso_code,count(location) as count_of_location,count(total_tests) as sumoftest from portfolioproject..coviddeaths$
group by iso_code 








