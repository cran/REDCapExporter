## ----label = "setup", include = FALSE-----------------------------------------
# By default, chunks will not be evaluated.  This way the API token will not be
# required to build this vignette.
knitr::opts_chunk$set(collapse = TRUE, eval = FALSE)

## ----label = "namespace", eval = TRUE-----------------------------------------
library(REDCapExporter)

## ----eval = FALSE-------------------------------------------------------------
#  vignette(topic = "export", package = "REDCapExporter")

## -----------------------------------------------------------------------------
#  Sys.setenv(REDCap_API_URI = "https://redcap.ucdenver.edu/api/")

## -----------------------------------------------------------------------------
#  Sys.getenv("REDCap_API_format")

## -----------------------------------------------------------------------------
#  Sys.setenv(REDCap_API_TOKEN = "YOURTOKENHERE")

## -----------------------------------------------------------------------------
#  Sys.setenv(REDCap_API_TOKEN = getPass::getPass())

## -----------------------------------------------------------------------------
#  Sys.setenv(USER_KEY = "~/.ssh/vaults")  # ~/.ssh/id_rsa has a passphrase, ~/.ssh/vaults does not.
#  Sys.setenv(REDCap_API_TOKEN = secret::get_secret("2000_2001_Avalanche"))

## ----label = "REDCap_API_sysvar"----------------------------------------------
#  Sys.setenv(REDCap_API_TOKEN = secret::get_secret("2000_2001_Avalanche"))

## -----------------------------------------------------------------------------
#  REDCapExporter_keyring_check()
#  REDCapExporter_add_api_token("Project1")
#  REDCapExporter_add_api_token("Project2")
#  Sys.setenv(REDCap_API_TOKEN = REDCapExporter_get_api_token("Project1"))

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

