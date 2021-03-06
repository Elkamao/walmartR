% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/product_recommendation.R
\name{product_recommendation}
\alias{product_recommendation}
\title{Product Recommendation}
\usage{
product_recommendation(apikey = NULL, itemId)
}
\arguments{
\item{apikey}{Your API access key authorized by Walmart API (Required)}

\item{itemId}{The item id associated with an item on Walmart.com. This can be generally seen in the last 8 digits of a URL string, but can also be acquired by using the product_lookup function (Required)}
}
\value{
Returns an RDS file named "product_recommendation_output.RDS".
}
\description{
This prouct recommendation function is an extension driven by the science that powers the recommended products container on Walmart.com and provides the top 10 recommended products for a certain item.
}
\examples{
apikey = "YOUR API KEY"
product_recommendation(apikey, "36904791")

}
\references{
https://developer.walmartlabs.com/docs/read/Product_Recommendation_API
}
