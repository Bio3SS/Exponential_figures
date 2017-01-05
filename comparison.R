x <- c(1, 10, 19, 100)

par(cex=1.4)
cplot <- function(x, log=""){
	plot(x, 0*x
		, yaxt="n", xlab="", ylab=""
		, cex=3.0, pch=15:18
		, col=c("black", "black", "blue", "red")
		, log=log
	)
}

cplot(x)
cplot(x, log="x")

