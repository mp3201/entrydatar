Downloads data from the Census BDS [website](https://www.census.gov/ces/dataproducts/bds/). The two main data resources are the [firm characteristics tables](https://www.census.gov/ces/dataproducts/bds/data_firm.html) and the [establishment characteristics tables](https://www.census.gov/ces/dataproducts/bds/data_estab.html) Codebook is available [here](https://www.census.gov/ces/pdf/BDS_2014_Codebook.pdf)

For example to start and get the BED industry data:

``` r
library(entrydatar)
dt_firm  <- get_bds_cut(1977, 2014, "firm", "agesic")
dt_firm[]
dt_estab <- get_bds_cut(1977, 2014, "establishment", "agesic")
dt_estab[]
```

Detailed documentation
----------------------

### Detail of the data cuts

#### By firm characteristics

1.  National

-   Economy Wide [`all`](http://www2.census.gov/ces/bds/firm/bds_f_all_release.csv)
-   Sector [`sic`](http://www2.census.gov/ces/bds/firm/bds_f_sic_release.csv)
-   Firm Size [`sz`](http://www2.census.gov/ces/bds/firm/bds_f_sz_release.csv)
-   Initial Firm Size [`isz`](http://www2.census.gov/ces/bds/firm/bds_f_isz_release.csv)
-   Firm Age [`age`](http://www2.census.gov/ces/bds/firm/bds_f_age_release.csv)

1.  Geography

-   State [`st`](http://www2.census.gov/ces/bds/firm/bds_f_st_release.csv)
-   Metro [`metrononmetro`](http://www2.census.gov/ces/bds/firm/bds_f_metrononmetro_release.csv)
-   MSA [`msa`](http://www2.census.gov/ces/bds/firm/bds_f_msa_release.csv)

1.  Age by ...

-   Age x Size [`agesz`](http://www2.census.gov/ces/bds/firm/bds_f_agesz_release.csv)
-   Age x Initial Size [`ageisz`](http://www2.census.gov/ces/bds/firm/bds_f_ageisz_release.csv)
-   Age x Sector [`agesic`](http://www2.census.gov/ces/bds/firm/bds_f_agesic_release.csv)
-   Age x Metro [`agemetrononmetro`](http://www2.census.gov/ces/bds/firm/bds_f_agemetrononmetro_release.csv)

1.  Size by ...

2.  Initial size by ...

3.  Age x X x Y

------------------------------------------------------------------------

1.  Erik Loualiche
