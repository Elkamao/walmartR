#' @title Selling Trend
#'
#' @description This function is designed to give the information on what is bestselling on Walmart.com right now.
#'
#' @param apikey Your API access key authorized by Walmart API (Required)
#'
#' @return Returns an RDS file named "tredning_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Trending_API
#'
#' @examples
#' apikey = "YOUR API KEY"
#' trending(apikey)
#'
#' @export
#' @import jsonlite
#' @import httr

trending <- function(apikey = NULL){

  querys <-  list(apiKey = apikey)
  resps <- GET(url = "http://api.walmartlabs.com/v1/trends",
               query = querys)

  if (status_code(resps) == 200) {
    parsed <- jsonlite::fromJSON(content(resps, "text"))
    df <- data.frame(parsed)
    saveRDS(df, file = "taxonomy_output.RDS")}
  else {
    warning("Walmart Open API request failed")
  }
}
