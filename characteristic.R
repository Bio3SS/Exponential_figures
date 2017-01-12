charPlot <- function(tmax, Tc, N0=1, cpoints=NULL
	, numPoints=101, ccol="blue", cch=20
	, xlab="time", ylab="Pop", main=""
	, tlines = NULL){

	time <- seq(0, tmax, length.out=numPoints)
	N <- N0*exp(time/Tc)
	plot(time, N , type = "l"
		, xlab=xlab, ylab=ylab, main=main
		, ylim = c(0, max(N))
	)
	for (c in cpoints){
		x <- c(c, c, c-Tc, c)
		y <- c(0, N0*exp(c/Tc), 0, 0)
		lines(x, y, col="blue")
		if (!is.null(cch)) points(x[[2]], y[[2]], col="blue", pch=20)
		for (tl in tlines){
			xl <- c-Tc*tl
			yl <- N0*exp(xl/Tc)
			lines(x=c(xl, xl), y=c(0, yl), lty=2)
		}
	}
}

