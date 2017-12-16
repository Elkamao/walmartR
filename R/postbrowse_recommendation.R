#' @title Post Browsed Products Recommendation
#'
#' @description This function allows you to recommend products to someone based on their product viewing history and returns top 10 post browsed products for an item.
#'
#' @param apikey Your API access key authorized by Walmart API (Required)
#' @param itemId The item id associated with an item on Walmart.com. This can be generally seen in the last 8 digits of a URL string, but can also be acquired by using the product_lookup function (Required)
#'
#' @return Returns an RDS file named "postbrowse_recommendation_output.RDS".
#'
#' @references https://developer.walmartlabs.com/docs/read/Post_Browsed_Products_API
#'
#' @examples
#' apikey = "YOUR API KEY"
#' postbrowse_recommendation(apikey, "36904791")
#'
#' @export
#' @import jsonlite
#' @import httr

postbrowse_recommendation <- function(apikey = NULL, itemId){

  querys <-  list(apiKey = apikey,
                  itemId = itemId)
  resps <- GET(url = "http://api.walmartlabs.com/v1/postbrowse",
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
