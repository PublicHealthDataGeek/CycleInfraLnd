# CycleInfraLnd
This R package allows you to access and download data from the Transport for London Cycling Infrastructure Database in R as spatial data.  It contains the following assets that are either lines(l) or points(p): 
* Advanced Stop Line (l)
* Crossing (l)
* Cycle lane/track (l)
* Restricted Route (l)
* Cycle Parking (p)
* Restricted Point (p)
* Signage (p)
* Signal (p)
* Traffic Calming (p)

More information on the CID can be found [here](https://data.london.gov.uk/dataset/cycling-infrastructure-database) and in this [TFL blog](https://blog.tfl.gov.uk/2019/08/13/data-drop-cycling-infrastructure-database/).

The [Database Schema](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/cid_database_schema.xlsx), [Asset Information Guide](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/asset_information_guide.pdf) and [README](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/CIDASSETS_README.docx) provide important and useful information about the content of the database and how it was collected. 

## Installing and using the CycleInfraLnd R package
Use the following code to:

1) Install the devtools package if you do not already have that in your R installation

  `install.packages("devtools")`

  `library(devtools)`

2) Use devtools to download the CycleInfraLnd package from github

  `devtools::install_github("publichealthdatageek/CycleInfraLnd")`

3) Use library to load the CycleInfraLnd package

  `library(CycleInfraLnd)`

4) Use the relevent function to download the type of data you want (lines or points) and the asset type
For example:
  
  `get_cid_lines(type = "advanced_stop_line")`

  `get_cid_points(type = "signal")`

The example list in the help file contains all variations of this code for each of the different asset types.




