#' @title Walmart.com Category Taxonomy
#'
#' @description This function exposes the category taxonomy used by walmart.com to categorize items.
#'
#' @param apikey Your API access key authorized by Walmart API (Required)
#'
#' @return Returns an RDS file named "taxonomy_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Taxonomy_API
#'
#' @examples
#' apikey = "YOUR API KEY"
#' taxonomy(apikey = "YOUR API KEY")
#'
#' @export
#' @import jsonlite
#' @import httr

taxonomy <- function(apikey = NULL){

querys <-  list(apiKey = apikey)
resps <- GET(url = "http://api.walmartlabs.com/v1/taxonomy",
             query = querys)

if (status_code(resps) == 200) {
  parsed <- jsonlite::fromJSON(content(resps, "text"))
  df <- data.frame(parsed)
  saveRDS(df, file = "taxonomy_output.RDS")}
else {
  warning("Walmart Open API request failed")
}

}
