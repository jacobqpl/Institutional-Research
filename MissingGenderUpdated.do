**Missing Gender Project**
**Peilin Qiu 9/5/2019**

***Import the original data and lower the first name
import excel "C:\Peilin\Missing gender\MissingGender.xlsx", sheet("MissingGender") firstrow
gen firstname = lower(SPRIDEN_FIRST_NAME)
order firstname
saveold "C:\Peilin\Missing gender\MissingGender.dta"
clear

***Import the standard data for first name and lower the first name
import excel "C:\Peilin\Missing gender\name_gender.xlsx", sheet("name_gender") firstrow
gen firstname = lower(name)
order firstname
saveold "C:\Peilin\Missing gender\standardgender.dta"
clear

***Data Management-The missing gender dataset
use "C:\Peilin\Missing gender\MissingGender.dta"
sort firstname  //sort the observations of firstname
save "C:\Peilin\Missing gender\MissingGender.dta", replace
clear

***Data Management-The missing gender dataset
use "C:\Peilin\Missing gender\standardgender.dta"
sort firstname
save "C:\Peilin\Missing gender\standardgender.dta", replace
clear

***Matching
use "C:\Peilin\Missing gender\MissingGender.dta"
joinby firstname using "C:\Peilin\Missing gender\standardgender.dta",unmatched(master)
saveold "C:\Peilin\Missing gender\MatchedData.dta"
export excel using "OutcomeData"
