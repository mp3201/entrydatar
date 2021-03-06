In this vignette we provide examples of how to use entrydatar to download precise files from the QCEW.
In the second part we give rudimentary documentations of the feature that are of principal interest to work with the data.

Downloading data from the QCEW
------------------------------

To get read to download data, we load some libraries that the package might have forgotten to call (the package works with all tables in a `data.table` format)

``` r
library(data.table, bit64)
library(entrydatar)
```

For example if we are interested in downloading aggregate level data we use the cut `10`:

``` r
dt_agg <- get_files_cut(       
  data_cut = 10,     
  year_start = 1990, year_end =1993,    
  path_data = "~/Downloads/", write = F)
dt_agg
```

Note that the dataset can be large. Downloading most of the industry 3 and 4 digits cuts across counties and MSAs ends up with 57mn rows. Saving it in `.rds` formats takes around 2gb of memory.

On the other hand for something more precise, say nationally by size cuts at the 6 digits industry level we would call the cut `28`:

``` r
dt_naics <- get_files_cut(        
  data_cut = 28,       
  industry = "naics",      
  year_start = 1990, year_end = 2015,       
  path_data = "~/Downloads/", write = F)
dt_naics
```

The BLS provides quarterly as well as annual averages, which are lighter. There is now an option to download directly the annual average using a frequency option. The default is quarterly, so everything should be backward compatible.

``` r
dt_naics <- get_files_cut(     
  data_cut = 28,     
  industry = "naics",     
  year_start = 1990, year_end = 2015,    
  path_data = "~/Downloads/", write = F)
dt_naics
```

The data is still raw from the BLS download. We can clean the data in two ways: a monthly dataset with employment by categories and a quarterly dataset with only number of firms. Finally we allow an option for aggregating both types. Note this function works only for the quarterly version of the data.

``` r
dt_naics <- entrydatar::tidy_qcew(dt_naics,
                                  frequency = "month")
dt_naics
```

### Backup: what if the BLS has changed my data!

I included an option to specify a snapshot of the data take through the url wayback machine: thanks To [Gabriel Chodorow-Reich](http://scholar.harvard.edu/chodorow-reich) for suggesting the idea.<sup>[1](#fn1)</sup> Specify a suffix found from the internet wayback machine on the BLS website and add it as an argument in the download function:

``` r
# Enter the address directly from the html address
wayback_suffix <- "https://web.archive.org/web/20141101135821"  # suffix for November 1st, 2014
# Or enter the exact date at which date it has been crawled:
wayback_suffix <- 20141101135821  

# execute adding the wayback option
dt_naics <- get_files_cut(
  data_cut = 28,
  industry = "naics",
  year_start = 1990,  year_end = 2015,       # try not to ask for data from the future        
  url_wayback = wayback_suffix,
  path_data = "~/Downloads/", write = F)
dt_naics
```

Documentation on the data
-------------------------

For example the table of cuts looks as the following for **naics** based industries is as follows:

    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    |                           | Geographic/Size LevelCode Format | National | National by size | CSA | MSA | Statewide | Statewide, by size | County | MicroSA |
    |---------------------------|----------------------------------|----------|------------------|-----|-----|-----------|--------------------|--------|---------|
    | Industry Ownership Level  |                                  | 1x       | 2x               | 3x  | 4x  | 5x        | 6x                 | 7x     | 8x      |
    |                           |                                  |          |                  |     |     |           |                    |        |         |
    | Total, All Ownerships     | x0                               | 10       | -                | 30  | 40  | 50        | -                  | 70     | 80      |
    | Total, by Ownership       | x1                               | 11       | 21               | -   | 41  | 51        | 61                 | 71     | -       |
    | Domain, by Ownership      | x2                               | 12       | 22               | -   | 42  | 52        | 62                 | 72     | -       |
    | SuperSector, by Ownership | x3                               | 13       | 23               | -   | 43  | 53        | 63                 | 73     | -       |
    | Sector, by Ownership      | x4                               | 14       | 24               | -   | 44  | 54        | 64                 | 74     | -       |
    | 3-digit, by Ownership     | x5                               | 15       | 25               | -   | 45  | 55        | -                  | 75     | -       |
    | 4-digit, by Ownership     | x6                               | 16       | 26               | -   | 46  | 56        | -                  | 76     | -       |
    | 5-digit, by Ownership     | x7                               | 17       | 27               | -   | 47  | 57        | -                  | 77     | -       |
    | 6-digit, by Ownership     | x8                               | 18       | 28               | -   | 48  | 58        | -                  | 78     | -       |
    --------------------------------------------------------------------------------------------------------------------------------------------------------------

Some documentation on the dataset
---------------------------------

The table of contents to download directly datasets

The data file layout for a general view of what is available:

-   For [table of contents](https://www.bls.gov/cew/datatoc.htm)
-   For [quarterly naics](http://www.bls.gov/cew/doc/layouts/csv_quarterly_layout.htm) and [annual naics](https://data.bls.gov/cew/doc/layouts/csv_annual_layout.htm)
-   For [quarterly sic](http://www.bls.gov/cew/doc/layouts/sic_csv_quarterly_layout.htm) and [annual sic](https://data.bls.gov/cew/doc/layouts/sic_csv_annual_layout.htm)

### Data codes

#### Aggregation levels

-   Aggregation levels and files that contain them are defined by the BLS; we reproduce the table in the package for merging or easier access:
-   **naics** [table](../data_raw/naics_agglevel.csv); original [BLS webpage](http://www.bls.gov/cew/doc/titles/agglevel/agglevel_titles.htm)
-   **sic** [table](../data_raw/sic_agglevel.csv); original [BLS webpage](http://www.bls.gov/cew/doc/titles/agglevel/sic_agglevel_titles.htm)
-   Note that there is no disaggregated data for size X industry before 1990 in the case of **naics**. The layout of files on the [download page](http://www.bls.gov/cew/datatoc.htm) is somewhat misleading.

#### Size Classes

-   For [naics](http://www.bls.gov/cew/doc/titles/size/size_titles.htm)
-   For [sic](http://www.bls.gov/cew/doc/titles/size/sic_size_titles.htm)

#### Industries

Industry titles are standard in that case

-   **naics** [table](../data_raw/naics_industry_titles.csv); original [BLS webage](http://www.bls.gov/cew/doc/titles/industry/industry_titles.htm)
-   **sic** [table](../data_raw/sic_industry_titles.csv); original [BLS webpage](http://www.bls.gov/cew/doc/titles/industry/sic_industry_titles.htm)

#### Ownership

Ownership codes go from 0 to 6:

-   0 represents the aggregate or `Total Covered`
-   5 represents the `Private` sector
-   1 to 4 represent different level of government: 4 for `International Government`; 3 for `Local Government`; 2 for `State Government` and 1 for `Federal Government`

Online docs lies here for [naics](http://www.bls.gov/cew/doc/titles/ownership/ownership_titles.htm) and [sic](http://www.bls.gov/cew/doc/titles/ownership/sic_ownership_titles.htm)

#### Area codes and titles (FIPS)

Structures somewhat like industry codes. 5 characters. `US000` is aggregated over the total US. Then for example `XXYYY` can be split in two parts:

-   `XX` represents the state as in Census codes (alphabetical orders): 01 is Alabama and 02 is Alaska.
-   `YYY` represents the county within the given state
-   There are exceptions to `YYY` matching to counties:
    -   If `YYY` is `000` then this represents data aggregated at the state level: 01000,
    -   `YYY` is `996` then it represents "Overseas Locations"
    -   `YYY` is `997` then it represents "Multicounty, Not Statewide"
    -   `YYY` is `998` then it represents "Out-of-State"
    -   `YYY` is `999` then it represents "Unknown Or Undefined"
-   If the first character is `C` then it represents subdivisions at the MSA level

BLS documentation is available at the following links:

-   For [naics](http://www.bls.gov/cew/doc/titles/area/area_titles.htm)
-   For [sic](http://www.bls.gov/cew/doc/titles/area/sic_area_titles.htm)

<table style="width:38%;">
<colgroup>
<col width="37%" />
</colgroup>
<tbody>
<tr class="odd">
<td><a name="fn1">1</a>: The <code>stata</code> version of this code is on Gabe's website <a href="http://scholar.harvard.edu/chodorow-reich/data-programs">here</a></td>
</tr>
</tbody>
</table>

1.  Erik Loualiche
