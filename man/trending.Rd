% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trending.R
\name{trending}
\alias{trending}
\title{Selling Trend}
\usage{
trending(apikey = NULL)
}
\arguments{
\item{apikey}{Your API access key authorized by Walmart API (Required)}
}
\value{
Returns an RDS file named "tredning_output.RDS".
}
\description{
This function is designed to give the information on what is bestselling on Walmart.com right now.
}
\examples{
apikey = "YOUR API KEY"
trending(apikey)

}
\references{
https://developer.walmartlabs.com/docs/read/Trending_API
}
