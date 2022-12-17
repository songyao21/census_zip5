# Yearly Census demographic data at zip5 level
This repository extract certain demo info at zip code level from 2016 onwards
The census data are based on 5-year American Community Surveys, maintained and distributed by 
IPUMS NHGIS, University of Minnesota, www.nhgis.org

To construct population density of each zip code, I extract zip code land area from https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.html#zcta

Data compiled for 2016 onward (latest is 2021). The resulted data contain the following yearly demographic information of each zip code:
1. Population
2. Population density
3. Number of households
4. Number of adults (older than 18)
5. Median household income (inflaction-adjusted to December 2021)
6. Car-owning fraction (defined as (car-owning dwelling units) / (dwelling units)
7. College and above fraction out of residents 25 and older.

Tables downloaded from NHGIS are

B01001. Sex by Age

B01002. Median Age by Sex

B01003. Total Population

B02001. Race

B11001. Household Type (Including Living Alone)

B15003. Educational Attainment for the Population 25 Years and Over

B19013. Median Household Income in the Past 12 Months (in 2020 Inflation-Adjusted Dollars)

B25044. Tenure by Vehicles Available

