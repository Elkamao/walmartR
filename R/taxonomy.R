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
#' apikey = "xs9emg846j69q7e9fhbfxz6d"
#' taxonomy(apikey)
#'
#' @export
#' @import jsonlite
#' @import httr

taxonomy <- function(apikey){

querys <-  list(apiKey = apikey)
resps <- GET(url = "http://api.walmartlabs.com/v1/taxonomy",
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

df <- data.frame(parsed)
saveRDS(df, file = "taxonomy_output.RDS")
}
