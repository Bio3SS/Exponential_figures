tmax <- 200
Tc <- -50
cl <- seq(from=0, to=150, length.out=4)
main <- "Bacteriostasis"
xlab <- "Time (hr)"
ylab <- "Density (bacteria/ml)"
N0 <- 10

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
	, tl = c(1)
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
	, tl = c(1, log(2))
)


Tc <- 100
cl <- seq(from=190, to=70, length.out=4)
main <- "Bacterial growth"

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
	, tl = c(1)
)

charPlot(tmax, Tc, N0=N0, cpoints=cl[1]
	, main=main, xlab=xlab, ylab=ylab
	, tl = c(1, log(2))
)

