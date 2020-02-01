
<!-- README.md is generated from README.Rmd. Please edit that file -->
CycleInfraLnd
=============

The goal of this CycleInfraLnd R package is to access and download data from the Transport for London Cycling Infrastructure Database into R as spatial data (Simple features).

The Cycling Infrastructure Database contains the following assets that are either lines(l) or points(p):

-   Advanced Stop Line (l)

-   Crossing (l)

-   Cycle lane/track (l)

-   Restricted Route (l)

-   Cycle Parking (p)

-   Restricted Point (p)

-   Signage (p)

-   Signal (p)

-   Traffic Calming (p)

More information on the CID can be found [here](https://data.london.gov.uk/dataset/cycling-infrastructure-database) and in this [TFL blog](https://blog.tfl.gov.uk/2019/08/13/data-drop-cycling-infrastructure-database/).

The [Database Schema](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/cid_database_schema.xlsx), [Asset Information Guide](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/asset_information_guide.pdf) and [README](https://cycling.data.tfl.gov.uk/CyclingInfrastructure/documentation/CIDASSETS_README.docx) provide important and useful information about the content of the database and how it was collected.

Installation
------------

You can install the developed version of CycleInfraLnd from [Github](https://github.com/PublicHealthDataGeek/CycleInfraLnd) with:

``` r
# install.packages("devtools")
devtools::install_github("PublicHealthDataGeek/CycleInfraLnd")
```

Examples
--------

These examples show the two functions in this package that allow you to obtain either lines or points from the Cycling Infrastructure Database. The example list in the help file contains all variations of this code for each of the different asset types i.e. the different lines and points that are available in the Cycling Infrastructure Database.

``` r
library(CycleInfraLnd)

get_cid_lines(type = "advanced_stop_line")
#> Simple feature collection with 3775 features and 11 fields
#> geometry type:  LINESTRING
#> dimension:      XY
#> bbox:           xmin: -0.4837958 ymin: 51.30687 xmax: 0.2300917 ymax: 51.6707
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 3,775 x 12
#>    FEATURE_ID SVDATE     ASL_FDR ASL_FDRLFT ASL_FDCENT ASL_FDRIGH ASL_SHARED
#>    <chr>      <date>     <chr>   <chr>      <chr>      <chr>      <chr>     
#>  1 RWG276569  2018-03-07 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  2 RWG276570  2018-03-09 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  3 RWG276571  2018-03-09 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  4 RWG150409  2017-09-19 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  5 RWG150410  2017-09-20 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  6 RWG150415  2017-09-21 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  7 RWG150416  2017-09-21 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  8 RWG150424  2017-09-22 FALSE   FALSE      FALSE      FALSE      FALSE     
#>  9 RWG150449  2017-09-27 FALSE   FALSE      FALSE      FALSE      FALSE     
#> 10 RWG150329  2017-09-18 TRUE    TRUE       FALSE      FALSE      FALSE     
#> # … with 3,765 more rows, and 5 more variables: ASL_COLOUR <chr>,
#> #   BOROUGH <chr>, PHOTO1_URL <chr>, PHOTO2_URL <chr>, geometry <LINESTRING
#> #   [°]>

get_cid_points(type = "signal")
#> Simple feature collection with 443 features and 10 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -0.417572 ymin: 51.37778 xmax: 0.1080144 ymax: 51.62969
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 443 x 11
#>    FEATURE_ID SVDATE     SIG_HEAD SIG_SEPARA SIG_EARLY SIG_TWOSTG SIG_GATE
#>    <chr>      <date>     <chr>    <chr>      <chr>     <chr>      <chr>   
#>  1 RWG039736  2017-08-24 TRUE     FALSE      FALSE     FALSE      FALSE   
#>  2 RWG039729  2017-07-06 TRUE     FALSE      FALSE     FALSE      FALSE   
#>  3 RWG108125  2017-06-21 TRUE     FALSE      TRUE      FALSE      FALSE   
#>  4 RWG001914  2017-05-31 TRUE     TRUE       FALSE     FALSE      FALSE   
#>  5 RWG001915  2017-05-31 TRUE     TRUE       FALSE     FALSE      FALSE   
#>  6 RWG039732  2017-08-23 TRUE     FALSE      TRUE      FALSE      FALSE   
#>  7 RWG001919  2017-05-06 TRUE     TRUE       FALSE     FALSE      FALSE   
#>  8 RWG039728  2017-05-31 TRUE     TRUE       FALSE     FALSE      FALSE   
#>  9 RWG039730  2017-07-06 TRUE     FALSE      FALSE     FALSE      FALSE   
#> 10 RWG039731  2017-07-18 TRUE     TRUE       FALSE     FALSE      FALSE   
#> # … with 433 more rows, and 4 more variables: BOROUGH <chr>, PHOTO1_URL <chr>,
#> #   PHOTO2_URL <chr>, geometry <POINT [°]>
```
