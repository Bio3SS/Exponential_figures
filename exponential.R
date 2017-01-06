par(cex=1.5)

start <- 0
end <- 10
xl <- "Time"
yl <- "Population"
slope <- 16
TC <- 2
TC2 <- 4

cfun <- function(f, log="") {
	do.call(curve,list(substitute(f)
		, from=start, to=end, xlab=xl, ylab=yl, log=log
	))
}

cfun((x+1)^2)

cfun(1+slope*x)

cfun(exp(x/TC), log="y")

cfun(exp((x/TC2)^2), log="y")

cfun((x+1)^2, log="y")

cfun(exp(x/TC), log="y")

