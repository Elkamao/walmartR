#' @title Search for Product on Walmart.com
#'
#' @description This function allows text search on the Walmart.com catalogue and returns matching items available for sale online.

#' @param apikey Your API access key authorized by Walmart API (Required)
#' @param query  Search text - whitespace separated sequence of keywords to search for (Required)
#' @param categoryID Category id of the category for search within a category. This should match the id field from Taxonomy API (see function taxonomy{walmartR}) (Optional)
#' @param start Starting point of the results within the matching set of items - upto 10 items will be returned starting from this item (Optional)
#' @param sort Sorting criteria, allowed sort types are [relevance, price, title, bestseller, customerRating, new]. Default sort is by relevance (Optional)
#' @param order Sort ordering criteria, allowed values are [asc, desc]. This parameter is needed only for the sort types [price, title, customerRating].(Optional)
#' @param numItems Number of matching items to be returned, max value 25. Default is 10 (Optional)
#' @param facet Boolean flag to enable facets. Default value is off. Set this to on to enable facets  (Optional)
#' @param facet_filter Filter on the facet attribute values. This parameter can be set to <facet-name>:<facet-value> (without the angles). Here facet-name and facet-value can be any valid facet picked from the search API response when facets are on (Optional)
#' @param facet_range Range filter for facets which take range values, like price. See usage above in the examples (Optional)
#'
#' @return Returns an RDS file named "item_search_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Search_API
#'
#' @examples
#' item_search("apikey", query = "tv", facet = "on", facet_filter = "brand:Samsung")
#'
#' @export
#' @import jsonlite
#' @import httr
#'
item_search <- function(apikey, query, categoryID = NULL, start = NULL, sort = NULL, order = NULL,
                        numItems = 10, facet = NULL, facet_filter = NULL,
                        facet_range = NULL){

  querys <-  list(query = query,
                  categoryID = categoryID,
                  start = start,
                  sort = sort,
                  order = order,
                  numItems = numItems,
                  apiKey = apikey,
                  facet = facet,
                  facet.filter = facet_filter,
                  facet.range = facet_range)
  resps <- GET(url = "http://api.walmartlabs.com/v1/search",
               query = querys)
  if (http_type(resps) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(content(resps, "text"))


  if (status_code(resps) != 200) {
    stop(
      sprintf(
        "Walmart Open API request failed",
        status_code(resps),
        parsed$status
      ),
      call. = FALSE
    )
  }

  df <- data.frame(parsed$item)
  saveRDS(df, file = "item_search_output.RDS")
}
