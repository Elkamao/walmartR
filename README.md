walmartR: Access Walmart.com via R
==================================

Overview
--------

WalmartR is an API Client for interating and getting data from the Walmart Open API. Functions including search for product with item id or keywords, price range etcs. You can also get list of best selling product on Walmart.com as well as locate sctore with city name or zip code.

Install, load the package
-------------------------

To install the latest version from Github

``` r
# install.packages('devtools')
devtools::install_github("Elkamao/walmartR")
```

    ## Downloading GitHub repo Elkamao/walmartR@master
    ## from URL https://api.github.com/repos/Elkamao/walmartR/zipball/master

    ## Installing walmartR

    ## '/Library/Frameworks/R.framework/Resources/bin/R' --no-site-file  \
    ##   --no-environ --no-save --no-restore --quiet CMD INSTALL  \
    ##   '/private/var/folders/2j/xz64c57x3331mn2dwfsvgp740000gn/T/RtmpIkQ9zw/devtools3daf256e1b43/Elkamao-walmartR-07a4a86'  \
    ##   --library='/Library/Frameworks/R.framework/Versions/3.4/Resources/library'  \
    ##   --install-tests

    ## 

Next, load the package:

``` r
library(walmartR)
```

Using the package
-----------------

To start, register an developer account on Walmart Open API (see <https://developer.walmartlabs.com/member>) and obtain an API key.

``` r
wal_key = [Your API key]
```

### Product Lookup

You can look up one item at a time.

``` r
product_lookup(wal_key, "12417832")
```

Or you can look up a list of items at the same time.

``` r
product_lookup(wal_key, "12417832,19336123")
```

### Item Search

Search for Ipod

``` r
item_search(wal_key, query ="ipod")
```

Search for Ipod within electronics and sort by increasing price

``` r
item_search(wal_key, query ="ipod", categoryId = "3944", sort = "price", order = "asc")
```

Search for TVs with facets on

``` r
item_search(wal_key, query = "tv", facet = "on")
```

You can use the facet name and any of the facet values to further narrow down the search. To search for TVs of only a particular brand, say Samsung:

``` r
item_search(wal_key, query = "tv", facet = "on", facet_filter = "brand:Samsung")
```

### Taxonomy

``` r
taxonomy(wal_key)
```

### Product Recommendation

Each item on Walmart.com has a particular item ID associated with it. This can be generally seen in the last 8 digits of a URL string, but can also be acquired by using the product\_lookup function (Required)

``` r
product_recommendation(wal_key, "36904791")
```

### Post Browsed Products Recommendation

Same item Id as used in the prouct recommendation fucntion.

``` r
postbrowse_recommendation(wal_key, "36904791")
```

### Store Locator

Nearest walmart stores for latitude 29.735577 and longitude -95.511747

``` r
store_locator(wal_key, lon="-95.511747", lat="29.735577")
```

Walmart stores in the city of New York

``` r
store_locator(wal_key, city = "NEW YORK")
```

Walmart stores in the zip 10025

``` r
store_locator(wal_key, zip = "10025")
```

### Trending

``` r
trending(wal_key)
```

The output are stored in the vignette/vignette sample output folder as RDS files.

### References

<https://developer.walmartlabs.com/docs>
