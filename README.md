# CycleInfraLnd
This package allows you to access and download data from the Transport for London Cycling Infrastructure Database.  It contains the following assets that are either lines(l) or points(p): 
* Advanced Stop Line (l)
* Crossing (l)
* Cycle lane/track (l)
* Restricted Route (l)
* Cycle Parking (p)
* Restricted Point (p)
* Signage (p)
* Signal (p)
* Traffic Calming (p)

These can be downloaded by using the relevent line or point command and the type of asset required.  The example list contains all the types.  Below are two examples:
  
`get_cid_lines(type = "advanced_stop_line")`

`get_cid_points(type = "signal")`


More information on the this database can be found [here](https://data.london.gov.uk/dataset/cycling-infrastructure-database).

There is a [Database Schema](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/cid_database_schema.xlsx), [Asset Information Guide](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/asset_information_guide.pdf) and [README](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/CIDASSETS_README.docx) for the CID. 

This [TFL blog](https://blog.tfl.gov.uk/2019/08/13/data-drop-cycling-infrastructure-database/) explains about the database.



