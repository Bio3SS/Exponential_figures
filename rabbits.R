FibSeries = function(n){
	f <- c(1, 1)
	if (n>2){
		for (i in 3:n){
			f[i] <- f[i-2]+f[i-1]
		}
	}
	f
}

rabbit_plot = function(months=12, log=""){
	par(cex=1.6)
	plot(1:months, FibSeries(months),
		xlab = "Months", ylab = "Pairs of rabbits", type="b",
		log=log
	)
}

pdf("rabbits.pdf")
rabbit_plot()

pdf("log_rabbits.pdf")
rabbit_plot(log="y")
