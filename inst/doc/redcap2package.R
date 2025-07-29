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
fs::dir_tree(temppath)

## -----------------------------------------------------------------------------
prj_dir <- list.dirs(temppath)
prj_dir <- prj_dir[grepl("/rcd\\d+$", prj_dir)]
t(read.dcf(paste(prj_dir, "DESCRIPTION", sep = "/")))

## -----------------------------------------------------------------------------
cat(readLines(paste(prj_dir[1], "LICENSE", sep = "/")), sep = "\n")

## -----------------------------------------------------------------------------
tar_ball <- devtools::build(pkg = prj_dir)
tar_ball

install.packages(pkgs = tar_ball, lib = temppath)


## ----eval = FALSE-------------------------------------------------------------
# library(rcd14465, lib.loc = temppath)
# 

## ----include = FALSE----------------------------------------------------------
do.call(library, args = list(package = "rcd14465", character.only = TRUE, lib.loc = temppath))

## -----------------------------------------------------------------------------
data(package = "rcd14465")$results

## -----------------------------------------------------------------------------
aggregate(goals ~ position, data = record, FUN = sum)

