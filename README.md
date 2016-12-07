# New York City Contract Data
 
## Background
 
These data contain information on active contracts to nonprofit organizations located in New York City between the years 1997 to 2011. This data is available as a csv file named `mergedcontracts.csv`. In addition to the contract data, we also provide an organizational dataset named `mergedorgs.csv` that lists information about every organization that received at least one contract over this time period. 

The data were requested and processed in three different rounds using somewhat different techniques and sources and researchers should be aware of these differences before analyzing the data. Researchers should be careful about combining all three sources into a single analysis. 

### Contract Data

In the first round, data were requested from both the city and state comptrollers under freedom of information laws for the years 1997 to 2001. These data include all competitively-bid contracts to nonprofit organizations with a New York City address by both the city and state governments of New York. This data was cleaned and processed manually by Marwell, Gullickson, and several research assistants. Because the same organization could be listed in different ways under the name of organization (e.g. abbreviations, acronyms, or full names), a major component of this processing was to identify the unique organizations that corresponded to each contract and provide a unique id to link the contract dataset with the organizational dataset. Codes were also developed manually for the service provided by the contract and for whether the organization was a local or distributive organization in terms of using its resources. The listed addresses of all organizations were also cleaned and geo-coded. 

In the second round, similar data were requested from both the city and state comptroller for the years 2002-2011. The process of finding unique organizations and linking contracts to the same organizations in both this stage and the previous stage was done computationally using the `RecordLinkage` library in R to find similar names and addresses. This initial technique was then checked by hand for mistakes. Because the procedures used by the city and state had changed significantly between requests, the available variables for the second round of data do not exactly match the variables in the first round. In particular, the second round of data for the city also included an address for where services were being provided. This address was geocoded along with the organizational address. 

The final round of data collection was to collect all discretionary funding allocations made by members of the New York City Council between 2003 and 2012. This dataset was obtained via a Freedom of Information Law request to the New York City Council. Some of these contracts overlapped with contracts in our second stage of data collection.  This was due to significant changes in the City Council procedures for administering discretionary funding allocations following a scandal in 2008. Therefore, we used the same computational approach to identify duplicate contracts before merging the contracts together and then proceeded to identify unique organizations computationally in the same manner as the second round. 

Three variables help identify each round of data collection. The boolean variable `secondRound` can be used to identify data from the second round of data collection rather than the first. All discretionary contracts from the third round that were not also identified in the second round are coded as missing values on this variable. The boolean variables `competitive` and `discretionary` help distinguish the competitive contracts from rounds one and two from the discretionary contracts in round three. However, some contracts will be coded TRUE on this variable if they were found in both the second round and third round data. 

### Organizational Data

The organizational data contains information about all organizations that received at least one contract in the contract data. The organizational data are organized in panel format where each line corresponds to an organization-year. This allows for organizational change and even spatial re-location across years. The variable `ID.org` can be used to link organizations to contracts in the contract data. 

Organizational information comes from the Business Master File (BMF) of the Internal Revenue Service, maintained by the National Center for Charitable Statistics. The subset of the BMF that is used here was provided by Thad Calabrese of New York University. These data are linked to organizations by Employer Identification Numbers (EINs). In the first and second round of data collection, EINs were initially looked up manually from either GuideStar.org or the National Center for Charitable Statistics. EINs were provided in the records from the third round of data collection. About 37% of EINs were still missing however, so we implemented a matching procedure using R's `RecordLinkage` library to identify as many missing organizations as possible in the BMF data. 

## Data Documentation

Documentation for all of the variables in both datasets is available in the `docs` directory. This directory also contains documentation about how decisions were made to code contracts into service areas. 

An additional directory called `helperFunctions` provides R code for functions that researchers might find helpful for extracting information from the datasets. 

## Editing the data

Manual editing of the data for corrections may still occur in the future. This section covers best practices for those researchers helping to clean the data or who are adding additional variables or coding existing variables. 

### Sorting files
When working on the files in excel, it might be useful to sort the entries into different orderings. However, before files are committed back to git, you must revert to a standard sort order to make sure that all the lines are identical to the ones in the repository. Otherwise, everything will show up as a change and everyone else will have conflicts. Here are the sort orderings to apply to each dataset.

**orgs:** id, year

**contracts:** ID.org, clean.name, startyear, clean.address, desc

### Format for saving files
The files are CSV (comma-separated values) files. This means they are text files, which is important because it simplifies both git's tracking of them and easy import into statistical software. 

Most people will probably want to work on the files in excel. Other spreadsheet software (e.g. Open  Office, Libre Office, Numbers) was found to be very slow when working with files of this size. When working on the files in Excel however it is important that you save them using this specific protocol:

1. File > Save as....
2. choose "Windows Comma Separated" as the format. WARNING: This is not the same as "Comma Separated Values."

The reason we need to do it this way is that the default CSV format in excel on Mac uses the wrong end of line encodings (\r) which can confuse git.  

Also, remember not to save it as an excel file. If you do, git will ignore it and you won't be able to commit your changes. If you accidentally do this, just open up the excel file and resave it as a Windows Comma Separated file. 
