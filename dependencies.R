
# Install / Load relevant packages
if(!"pacman" %in% installed.packages()[,"Package"]) install.packages("pacman")
pacman::p_load(shiny,rvest, magrittr, stringr,DT,markdown)
#pacman::p_load(DT)

