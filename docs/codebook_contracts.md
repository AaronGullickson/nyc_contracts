# Codebook for dataset mergedcontracts

mergedcontracts merges data from five different sources. The first two
sources are competitively-bid contracts provided to non-profit
organizations from 1997-2001 from the city of New York and the state of
New York, respectively. The second two sources are the same type of
contracts from the city and state of NY for the years 2002-2012. The
final source is discretionary contracts from the city of NY from
2002-2012. Collectively, these different data sources are identifiable
from the variables level (giving city or state), secondRound,
competitive, and discretionary.  Because of the different sources, not
all variables are available for every contract in the dataset. See
detailed variable descriptions for availability information. 

## id
A unique id for each contract in the dataset. This was assigned by
researchers during processing.

## level			
Indicator variable for whether the contract is from NY State or NY City 

* S=state 
* C=city

## secondRound 
True/false variable indicating whether the data come from the
second round of data collection on competitive contracts (2002-2012).
 		
## competitive
Boolean variable indicating whether the contract is from
competitive-bid dataset. Note that there are some contracts identified
in both the discretionary and competitive datasets.

## discretionary		
Boolean variable indicating whether contract is from discretionary
funding dataset. Note that there are some contracts identified in both
the discretionary and competitive datasets.
		
## vendor			
Name of contract recipient in the original raw data. Generally this is
not as useful as the clean.name variable which strips out punctuation and
provides some standardization.


## address
Address of contract recipient in the original raw data. Generally this
is not as useful as the clean.address variable which strips out
punctation and standardizes abbreviations.

## clean.name
Name of contract recipient after cleaning and standardization. All
punctuation is removed and common words such as "The" and "inc" are
removed. This makes it much easier to look for the same organization,
but the same organization still may appear under different cleaned
names. Users should use the ID.org variable to identify unique
organizations.

## clean.address
Address of contract recipient after cleaning and
standardization. Punctuation was stripped out and all abbreviations for
street types were replaced with full names (e.g. AVE becomes
AVENUE). Along with zip code, this is the address that was used to
geo-code the contract.

## zip			
Zip code of contract recipient from the original data. All contracts
with non-NYC zip codes have been removed from the dataset.


## ID.org			
A unique identifier for contract recipient. This variable is assigned
by researchers during processing. Initial linking of contracts on
first round of competitive data (1997-2001) was done by hand and the
letter abbreviation refers to the name of the researcher making the
link. On the second round of competitive data and the discretionary
data, the linkage was automated using record linkage software which
looked for a high degree of matching on clean.name and
clean.address. New organizations identified using this process begin
with "RR" in the competitive bid contracts and a "DI" for the
discretionary contracts.

If the format includes decimal places (e.g., A432.2), the id indicates
a distinct branch of a multi-site organization, where the part before
the decimal place identifies the multi-sited organization.

## EIN
Employer Identification Number, issued by federal government. EINs
were not included in the original raw data, but were assigned by
matching clean.name to entries in the Guidestar.org online database or
a digital download of data from the National Center on Charitable
Statistics (NCCS).  Both the Guidestar.org database and the NCCS
database compile information from the IRS Form 990, and make it
available for public use.

## desc
Description of contract purpose, from the original raw data.

## startdate
Start date of contract (m/d/y), from the original raw data. 

## enddate
End date of contract (m/d/y), from the original raw data.

## regdate
The date (m/d/y) that contract was registered with controller’s
office. The controller is the chief fiscal officer, and is responsible
for issuing contract payments through the NYC and NYS payment systems.
Payments cannot be issued until a contract is registered.  The
reliability of this field is in question, as conversations with city
and state officials indicate that sometimes the contract registration
date is backdated, i.e., a regdate is assigned that is prior to the
actual date of contract approval and first payment.  It is unclear why
this practice occurs.

## fiscal.year		
The fiscal year in which contract began, as per NYS and NYC budget
year. Fiscal years run July 1-June 30 - e.g., FY1998 runs July 1, 1997
to July 1, 1998.

## startyear		
The calendar year in which contract began, based on startdate. 

## contractdays		
Count of days between contract startdate and enddate.

## contractlen
The length of the contract in years. Fractions are always rounded up.

## origamt			
The amount of the contract, in unadjusted dollars, from the original
raw data.

## expamt
The amount of the contract expended as of date of data pull, in
unadjusted dollars, from the original raw data

## encamt			
The amount of the contract encumbered as of data of data pull, in
unadjusted dollars, from the original raw data.

## amtyr			
The amount of the contract per year of its length, in unadjusted
dollars. This variable is constructed by dividing origamt by
contractlen.

## service.address		
The address where service was provided, from the original raw
data. This service address is only available in the second round of
the competitive bid contract data. Note that in some cases, the
service address and the address of the organization will be the same.
This is understood to be because the contract recipient has only one
location, which is both the organizational address and the service
location address.

## clean.service.address
Service address from the service.address, cleaned and standardized as
for clean.address above.

## service.zip
Zip code where service was provided, from the original raw data. 

## corrected.address
The organizational address returned from the geocoding procedure using
clean.address. In some cases, this address may differ from
clean.address because of corrections applied in the geocoding
procedure.

## corrected.zip
The organizational zip code returned from the geocoding procedure
using zip. In some cases, this address may differ from zip because of
corrections applied in the geocoding procedure.

## city			
The listed city of the organization from the original raw data. 

## state	
The listed state of the organization from the original raw
data. Non-NY responses have been removed from the dataset. 

## naaccrQualType
Indicator for the type of technique used for the geocoding of the
organizational address.

## Latitude
The latitude of the geocoded organizational address. 

## Longitude
The longitude of the geocoded organizational address. 	

## CensusBlock		
The census block corresponding to the geocoded latitude and longitude
of the organizational address.


## CensusBlockGroup	
The census block group corresponding to the geocoded latitude and
longitude of the organizational address.


## CensusTract
The census tract corresponding to the geocoded latitude and
longitude of the organizational address.


## HealthArea
The NYC health area corresponding to the geocoded latitude and
longitude of the organizational address. The health area id will only uniquely identify health areas when used in combination with the `BoroCode` variable below. 


## BoroCode
Numeric code for the borough corresponding to the geocoded latitude and
longitude of the organizational address.

- 1=Manhattan
- 2=Bronx
- 3=Brooklyn
- 4=Queens
- 5=Staten Island


## BoroName
The name of the borough corresponding to the geocoded latitude and
longitude of the organizational address.


## CityCouncil
The NY city council district corresponding to the geocoded latitude
and longitude of the organizational address.


## StateSenate
The NY state senate district corresponding to the geocoded latitude
and longitude of the organizational address.


## CommDist
The NYC community district corresponding to the geocoded latitude and
longitude of the organizational address. 1st digit indicates borough
as per BoroCode.


## StateAssembly
The NY state assembly district corresponding to the geocoded latitude
and longitude of the organizational address.


## PolicePrecinct
The NYC police precinct corresponding to the geocoded latitude
and longitude of the organizational address.


## scode
Text code indicating which one of 25 different service types the
contract is for.  Hand coded by researchers based on visual inspection
of desc variable.  Document with fuller code descriptions and sample
contract descriptions is available as a separate document entitled
“scode_rules.txt”
	
- ADV=advocacy
- CD=community development
- CR=crime
- CULTO=cultural, including environmental
- DC=day care
- DIS=disabilities
- EDUC= education and training (for adults; not K-12 education)
- ELD=elderly
- EMPM=employment for mentally ill people
- EMPL=literacy and pre-employment skill training (for adults)
- EMPO=other employment
- FSF=foster care
- FSP=family preventive services
- GEN=general multi-service
- GOS=general operating support
- HLA=AIDS-related health
- HLM=mental health
- HLS=substance abuse
- HLO=other health
- HOUS=housing
- IMM=immigration
- MI=member items
- NRENT=rent or physical plant costs
- UND=undecided
- YOUTH=children and youth
	

## corrected.service.address
The service address returned from the geocoding procedure using
clean.service.address. In some cases, this address may differ from
clean.service.address because of corrections applied in the geocoding
procedure.


## corrected.service.zip
The service zip code returned from the geocoding procedure using
service.zip. In some cases, this address may differ from service.zip
because of corrections applied in the geocoding procedure.


## city.service
The listed city of the service from the original raw data. 


## state.service
The listed state of the service from the original raw
data. 


## naaccrQualType.service
Indicator for the type of technique used for the geocoding of the
service address.


## Latitude.service
The latitude of the geocoded service address. 


## Longitude.service
The longitude of the geocoded service address. 	


## CensusBlock.service
The census block corresponding to the geocoded latitude and longitude
of the service address.


## CensusBlockGroup.service	
The census block group corresponding to the geocoded latitude and
longitude of the service address.


## CensusTract.service
The census tract corresponding to the geocoded latitude and
longitude of the service address.


## HealthArea.service
The NYC health area corresponding to the geocoded latitude and
longitude of the service address. The Health Area id will only uniquely identify health areas when used in combination with the `Boro.service` variable below. 


## Boro.service
Numeric code for the borough corresponding to the geocoded latitude and
longitude of the service address.

- 1=Manhattan
- 2=Bronx
- 3=Brooklyn
- 4=Queens
- 5=Staten Island


## BoroName.service
The name of the borough corresponding to the geocoded latitude and
longitude of the service address.


## CityCouncil.service
The NY city council district corresponding to the geocoded latitude
and longitude of the service address.


## StateSenate.service
The NY state senate district corresponding to the geocoded latitude
and longitude of the service address.


## CommDist.service
The NYC community district corresponding to the geocoded latitude and
longitude of the service address. 1st digit indicates borough
as per BoroCode.


## StateAssembly.service
The NY state assembly district corresponding to the geocoded latitude
and longitude of the service address.


## PolicePrecinct.service
The NYC police precinct corresponding to the geocoded latitude
and longitude of the service address.


## members.new
Standardized version of NY City Council member name.  Assigned by
researchers during processing.


## members.id
A unique identifier for NY City Council members. First digit indicates
member’s district. Last digit indicates the order of arrival to the
data set. Thus, id=92, represents the second council member to
represent District 9.


## members.district
The NY City Council district that the council member represents.


## patronage
A dummy variable indicating whether a discretionary contract was given
by a NY City council member to an organization in his/her own district
	1 = contract given to an organization in a member’s own district


## adjacent
A dummy variable indicating whether a contract was given by an NY City
council member to an organization in a district geographically
adjacent to the district s/he represents
	1 = contract given to organization in an adjacent district to member’s district


## contractno		
The contract number provided in the original data. These contract
numbers do NOT uniquely identify contracts.  They contain only a
portion of the full contract number, which would be a unique
identifier.


## c.transcode
Unknown.  From the original raw data.


## c.typecode
NY City code for type of contract.  From the original raw data.  See
Appendix 11 of the FY2014 Annual Summary Contracts Report for the City
of New York for a full list of codes.
http://comptroller.nyc.gov/wp-content/uploads/documents/Annual_Report.pdf
or see the following url: 
<http://comptroller.nyc.gov/wp-content/uploads/documents/contract-type-list.pdf>


## c.awardcode
NY City code for contract award method category.  From the original
raw data.  See Appendix 10 of the FY2014 Annual Summary Contracts
Report for the City of New York for a full list of codes.
http://comptroller.nyc.gov/wp-content/uploads/documents/Annual_Report.pdf
or see the following url:
<http://comptroller.nyc.gov/wp-content/uploads/documents/award-method.pdf>


## c.category
NY City code for contract category.  From the original raw data.  See
Appendix 12 of the FY2014 Annual Summary Contracts Report for the City
of New York for a full list of codes.
http://comptroller.nyc.gov/wp-content/uploads/documents/Annual_Report.pdfs
or see the following url:
<http://comptroller.nyc.gov/wp-content/uploads/documents/category-code-list.pdf>


## s.agency
NY State agency that awarded contract. Text entry. Original raw data.


## s.category
NY State code for contract category.  Meaning of codes unknown. Original raw data.


## s.type
NY State code for type of contract.  Text entry.  Original raw data.


## CB1-10
In the first round of data (1997-2001) the community districts where
the service was to be provided was listed in the city data. Up to ten
different responses were provided. These variables indicate the
community district indicated starting with the first mention (CB1) to
the tenth mention (CB10). The starting letter indicates the borough
(M=Manhattan, B=Brooklyn, Q=Queens, S=Staten Island, X=Bronx) and the
following numbers indicate the community district id within that
borough. Note that a substantial number of contracts listed "ALL" and
some also indicated none.


## c.agency
NY City agency that awarded contract.  See Appendix 9 of the the
FY2014 Annual Summary Contracts Report for the City of New York for a
full list of codes.
http://comptroller.nyc.gov/wp-content/uploads/documents/Annual_Report.pdf

[should we move this column alongside the other c.variables?]


## type
Indicator for whether the organization receiving the contract is a
local or distributive organization. This variable was hand-coded
during processing.

- L=local
- D=distributive
