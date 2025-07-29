## ----label = "setup", include = FALSE-----------------------------------------
knitr::opts_chunk$set(collapse = TRUE)

## ----label = "namespace", eval = TRUE, results = "hide"-----------------------
library(REDCapExporter)
avs_raw_core      # object returned from export_core(format = "csv")
avs_raw_metadata  # object returned from export_content(content = "metadata", format = "csv")
avs_raw_record    # object returned from export_content(content = "record", format = "csv")

## ----echo = TRUE, results = "markup"------------------------------------------
avs_metadata_DF <- as.data.frame(avs_raw_metadata)
avs_record_DF   <- as.data.frame(avs_raw_record)

## ----echo = TRUE, results = "markup"------------------------------------------
avs_core_DFs  <- lapply(avs_raw_core, as.data.frame)

## ----echo = TRUE, results = 'markup'------------------------------------------
avs_metadata_DF |> sapply(class) |> sapply(is.character) |> all()
avs_record_DF   |> sapply(class) |> sapply(is.character) |> all()

## ----echo = TRUE, results = "markup"------------------------------------------
avsDF <- format_record(avs_raw_core)
str(avsDF, max.level = 0)

## ----echo = TRUE, result = "markup"-------------------------------------------
identical(
  format_record(avs_raw_core),
  format_record(avs_raw_record, avs_raw_metadata)
)

## ----echo = FALSE, results = "asis"-------------------------------------------
avsDF |>
  kableExtra::kbl(format = "html", row.names = FALSE) |>
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover"),
                            fixed_thead = TRUE) |>
  kableExtra::scroll_box(height = "200px", width = "700px")

## ----echo = TRUE, results = "markup"------------------------------------------
cols <- c("record_id", "uniform_number", "height", "points")
head(avsDF[, cols], n = 3)
sapply(avsDF[, cols], class)

## ----echo = TRUE, results = "hide"--------------------------------------------
avs_metadata_DF[avs_metadata_DF$field_name %in% cols, ]

## ----echo = FALSE, results = "asis"-------------------------------------------
avs_metadata_DF[avs_metadata_DF$field_name %in% cols, ] |>
  kableExtra::kbl(format = "html", row.names = FALSE) |>
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover"),
                            fixed_thead = TRUE) |>
  kableExtra::scroll_box(height = "200px", width = "700px")

## ----label = "date_metadata", echo = FALSE, results = "asis"------------------
avs_metadata_DF[
  avs_metadata_DF$field_name %in% c('birthdate', 'first_nhl_game', 'last_nhl_game'),
  c("field_name", "field_type", "field_label", "field_note", "text_validation_type_or_show_slider_number")
  ] |>
  kableExtra::kbl(format = "html", row.names = FALSE) |>
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover"),
                            fixed_thead = TRUE) |>
  kableExtra::scroll_box(height = "200px", width = "700px")

## -----------------------------------------------------------------------------
identical(col_type(avs_raw_metadata), col_type(avs_metadata_DF))
ct <- col_type(avs_metadata_DF)

## -----------------------------------------------------------------------------
ct[["record_id"]]

## ----echo = TRUE, results = "markup"------------------------------------------
ct[["record_id"]] |> str()
ct[["record_id"]] <- expression(as.integer(record_id))
avsDF2 <- format_record(avs_raw_core, col_type = ct)

## ----echo = TRUE, results = "markup"------------------------------------------
class(avsDF$record_id)
class(avsDF2$record_id)

## ----echo = TRUE, results = "hide"--------------------------------------------
suppressMessages(format_record(avs_raw_core, col_type = ct))

## ----echo = TRUE, results = "hide"--------------------------------------------
format_record(avs_record_DF, col_type = ct)

## -----------------------------------------------------------------------------
class(avsDF$position)
summary(avsDF$position)

## ----echo = TRUE, results = "markup"------------------------------------------
ct <- col_type(avs_raw_metadata, factors = FALSE)
avsDF2 <- format_record(avs_raw_record, col_type = ct)
class(avsDF2$position)
summary(avsDF2$position)
table(avsDF2$position)

## ----echo = TRUE, eval = FALSE------------------------------------------------
# ?col_type

