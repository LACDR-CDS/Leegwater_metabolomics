# Functions that are used in multiple scripts

# Change write_csv so that it always writes NA as "".
print("Sourcing an adapted version of write_csv")
write_csv <- function(data, file, ...) {
  print(stringr::str_glue("Saving to: {file}"))
  readr::write_csv(data, file, na = "", ...)
}

# A function to get today's datestamp
print("Sourcing get_datestamp")
get_datestamp <- function(verbose = TRUE) {
  datestamp <- stringr::str_remove_all(Sys.Date(), "-")

  if (verbose) {
    print(stringr::str_glue("Datestamp is {datestamp}"))
  }
  return(datestamp)
}

# A function that checks if my intended output directory exists
# and creates it if not.
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

# A function for finding the most recent folder with a certain datestamp
# This is relevant to define which folder to use, when an analysis
# is performed on multiple days
find_most_recent_folder <- function(subfolder_name, folder_path=here("manuscript")) {
  subfolders <- list.dirs(folder_path, recursive = FALSE, full.names = FALSE)
  
  folder_data <- tibble(folder = subfolders) |>
    separate_wider_regex(
      folder, 
      patterns = c(prefix = ".*", "_", date = "\\d{8}"),
      cols_remove = FALSE    ) |>
    filter(!is.na(date))
  
  subfolder_elements <- str_match(subfolder_name, "^.*_(\\d{8})$")
  subfolder_prefix <- str_remove(subfolder_name, "_\\d{8}$")
  subfolder_date <- subfolder_elements[2]
  
  # If there is a datestamp in folder_name, throw error if there is a more recent folder
  # If no datestamp, find and return the most recent folder
  
  newest_subfolder <- folder_data |>
    filter(prefix == subfolder_prefix) |>
    slice_max(date, n = 1) |>
    pull(folder)
  
  if (!is.na(subfolder_date)) {
    if (newest_subfolder != subfolder_name) {
      stop(str_glue("A more recent folder exists for {folder_name}, namely: {newest_subfolder}"))
    } else {
      return(file.path(folder_path, folder_name))
    }
  } else {
    return(file.path(folder_path, newest_subfolder))
  }
}