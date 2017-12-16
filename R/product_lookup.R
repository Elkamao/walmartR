#' @title Lookup product information on Walmart
#'
#' @description This function gives access to item price and availability in real-time. Item id needs to be specified for doing a lookup.

#' @param apikey Your API access key authorized by Walmart API (Required)
#' @param ids Comma separated list of item ids (Re)
#'
#' @return Returns an RDS file named "product_lookup_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Home
#'
#' @examples
#' apikey = "YOUR API KEY"
#' product_lookup(apikey, "12417832")
#' product_lookup(apikey, "12417832,19336123")
#'
#' @export
#' @import jsonlite
#' @import httr


#Product Lookup
product_lookup <- function(apikey = NULL, ids){

  querys <-  list(ids = ids,
                  apiKey = apikey)
  resps <- GET(url = "http://api.walmartlabs.com/v1/items",
               query = querys)

  if (status_code(resps) == 200) {
    parsed <- jsonlite::fromJSON(content(resps, "text"))
    df <- data.frame(parsed)
    saveRDS(df, file = "store_locations_output.RDS")
  }
  else{
    warning("Walmart Open API request failed")
  }

}
