setwd("~/Desktop/EVENTS")

devtools::install_github("wesm/feather/R")

library(feather)
path <- "bigsuccess.feather"
df <- read_feather(path)


data <- read.csv("DONATIONS_PARTICIPANTS_TEAMS_EVENTS.csv", header = TRUE)
names(data)
head(data[115:140],1)

library(sqldf)
library(dplyr)
library(forcats)
library(lubridate)
library(Amelia)


# ----------------- ------------------- --------------------------- -----------------------
# Function to convert time to unix time for analysis & models


origin <- as.POSIXct('1970-01-01 00:00:00')

timestampToDateTime <- function(timestamp){
  dateTime <- as.POSIXct(timestamp * 5, tz = 'UTC', origin = "1970-01-01")
}

dateTimeToTimestamp <- function(dateTime) {
  timeStamp <- as.numeric(difftime(dateTime, as.POSIXct('1970-01-01 00:00:00', tz = 'UTC'), units = "secs") / 5)
}


events <- subset(data, select = c(Donations_EventDate, Public.Event.Name, Donor.Gender,
                                  Donor.City, Donor.State, Donor.ZIP, Donor.Employer,
                                  Donor.Connection.to.MS, participant_EventDate,
                                  participant_RegistrationActiveStatus, particpiant_IsPriorParticipant,
                                  Participant.Employer, Participant.Occupation, Participant.Connection.to.MS,
                                  Participant.Gender, Teams_NumberofParticipants, Teams_Company,
                                  Teams_EventDate, EVENTS_Event_ID, EVENTS_Public_Event_Name, EVENTS_Teams,
                                  EVENTS_Active_Registrations, EVENTS_Inactive_Registrations, 
                                  EVENTS_Total_of_All_Confirmed_Gifts..., EVENTS_Total_Event_Gifts..., 
                                  EVENTS_City, EVENTS_State, EVENTS_Zip_Code))

head(events)
str(events)


events$Donations_EventDate <- as.POSIXct.date(events$Donations_EventDate)

## New Data to be created

library(dplyr)
library(forcats)
library(magrittr)
library(sqldf)
library(ggplot2)


bikeEvents <- read.csv("2013_2017_BikeEvents.csv", header = T)

head(bikeEvents)

names(bikeEvents)

str(bikeEvents$State)
str(bikeEvents$Active_Registrations)


mkt <- sqldf("select State, sum(Active_Registrations) as Total_Active_Regist
             from bikeEvents
             where Active_Registrations > 0
             group by State" )

mkt %>%
  arrange(desc(Total_Active_Regist))

# Top 10 state markets in  terms of active registrations

markets = c("TX","NJ","MN","NY","CA", "NC", "FL", "OH", "IL", "MA", "CO")


#retrieving active registrations for top markets
AllEventRegistrations = bikeEvents%>%
  select(Security_Category_Name,Fiscal_Year,State,Active_Registrations)%>%
  group_by(Security_Category_Name,Fiscal_Year,State)%>%
  summarise(sum(Active_Registrations))%>%
  filter(State %in% markets)



write.table(All.events.registrations,"Events.registrations.State.csv", sep = ",")



## New Data to be created
library(dplyr)




don2013 <- read.csv("2013 Bike Donations.csv", sep = ",")
head(don2012)
names(don2012)


don2013 <- subset(don2013, select = c(Event.ID, Public.Event.Name, Fiscal.Year, Event.Date,
                                      Is.Registration., Donor.Gender, Donor.State, Registration.Active.Status,
                                      Original.Value.Transacted, Net.Transaction.Amount, Ledger.Transaction.Amount, 
                                      Donor.Connection.to.MS, Donor.Employer, Gift.Type))

don2014 <- read.csv(file = "2014 Bike Donations.csv", sep = ",")
names(don2014)

don2014 <- subset(don2014, select = c(Event.ID, Public.Event.Name, Fiscal.Year, Event.Date,
                                      Is.Registration., Donor.Gender, Donor.State, Registration.Active.Status,
                                      Original.Value.Transacted, Net.Transaction.Amount, Ledger.Transaction.Amount, 
                                      Donor.Connection.to.MS, Donor.Employer, Gift.Type))

don2015 <- read.csv(file = "2015 Bike Donations.csv", sep = ",")
don2015 <- subset(don2015, select = c(Event.ID, Public.Event.Name, Fiscal.Year, Event.Date,
                                      Is.Registration., Donor.Gender, Donor.State, Registration.Active.Status,
                                      Original.Value.Transacted, Net.Transaction.Amount, Ledger.Transaction.Amount, 
                                      Donor.Connection.to.MS, Donor.Employer, Gift.Type))


don2016 <- read.csv(file = "2016 Bike Donations.csv", sep = ",")
don2016 <- subset(don2016, select = c(Event.ID, Public.Event.Name, Fiscal.Year, Event.Date,
                                      Is.Registration., Donor.Gender, Donor.State, Registration.Active.Status,
                                      Original.Value.Transacted, Net.Transaction.Amount, Ledger.Transaction.Amount, 
                                      Donor.Connection.to.MS, Donor.Employer, Gift.Type))


don2017 <- read.csv(file = "2017 Bike Donations.csv", sep = ",")
don2017 <- subset(don2017, select = c(Event.ID, Public.Event.Name, Fiscal.Year, Event.Date,
                                      Is.Registration., Donor.Gender, Donor.State, Registration.Active.Status,
                                      Original.Value.Transacted, Net.Transaction.Amount, Ledger.Transaction.Amount, 
                                      Donor.Connection.to.MS, Donor.Employer, Gift.Type))



donations <- rbind(don2013, don2014, don2015, don2016, don2017)

library(utils)
write.csv(donations, file = "donations.csv", row.names = FALSE)




