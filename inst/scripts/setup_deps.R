# Setup dependencies for XentonalAssistant development
# This script installs necessary R packages if they are not already present.

required_packages <- c(
  "data.table", 
  "fractional", 
  "numbers", 
  "seewave", 
  "tuneR",
  "ellmer",
  "cli",
  "testthat",
  "devtools"
)

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("Installing ", pkg, "...")
    install.packages(pkg, repos = "https://cloud.r-project.org/")
  } else {
    message(pkg, " is already installed.")
  }
}

lapply(required_packages, install_if_missing)
