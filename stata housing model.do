***first clear Stata and turn the "more" option off:
clear all
set more off, permanent
use "\\tsclient\Desktop\house.dta"
gen lnprice =ln( Price )
gen lnsize = ln( Size )
gen lnrooms = ln( Rooms)
gen lnbaths = ln( Baths )
gen lnlotsize = ln( Lotsize )

gen lnzestimate = ln( Zestimate )
gen lnyear = ln( Year)

egen City_id=group(City)
gen Davis = 0
gen Fresno = 0
gen SF = 0
gen Berkeley = 0

replace Davis=1 if City=="Davis"
replace Fresno=1 if City=="Fresno"
replace Berkeley=1 if City=="Berkeley"

**reggresion on price and zest**
reg Price Zestimate
predict lnprice_hat
**2 hypothesis test*

test Zestimate=1
***Prob > F =    0.0401 > 0.01 
**fail to reject Ho 


reg lnprice lnsize lnrooms lnbaths lnlotsize lnyear Parking Type


***7**

reg lnprice lnsize lnrooms lnbaths lnlotsize lnyear Parking Type i.Berkeley i.Davis i.Fresno


***** **reject null

**9**
reg lnprice lnsize lnrooms lnbaths lnlotsize lnyear Parking Type i.Berkeley i.Davis i.Fresno  c.lnsize#Davis  c.lnsize#Berkeley  c.lnsize#Fresno

