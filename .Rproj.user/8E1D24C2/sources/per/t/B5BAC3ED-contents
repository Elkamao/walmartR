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
#' trending("xs9emg846j69q7e9fhbfxz6d")
#'
#' @export
#' @import jsonlite
#' @import httr

trending <- function(apikey){

  querys <-  list(apiKey = apikey)
  resps <- GET(url = "http://api.walmartlabs.com/v1/trends",
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
  saveRDS(df, file = "tredning_output.RDS")
}
