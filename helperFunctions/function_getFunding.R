################################################################################
# function_getFunding.R
# Aaron Gullickson
#
# The R function here can be used to compile the amount of contract money that
# went to a particular geographic area from the contract database over some user
# defined time frame. The function assumes that money is distributed equally over
# the full number of days that the contract is active and very exactly determines
# the number of days that the contract is active within each time interval when 
# it apportions the funding.
#
# Note: This function only operates on the competitively bid dataset, not the 
#       disrectionary dataset. The discretionary dataset is missing most 
#       of the start and end dates. 
#
# ARGUMENTS
# geo - a string identifying the variable name for the geographic identifier 
#       (e.g. HealthArea, CommDist, PolicePrecinct). The user does not need
#       to put the ".service" subscript here for service addresses but can rather
#       use the service boolean argument later. 
# start - the beginning year of the first interval. 
# end - the end year of the last interval.
# width - the number of years for each interval.
# level - "C" for city, "S" for state, "B" for both
# service - a boolean variable. If true, the geographic identifier will use the 
#           contract service address rather than the org address.
# long - If true, the output will be sorted like a "long" panel dataset with each
#        year/geographic unit on a separate row. 
# includScode - if TRUE, then separate amounts will be calculated for each scode in 
#               addition to the total amount
# contracts - The user can specify a contract dataset that might already have some 
#             data restrictions placed on it. If nothing is entered here, the program
#             will attempt to load mergedcontracts.csv from the current directory. 
#
# OUTPUT
# the output is the total amount of dollars spent from all contracts in that particular 
# geographic area over that particular time frame, assuming dollars are spent at a constant 
# rate per day. The numbers are not adjusted by the population size of the area and are not 
# annualized.

getFunding <- function(geo, start, end, width, level="B",
                       service=FALSE, long=FALSE, includeScode=FALSE,
                       contracts=NULL) {
  
  if(((end-start+1)%%width)>0) {
    cat("The given width does not cover the range from start to end equally.")
    return()
  }
  
  if(service) {
    geo <- paste(geo, "service", sep=".")
  }
  
  #if no contracts object is passed in, then try loading one from the filesystem
  if(is.null(contracts)) {
    contracts <- read.csv("mergedcontracts.csv")
  }
  
  #always remove discretionary data because it has no start and end dates
  contracts <- contracts[contracts$competitive==1, ]
  
  if(level=="C" | level=="S") {
    contracts <- contracts[contracts$level==level, ]
  } else if(level!="B") {
    cat("Unknown level chosen.")
    return()
  }
  
  if(!(geo %in% colnames(contracts))) {
    cat(paste(geo, "is not a geographic identifier in the dataset."))
    return()
  }

  #convert NA's in s-codes to "UND" so they don't drop out of the total across all s-codes
  contracts$scode <- as.character(contracts$scode)
  contracts$scode[is.na(contracts$scode)] <- "UND"
  contracts$scode <- as.factor(contracts$scode)
  
  #caclulate the total amount per day
  contracts$amountday <- contracts$origamt/contracts$contractdays
  
  #set up the intervals
  years <- seq(start, end, width)
  
  amounts <- NULL
  
  #loop through intervals
  for(i in years) {
    
    ##calculate the number of days that each contract is valid for each interval
    startdate <- as.Date(paste("01","01",i, sep="/"), "%m/%d/%Y")
    enddate <- as.Date(paste("12","31",i+width-1, sep="/"), "%m/%d/%Y")
    
    totaltime <- enddate-startdate+1
    
    #calculate days into interval that the contract started
    daysUntilStart <- as.Date(contracts$startdate, "%m/%d/%y")-startdate
    #if this is negative then it started before interval, so convert to zero
    daysUntilStart[daysUntilStart<0] <- 0
    #if time is greater than length of the interval then assign full length
    daysUntilStart[daysUntilStart>totaltime] <- totaltime
    
    #calculate days before interval that contract ended
    daysUntilEnd <- enddate-as.Date(contracts$enddate, "%m/%d/%y")
    #If this is negative then it extended paste end date so convert to zero
    daysUntilEnd[daysUntilEnd<0] <- 0
    #if time is greater than length of the interval then assign full length
    daysUntilEnd[daysUntilEnd>totaltime] <- totaltime
    
    days <- totaltime-daysUntilStart-daysUntilEnd
    
    #now multiply the number of days by the amount per day
    amounts <- cbind(amounts, days*contracts$amountday)
  }
  
  amounts <- as.data.frame(amounts)
  amounts <- cbind(contracts[,geo], contracts$scode,amounts)
  #colnames(amounts) <- c(geo, "scode", paste("y",years, sep=""))

  #now sum up by geographic identifier
  final <- NULL
  for(i in 1:length(years)) {
    temp <- tapply(amounts[,i+2], amounts[,1:2], sum)
    ##missing values should be zeros
    temp[is.na(temp)] <- 0
    temp <- cbind(apply(temp,1,sum),temp)
    #colnames(temp) <- paste("amount",colnames(temp), sep="")
    if(long) {
      temp <- cbind(as.numeric(rownames(temp)), years[i], temp)
      if(!includeScode) {
        final <- rbind(final, temp[,1:3])
      } else {
        final <- rbind(final, temp)
      }
    } else {
      if(is.null(final)) {
        final <- cbind(final, as.numeric(rownames(temp)))
      }
      #colnames(temp) <- paste(colnames(temp), years[i], sep="")
      if(!includeScode) {
        final <- cbind(final, temp[,1])
      } else {
        final <- cbind(final, temp)
      }
    }
  }
  
  #names are a pain with all the different possibilities
  if(long) {
    if(includeScode) {
      colnames(final) <- c(geo, "year", paste("amount",  c("", paste("",sort(unique(contracts$scode)), sep=".")), sep=""))
    } else {
      colnames(final) <- c(geo, "year", "amount")
    }
  } else {
    if(includeScode) {
      colnames(final) <- c(geo, paste(rep(paste("amount", years, sep=""),each=length(unique(contracts$scode))+1), 
                                      c("", paste("",sort(unique(contracts$scode)), sep=".")), sep=""))
    } else {
      colnames(final) <- c(geo, paste("amount", years, sep=""))
      
    }
  }
  rownames(final) <- NULL
  
  return(data.frame(final))
  
}