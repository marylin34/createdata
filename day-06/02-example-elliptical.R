# =====================================================================================================================
# = Creating a Package                                                                                                =
# =                                                                                                                   =
# = Author: Andrew B. Collier <andrew@exegetic.biz> | @datawookie                                                     =
# =====================================================================================================================

# If you get lost you can
#
# - check out the notes for this module or
# - look at the ultimate package reference, http://r-pkgs.had.co.nz/.

# CONFIGURATION -------------------------------------------------------------------------------------------------------

# LIBRARIES -----------------------------------------------------------------------------------------------------------

devtools::document()

# CREATE NEW PROJECT --------------------------------------------------------------------------------------------------

# 1. Create a new project: File -> New Project -> New Directory -> R Package.
# 2. Choose an appropriate name for the package.
# 3. Press "Create Project".

# WRITE METADATA ------------------------------------------------------------------------------------------------------

# 1. Fill in the required metadata in the DESCRIPTION file. These fields must be filled:
#
# Package: elliptical                   [Package name]
# Type: Package
# Title:                                [Short description]
# Version:                              [Release version]
# Author:                               [Who wrote it (see ?person)]
# Maintainer:                           [Who's handling issues (see ?person)]
# Description:                          [Verbose description]
# License:                              [GPL-3 (see https://opensource.org/licenses)]
# Imports:                              [Essential packages]
# Suggests:                             [Optional packages]
# LazyData: TRUE

# The Author and Maintainer fields can be replaced by a Authors@R field, which is filled with a c() of person() calls.
#
# Roles used in person:
#
#   "aut" - full authors,
#   "cre" - creator and/or package maintainer and
#   "ctb" - contributor.
#
# For example:
#
# Authors@R: c(person("Andrew", "Collier", email = "andrew@exegetic.biz", role = c("aut", "cre")),
#              person("John", "Smith", email = "john.smith@example.com", role = "ctb"))

# CREATE PACKAGE FUNCTIONS --------------------------------------------------------------------------------------------

# 1. Remove any files from the R/ and man/ folders.
# 2. Create a perimeter.R script in the R/ folder with the following contents.

#' Calculate the length of the perimeter of an ellipse.
#'
#' @param r Length of the semi-major axis.
#' @param e The eccentricity.
#' @return The length of the perimeter of the ellipse with specified semi-major axis and eccentricity.
#' @examples
#' ellipse_perimeter(1, 1)
#' ellipse_perimeter(1)
#' @export
ellipse_perimeter <- function(r, e = 0) {
  if (e < 0 || e > 1) stop("Invalid eccentricity!", call. = FALSE)
  if (e == 0) {
    2 * pi * r
  } else {
    4 * r * pracma::ellipke(e)$e
  }
}

# CREATE DOCUMENTATION ------------------------------------------------------------------------------------------------

# 1. Make sure that roxygen2 package is installed.
# 2. Run devtools::document().
# 3. Check the man/ folder to confirm that a .Rd file was created.
# 4. Open the file and look at the contents.

# If your functions have dependencies then you can include these in the documentation. For example:
#
#' @importFrom dplyr select filter
#' @import tidyr
#
# However, for code in packages, it's usually best to use the package name in the function call. For example,
# dplyr::select() rather than simply select().

# NAMESPACE -----------------------------------------------------------------------------------------------------------

# 1. Look at the contents of NAMESPACE. It should have contents from when the project was created.
# 2. Delete the NAMESPACE file.
# 3. Run devtools::document().
# 4. Check the contents of NAMESPACE.

# TESTS ---------------------------------------------------------------------------------------------------------------

# 1. Run devtools::use_testthat().
# 2. Create a test file (contents below) named test_perimeter.R in the tests/testthat/ folder.
# 3. Run the test using Build -> Test Package.

library(elliptical)

context("Perimeter")

test_that("perimeter of a circle", {
  expect_equal(ellipse_perimeter(1), 2 * pi)
})

# CREATE PACKAGE DATA -------------------------------------------------------------------------------------------------

# 1. Create a planets-create.R script in the R/ folder.
# 2. Copy the script below.
# 3. Run the *contents* of the conditional (not the whole script because then the contents won't run!).
# 4. Check that a data/ folder was created and that there is a planets.rda file in it.

if (FALSE) {
  planets <- read.table(text = "
     name distance eccentricity
1 Mercury     57.9        0.205
2   Venus    108.2        0.007
3   Earth    149.6        0.017
4    Mars    227.9        0.094
5 Jupiter    778.6        0.049
6  Saturn   1433.5        0.057
7  Uranus   2872.5        0.046
8 Neptune   4495.1        0.011
9   Pluto   5906.4        0.244
           ")
  #
  # Convert from km to AU.
  #
  planets <- transform(planets, distance = distance * 1e6 / 1.496e8)

  # This will create the .rda file in the data/ folder.
  #
  devtools::use_data(planets, overwrite = TRUE)
}

# BUILD ---------------------------------------------------------------------------------------------------------------

# 1. Build and install using Build -> Clean and Rebuild.
# 2. Start a new R session and test.

# GITHUB --------------------------------------------------------------------------------------------------------------

# 1. Create a repository for the package.
# 2. Push the code to the repository.
# 3. Test installing from the repository using devtools::install_github().
# 4. Ask somebody else to test installing from your repository.
