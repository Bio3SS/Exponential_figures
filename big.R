# source("http://lalashan.mcmaster.ca/3SS/bd.R")
require(deSolve)

bd(N0=10, tlab="Days", b0=2, d0=1, MaxTime=10)
