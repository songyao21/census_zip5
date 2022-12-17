# census_zip5
This repository extract certain demo info at zip code level from 2016 onwards
The census data are based on 5-year American Community Surveys distributed by NHGIS (https://www.nhgis.org/).
Data compiled for 2016 onward (latest is 2021). Tables downloaded from NHGIS are

B01001. Sex by Age

B01002. Median Age by Sex

B01003. Total Population

B02001. Race

B11001. Household Type (Including Living Alone)

B15003. Educational Attainment for the Population 25 Years and Over

B19013. Median Household Income in the Past 12 Months (in 2020 Inflation-Adjusted Dollars)

B25044. Tenure by Vehicles Available

To construct population density of each zip code, we also need the land area of each zip code. I extract zip code land area from https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.html#zcta
