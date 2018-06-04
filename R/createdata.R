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
# only will run if it is true --> contents are never going to be run because of if FALSE
# we want to only run the code once --> manually execute once from planets (line 2)

  # Convert from km to AU.
  #
  planets <- transform(planets, distance = distance * 1e6 / 1.496e8)

  # This will create the .rda file in the data/ folder.
  #
  devtools::use_data(planets, overwrite = TRUE)
}
