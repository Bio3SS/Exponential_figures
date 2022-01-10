# Doesn't hurt the make project, helps people who are sourcing
require(deSolve)

# Device ask should be true if device is interactive
options(device.ask.default=grDevices::dev.interactive(orNone = TRUE))
respPlot <- function(pop, b, d, lpos, ylab, plab="Population size", title, logscale=FALSE, legendSize=1, fontSize=1){
	ymin = ifelse(logscale, min(c(b, d)), 0)
	ymax = max(c(b,min(d)))
	logPar <- ifelse(logscale, "y", "")

	plot(pop, b,
		cex.axis = fontSize, cex.lab=fontSize,
		ylim = c(ymin, ymax),
		xlab = plab,
		ylab = ylab,
		type = "l", lwd=2, col="blue", main=title, log=logPar
	)
	lines(pop, d, lty=2, lwd=2)
	legend(lpos, cex=legendSize,
		legend = c("Birth rate", "Death rate"),
		col = c("blue", "black"),
		lty = c(1, 2)
	)
}

bdplots = function(pop, b, d, reportTotal=FALSE, title="Birth-death plot", fontSize, legendSize, plab){
	ylab <- "Per capita rate (1/t)"
	lpos <- "topright"

	if(reportTotal) {
		ylab <- "Total rate (pop/t)"
		lpos <- "bottomright"
		b <- b*pop
		d <- d*pop
	}

	par(cex=1.6)
	respPlot(pop, b, d, lpos, ylab, title, fontSize=fontSize,
	legendSize=legendSize, plab=plab)
}

## divOffset is some sort of adjustment only applied for Allee 
rfun <- function(r0, DD, Allee, pop, birth=TRUE, divOffset=1/2, mmax=1000){
	mult <- 1 + 0*pop
	if (!is.null(DD)) mult <- mult*exp(pop/DD)
	if (!is.null(Allee))
		mult <- mult*exp((Allee+divOffset)/(pop+divOffset))
	mult <- mmax*mult/(mmax+mult)
	if (birth) {mult <- 1/mult}
	return(r0*mult)
}

ndot = function(time, vars, parms){
	ndot <- with(as.list(c(vars, parms)),
		rfun(b0, bDD, bAllee, exp(n), TRUE) 
			- rfun(d0, dDD, dAllee, exp(n), FALSE) 
	)
	list(c(ndot))
}

popSim = function (N0, MaxTime, steps, parms){
	sim <- as.data.frame(lsoda(
		y = c(n=log(N0)),
		times = (0:steps)*MaxTime/steps,
		func = ndot,
		parms
	))
	sim$N <- exp(sim$n)
	return(sim)
}

bd <- function(N0=NULL, MaxTime=20, steps=100, popMax=100, b0=1, bDD=NULL, bAllee=NULL, d0=0.5, dDD=NULL, dAllee=NULL, reportPcTotal="b", popSteps=100, fontSize=1, legendSize=1, title="", tlab = "Time (years)", plab="Population size", showLog=TRUE, growMax=NULL){
	pop <- 1:popSteps*(popMax/popSteps)

	b <- rfun(b0, bDD, bAllee, pop, TRUE)
	d <- rfun(d0, dDD, dAllee, pop, FALSE)

	if (reportPcTotal == "p" | reportPcTotal == "b")
		bdplots(pop, b, d, reportTotal=FALSE, title, fontSize=fontSize, 
			legendSize=legendSize, plab=plab)

	if (reportPcTotal == "t" | reportPcTotal == "b")
		bdplots(pop, b, d, reportTotal=TRUE, title, fontSize=fontSize, 
			legendSize=legendSize, plab=plab)

	if(!is.null(N0)){
		sim <- bdsim(N0, MaxTime, steps, b0, bDD, bAllee, d0, dDD, dAllee)
		if(is.null(growMax)) growMax <- max(sim$N)
		# print(data.frame(sim$time, sim$N))
		plot(sim$time, sim$N,
			cex.lab=fontSize, cex.axis=fontSize,
			main=title, xlab = tlab, ylab = "Population",
			type = "l", ylim = c(0, growMax)
		)
		if (showLog){
			plot(sim$time, sim$N,
				cex.lab=fontSize, cex.axis=fontSize,
				main=title, xlab = tlab, ylab = "Population",
				type = "l", ylim = c(1, growMax), log="y"
			)
		}
	}

	# return(data.frame(pop, b, d))
}

bdsim <- function(N0=1, MaxTime=20, steps=100, b0=1, bDD=NULL, bAllee=NULL, d0=0.5, dDD=NULL, dAllee=NULL){

	parms = list(b0=b0, bDD=bDD, bAllee=bAllee, d0=d0, dDD=dDD, dAllee=dAllee)
	return(popSim(N0, MaxTime, steps, parms))
}

args(bd)


