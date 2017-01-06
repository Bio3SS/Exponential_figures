x <- c(1, 10, 19, 100)

par(cex=1.4)
cplot <- function(x, log="", top=NULL){
	if (is.null(top)) top <- max(x)
	bot <- ifelse(log=="", 0, min(x))

	plot(x, 0*x
		, yaxt="n", xlab="", ylab=""
		, cex=3.0, pch=15:18
		, col=c("black", "black", "blue", "red")
		, log=log
		, xlim = c(bot, top)
	)
}

m <- max(x)
cplot(x, top=m)
cplot(x, log="x", top=m)
cplot(x[1:2], top=m)
cplot(x[1:2], log="x", top=m)

