# Codebook for New York Public Contracts Project (NYPCP) mergedorgs dataset

Reference: Marwell, Nicole P. and Aaron Gullickson.  2016.  New York Public Contracts Project Dataset.

mergedorgs merges data from two different sources.  The first is the
New York Public Contracts Dataset mergedcontracts file, which provides
organization names.  The second is the Business Master File (BMF) from
the Internal Revenue Service, as managed by the National Center for
Charitable Statistics.  The BMF data cover the years 1997-2012, and
were provided by Professor Thad Calabrese of New York University.  The
researchers eliminated all BMF data corresponding to organizations not
included in the mergedcontracts database, and [something on how you
constructed the file with data for each year 1997-2012].  Not all
variables are available for all entries in the dataset.


## ein
Employer Identification Number, issued by federal government. EINs
were not included in the original raw data, but were assigned by
matching mergedorgs variable `name` to entries in the BMF data.

## year
Data in this row corresponds to the information contained in the BMF
for the indicated year.

## ID.org
The ID of the organization as it appears in the mergedcontracts
database. ID.org can be used to merge the two datasets. 

## name
The name of the organization based on the first listed clean.name from
the mergedcontracts dataset. 

## ID.bmf
Unique ID in the BMF data. 

## name.bmf
Name listed in the BMF data. 

## ntee1
The NTEE (National Taxonomy of Exempt Entities) major group code. From
the BMF. Values are single letter codes A-Z.  Meanings of these codes
can be found on the NCCS website.  See the following url:
http://nccsweb.urban.org/PubApps/nteeSearch.php?gQry=allMajor&codeType=NTEE

## nteecc
The NTEE-Core Code.  From the BMF.  Meanings of these codes can be
found on the NCCS website.  See the following url:
http://nccs.urban.org/classification/ntee.cfm

## city
The city in which the organization is located.  From the BMF.
 
## fips
2-digit State + 3-digit County FIPS code (Federal Information
Processing Standard).  From the BMF.

## ntmaj5
The NTEE classification system contains several sets of categories.
This code divides all public charities [IRS exempt category 501(c)3]
into one of 5 major sub-sectors.  From the BMF.
	
- AR=arts and culture
- ED=education
- HE=health
- HU=human services
- OT=other
- NA=no entry
	

## ntmaj10
The NTEE classification system contains several sets of categories.
This code divides all public charities [IRS exempt category 501(c)3]
into one of 10 major sub-sectors.  From the BMF.
	
- AR=arts and culture
- ED=education
- EN=environment and animals
- HE=health
- HU=human services
- IN=international and foreign affairs
- PU=public and societal benefit
- RE=religion related
- MU=mutual association or membership benefit
- UN=unknown or unclassified
- NA=no entry
	

## ntmaj12
The NTEE classification system contains several sets of categories.
This code divides all public charities [IRS exempt category 501(c)3]
into one of 12 major sub-sectors.  The distinction from ntmaj10 is
that ntmaj12 separates higher education from the education category,
and hospitals from the health category.  From the BMF.
	
- AR=arts and culture
- BH=higher education
- ED=education
- EN=environment and animals
- EH=hospitals
- HE=health
- HU=human services
- IN=international and foreign affairs
- PU=public and societal benefit
- RE=religion related
- MU=mutual association or membership benefit
- UN=unknown or unclassified
- NA=no entry



## majgrpb
Appears to be the same as variable `ntee1`.


## income
Gross receipts from the most recently filed Form 990.  If an
organization did not file in a particular year, the income figure will
be drawn from the most recently filed year.  This may lead to
duplicate figures across multiple years. From the BMF.


## assets
Total assets (end of year) from most recently filed Form 990.  If an
organization did not file in a particular year, the income figure will
be drawn from the most recently filed year.  This may lead to
duplicate figures across multiple years.  From the BMF.

## ctotrev
Total Revenue from most recently filed Form 990 (Part I, line 12 on
Form 990; Part I, line 9 on Form 990-EZ).  If an organization did not
file in a particular year, the income figure will be drawn from the
most recently filed year.  This may lead to duplicate figures across
multiple years.

## ruledate
Ruling date: year and month of IRS ruling or determination letter
recognizing organization’s tax exempt status (YYYYMM).  From the BMF.

## level3
Major NTEE category.  From the BMF.

## level4
NTEE-CC Major Group.  From the BMF.

## nyc
TRUE/FALSE based on whether the listed ZIP code
is in New York City.  Added by researchers during processing.