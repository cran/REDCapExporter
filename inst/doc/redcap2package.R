## ----label = "setup", include = FALSE-----------------------------------------
knitr::opts_chunk$set(collapse = TRUE)
library(REDCapExporter)

## -----------------------------------------------------------------------------
data(avs_raw_core, package = "REDCapExporter")
str(avs_raw_core)

## -----------------------------------------------------------------------------
temppath <- tempdir()

build_r_data_package(
  x            = avs_raw_core,
  path         = temppath,
  author_roles = list(dewittp = c("cre", "aut"))
)

## -----------------------------------------------------------------------------
list.files(temppath, recursive = TRUE, all.files = TRUE, no.. = TRUE)

## -----------------------------------------------------------------------------
prj_dir <- list.dirs(temppath)
prj_dir <- prj_dir[grepl("/rcd\\d+$", prj_dir)]
t(read.dcf(paste(prj_dir, "DESCRIPTION", sep = "/")))

## -----------------------------------------------------------------------------
cat(readLines(paste(prj_dir[1], "LICENSE", sep = "/")), sep = "\n")

## ----eval = FALSE-------------------------------------------------------------
# system2("R", c("CMD", "build", prj_dir))
# tar_ball <- list.files(
#   pattern = paste0(basename(prj_dir), "_.*[.]tar[.]gz$"),
#   full.names = TRUE
# )
# tar_ball <- tar_ball[which.max(file.info(tar_ball)$mtime)]
# tar_ball
# 
# install.packages(pkgs = tar_ball, lib = temppath)
# 

## ----eval = FALSE-------------------------------------------------------------
# library(rcd14465, lib.loc = temppath)
# 

## ----include = FALSE, eval = FALSE--------------------------------------------
# do.call(library, args = list(package = "rcd14465", character.only = TRUE, lib.loc = temppath))

## ----eval = FALSE-------------------------------------------------------------
# data(package = "rcd14465")$results

## ----eval = FALSE-------------------------------------------------------------
# aggregate(goals ~ position, data = record, FUN = sum)

