time <- seq(0, 6, length.out=101)
Tc <- -1
N0 <- 100

N <- exp(time/Tc)

par (cex=1.5)

LineFun <- function(t, Tc){
	x <- c(t, t-Tc)
	y <- c(exp(t/Tc), 0)
	points(x[[1]], y[[1]], col="blue", pch=20)
	lines(x, y, col="blue")
}

plot(time, N
	, type = "l"
)

LineFun(0.5, Tc)
LineFun(1.5, Tc)
LineFun(2.5, Tc)
