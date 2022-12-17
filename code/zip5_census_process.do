// land area
cd ~/Documents/GitHub/census_zip5
// land area data downloaded from 
// https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.html#zcta
import delimited "./input/tab20_zcta520_county20_natl.txt", clear
drop if geoid_zcta5 == .
rename geoid_zcta5 zipcode
rename arealand_zcta5 arealand
keep zipcode arealand
replace arealand=arealand/1e+6 //convert from sq meter to sq kilometer
duplicates drop //a zip code may appear in multiple counties. So there are duplicates
save ./temp/landarea, replace


// 2021
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0018_csv/nhgis0018_ds254_20215_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

// For the definition of each variable, see the documentation file the unzipped folder
rename ZCTA5 zipcode

rename AON4E001 population
rename AOO1E001 household
rename AOQIE001 med_inc    //median income households

// adults 18 and above
egen male_adults = rsum(AONTE007-AONTE025)
egen female_adults = rsum(AONTE031-AONTE049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(AOP8E022-AOP8E025)
egen male_older_25 = rsum(AONTE011-AONTE025)
egen female_older_25 = rsum(AONTE035-AONTE049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AOTRE001 total_houses
egen car_owner_houses = rsum(AOTRE004-AOTRE008)
egen car_renter_houses = rsum(AOTRE011-AOTRE015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2021

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2021, replace

// 2020
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0019_csv/nhgis0019_ds249_20205_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

rename ZCTA5 zipcode

rename AMPVE001 population
rename AMQSE001 household
rename AMR8E001 med_inc    //median income households
// inflaction adjusted to 2021
// https://www.bls.gov/data/inflation_calculator.htm
replace med_inc = med_inc * 1.07


// adults 18 and above
egen male_adults = rsum(AMPKE007-AMPKE025)
egen female_adults = rsum(AMPKE031-AMPKE049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(AMRZE022-AMRZE025)
egen male_older_25 = rsum(AMPKE011-AMPKE025)
egen female_older_25 = rsum(AMPKE035-AMPKE049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AMVHE001 total_houses
egen car_owner_houses = rsum(AMVHE004-AMVHE008)
egen car_renter_houses = rsum(AMVHE011-AMVHE015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2020

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2020, replace

// 2019
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0020_csv/nhgis0020_ds244_20195_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

rename ZCTA5 zipcode

rename ALUBE001 population
rename ALU9E001 household
rename ALW1E001 med_inc    //median income households
// inflaction adjusted to 2021
// https://www.bls.gov/data/inflation_calculator.htm
replace med_inc = med_inc * 1.08


// adults 18 and above
egen male_adults = rsum(ALT0E007-ALT0E025)
egen female_adults = rsum(ALT0E031-ALT0E049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(ALWGE022-ALWGE025)
egen male_older_25 = rsum(ALT0E011-ALT0E025)
egen female_older_25 = rsum(ALT0E035-ALT0E049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AL0NE001 total_houses
egen car_owner_houses = rsum(AL0NE004-AL0NE008)
egen car_renter_houses = rsum(AL0NE011-AL0NE015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2019

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2019, replace

// 2018
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0021_csv/nhgis0021_ds239_20185_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

rename ZCTA5 zipcode

rename AJWME001 population
rename AJXKE001 household
rename AJZAE001 med_inc    //median income households
// inflaction adjusted to 2021
// https://www.bls.gov/data/inflation_calculator.htm
replace med_inc = med_inc * 1.11

// adults 18 and above
egen male_adults = rsum(AJWBE007-AJWBE025)
egen female_adults = rsum(AJWBE031-AJWBE049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(AJYPE022-AJYPE025)
egen male_older_25 = rsum(AJWBE011-AJWBE025)
egen female_older_25 = rsum(AJWBE035-AJWBE049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AJ2WE001 total_houses
egen car_owner_houses = rsum(AJ2WE004-AJ2WE008)
egen car_renter_houses = rsum(AJ2WE011-AJ2WE015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2018

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2018, replace

// 2017
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0025_csv/nhgis0025_ds233_20175_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

rename ZCTA5 zipcode

rename AHY1E001 population
rename AHZZE001 household
rename AH1PE001 med_inc    //median income households
// inflaction adjusted to 2021
// https://www.bls.gov/data/inflation_calculator.htm
replace med_inc = med_inc * 1.13

// adults 18 and above
egen male_adults = rsum(AHYQE007-AHYQE025)
egen female_adults = rsum(AHYQE031-AHYQE049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(AH04E022-AH04E025)
egen male_older_25 = rsum(AHYQE011-AHYQE025)
egen female_older_25 = rsum(AHYQE035-AHYQE049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AH49E001 total_houses
egen car_owner_houses = rsum(AH49E004-AH49E008)
egen car_renter_houses = rsum(AH49E011-AH49E015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2017

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2017, replace

// 2016
// census data zip level, downloaded from NHGIS
import delimited ///
	"./input/nhgis0023_csv/nhgis0023_ds225_20165_zcta.csv", clear

foreach v of varlist * {
   local x : variable label `v'
   rename `v' `x'
   label variable `x' "`v'"
}

rename ZCTA5 zipcode

rename AF2LE001 population
rename AF3JE001 household
rename AF49E001 med_inc    //median income households
// inflaction adjusted to 2021
// https://www.bls.gov/data/inflation_calculator.htm
replace med_inc = med_inc * 1.15

// adults 18 and above
egen male_adults = rsum(AF2AE007-AF2AE025)
egen female_adults = rsum(AF2AE031-AF2AE049)
gen adults = male_adults + female_adults

// college and above for adults 25 years and over
egen college_above = rsum(AF4OE022-AF4OE025)
egen male_older_25 = rsum(AF2AE011-AF2AE025)
egen female_older_25 = rsum(AF2AE035-AF2AE049)
gen pop_older_25 = male_older_25 + female_older_25
gen college_frac = college_above / pop_older_25

// car-owning dwelling
rename AF8RE001 total_houses
egen car_owner_houses = rsum(AF8RE004-AF8RE008)
egen car_renter_houses = rsum(AF8RE011-AF8RE015)
gen car_owner_frac = (car_owner_houses + car_renter_houses) / total_houses

merge 1:1 zipcode using ./temp/landarea, nogen

gen pop_den = round(population/arealand) //pop per sq kilometer

gen year=2016

keep zipcode year population pop_den household adults college_frac ///
	car_owner_frac med_inc

save ./temp/census2016, replace

use ./temp/census2016, clear
forval year=2017/2021{
	append using ./temp/census`year'
}

// check summary stats over time
// bysort year: sum

save ./output/census_zip5_2016_2021, replace
