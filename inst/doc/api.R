## ----label = "setup", include = FALSE-----------------------------------------
# By default, chunks will not be evaluated.  This way the API token will not be
# required to build this vignette.
knitr::opts_chunk$set(collapse = TRUE, eval = FALSE)
library("REDCapExporter")

## ----eval = FALSE-------------------------------------------------------------
#  vignette(topic = "export2package", package = "REDCapExporter")

## ----label = "REDCap_sysvar"--------------------------------------------------
#  Sys.setenv(REDCap_API_URI = "https://redcap.ucdenver.edu/api/")
#  Sys.setenv(REDCap_API_TOKEN = secret::get_secret("2000_2001_Avalanche"))

## -----------------------------------------------------------------------------
#  Sys.getenv("REDCap_API_format")

## ----label = "namespace", eval = TRUE-----------------------------------------
library(REDCapExporter)

## ----label = "args_of_export_content", eval = TRUE----------------------------
args(export_content)

## -----------------------------------------------------------------------------
#  avs_raw_metadata <- export_content(content = "metadata")

## ----label = "example_raw_metadata", eval = TRUE------------------------------
ls()
data(avs_raw_metadata)
ls()
str(avs_raw_metadata)

## ----label = "as_data_frame", eval = TRUE-------------------------------------
avs_metadata <- as.data.frame(avs_raw_metadata)
str(avs_metadata)

## ----eval = TRUE--------------------------------------------------------------
data(avs_raw_core)
lapply(avs_raw_core, class)

## -----------------------------------------------------------------------------
#  print(sessionInfo(), local = FALSE)

