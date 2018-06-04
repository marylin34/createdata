# =====================================================================================================================
# = Package: Great circle paths                                                                                       =
# =                                                                                                                   =
# = Author: Andrew B. Collier <andrew@exegetic.biz> | @datawookie                                                     =
# =====================================================================================================================

# What's the distance from Cape Town to New York?
#
# Let's build a package to answer that question (and find the distance between any two locations on Earth!).

# ---------------------------------------------------------------------------------------------------------------------

# * STAGE 0
#
# Set up the infrastructure for a new package.

# * STAGE 1
#
# Implement two functions:
# 
# FUNCTION: deg2rad() - converts degrees to radians.
#
# FUNCTION: great_circle_distance() - distance between two points on the surface of a sphere.
# 
# The great_circle_distance() function should be based on the cosine rule from Spherical Trigonometry. Specifically,
# 
# cos(a) = cos(b) cos(c) + sin(b) sin(c) cos(A)
# 
# It should accept five arguments:
# 
# - lat1
# - lat2
# - lon1
# - lon2
# - scale (optional) - the radius of the sphere

# * STAGE 2
#
# Create documentation for these functions.

# * STAGE 3
#
# Create unit tests for these functions.

# * STAGE 4
#
# Create a suitable data set to include with the package.
#
# Here's one option: a set of cities with their latitudes and longitudes.

# * STAGE 5
#
# Create a suitable README.md file.
# Populate the DESCRIPTION file.

# * STAGE 6
#
# Test the package. Resolve any issues.

# * STAGE 7
#
# Publish the package on GitHub.