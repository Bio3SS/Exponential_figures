# source("http://lalashan.mcmaster.ca/3SS/bd.R")
require(deSolve)
print(args(bd))

par(cex=1.5)

top <- 10000
tscale <- 2
popscale <- 10

bd(tlab="Days"
	, N0=1, b0=1.5, d0=1
	, title = "N0=1 indiv, r=0.5/day"
	, reportPcTotal="n", showLog=FALSE, growMax=top
	, MaxTime=20
)

bd(tlab="Days"
	, N0=1, b0=2, d0=1
	, title = "N0=1 indiv, r=1/day"
	, reportPcTotal="n", showLog=FALSE, growMax=top
	, MaxTime=20
)

bd(tlab="Days"
	, N0=1, b0=2, d0=1
	, title = "N0=1 indiv, r=1/day"
	, reportPcTotal="n", showLog=FALSE, growMax=top
	, MaxTime=20/tscale
)

bd(tlab="Days"
	, N0=20, b0=1.5, d0=1
	, title = "N0=20 indiv, r=0.5/day"
	, reportPcTotal="n", showLog=FALSE, growMax=top
	, MaxTime=20
)

bd(tlab="Days"
	, N0=20, b0=1.5, d0=1
	, title = "N0=20 indiv, r=0.5/day"
	, reportPcTotal="n", showLog=FALSE, growMax=20*top
	, MaxTime=20
)
