charPlot <- function(tmax, Tc, N0=1, cpoints=NULL
	, numPoints=101, ccol="blue", cch=20
	, xlab="time", ylab="Pop", main=""){

	time <- seq(0, tmax, length.out=numPoints)
	N <- N0*exp(time/Tc)
	plot(time, N , type = "l"
		, xlab=xlab, ylab=ylab, main=main
	)
	for (c in cpoints){
		x <- c(c, c, c-Tc, c)
		y <- c(0, N0*exp(c/Tc), 0, 0)
		lines(x, y, col="blue")
		if (!is.null(cch)) points(x[[2]], y[[2]], col="blue", pch=20)
	}
}

