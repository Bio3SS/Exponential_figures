time <- seq(0, 20, length.out=101)
Tc <- -6
N0 <- 100

N <- exp(time/Tc)

par (cex=1.5)

LineFun <- function(t, Tc){
	x <- c(t, t-Tc)
	y <- c(exp(t/Tc), 0)
	lines(x, y, col="blue")
}

plot(time, N
	, type = "l"
)

LineFun(4, Tc)
LineFun(8, Tc)
LineFun(12, Tc)
LineFun(16, Tc)
