entrydatar
======

blsqcew downloads and aggregates flat tables of entry statistics from the Quarterly Census of Employment and Wages program. Available on the [BLS website](http://www.bls.gov/cew/home.htm)


Vignettes: 
  - You can download specific cuts of the [QCEW](vignettes/download_data.Rmd)

You can install 
  -  The current version from [github](https://github.mit.edu/erikl/entrydatar) with

	```{r}
library(devtools)
devtools::install_github(
  "erikl/entrydatar", 
  host = "github.mit.edu/api/v3", 
  auth_token = "d2c545def9a8e8d8e3bd9be1fa18a815dafa09a8")
```
