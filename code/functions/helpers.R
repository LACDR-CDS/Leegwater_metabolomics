# Functions that are used in multiple scripts

# Change write_csv so that it always writes NA as "".
print("Sourcing an adapted version of write_csv")
write_csv <- function(data, file, ...) {
  print(stringr::str_glue("Saving to: {file}"))
  readr::write_csv(data, file, na = "", ...)
}

print("Sourcing get_datestamp")
get_datestamp <- function(verbose = TRUE) {
  datestamp <- stringr::str_remove_all(Sys.Date(), "-")

  if (verbose) {
    print(stringr::str_glue("Datestamp is {datestamp}"))
  }
  return(datestamp)
}

print("Sourcing set_output_dir")
set_output_dir <- function(file_path, verbose = TRUE) {
  if (!dir.exists(file_path)) {
    if (verbose) {
      print(stringr::str_glue("Output directory created. Path is {file_path}"))
    }
    dir.create(file_path)
  } else {
    if (verbose) {
      print(stringr::str_glue("Output directory already exists. Path is: {file_path}"))
    }
  }
  return(file_path)
}
