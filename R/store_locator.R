#' @title Store Locator
#'
#' @description This function helps locate nearest Walmart Stores via API. It lets users search for stores by latitude and longitude, by zip code and by city.
#'
#' @param apikey Your API access key authorized by Walmart API (Required)
#' @param city City name, capitalized (Optional)
#' @param lat Latitude (Optional)
#' @param lon Longitude (Optional)
#' @param zip Zip (Optional)
#'
#' @return Returns an RDS file named "store_locations_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Store_Locator_API
#'
#' @examples
#' apikey = "YOUR API KEY"
#' store_locator(apikey, city = "NEW YORK")
#'
#' @export
#' @import jsonlite
#' @import httr

store_locator <- function(apikey = NULL, city = NULL, lat = NULL, lon = NULL, zip = NULL){

  querys <-  list(apiKey = apikey,
                  city = city,
                  lat = lat,
                  lon = lon,
                  zip = zip)
  resps <- GET(url = "http://api.walmartlabs.com/v1/stores",
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

