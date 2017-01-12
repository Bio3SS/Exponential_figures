tmax <- 6
Tc <- -1
cl <- seq(from=0, to=4.5, length.out=4)
main <- "Speed"
xlab <- "Time (hr)"
ylab <- "Distance from town (km)"
N0 <- 20

charPlot(tmax, Tc, N0=N0
	, main=main, xlab=xlab, ylab=ylab
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1:2]
	, main=main, xlab=xlab, ylab=ylab
)
charPlot(tmax, Tc, N0=N0, cpoints=cl[1:4]
	, main=main, xlab=xlab, ylab=ylab
)
