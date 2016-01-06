print("Loading function geometricPlot")
geometricPlot = function(
	n0=1, lam=1, startTime=0, timeSteps=10, logscale=FALSE,
	xlab="time (years)", ylab="I should label my axes!", plotType="b"
){
	forward <- 0:timeSteps
	t <- startTime + forward
	n <- n0*lam^forward
	log = ifelse(logscale, "y", "")

	par(cex=1.6)
	plot(t, n,
		xlab=xlab, ylab=ylab, type=plotType, log=log
	)
}

print("Loading function exponentialPlot")
exponentialPlot = function(
	n0=1, r=1, startTime=0, runTime=10, timeSteps=100,
	logscale=FALSE, xlab="time (days)", ylab="Bacteria"
){
	elapsedTime <- runTime*(0:timeSteps)/timeSteps
	t <- startTime + elapsedTime
	n <- n0*exp(r*elapsedTime)
	log = ifelse(logscale, "y", "")

	par(cex=1.6)
	plot(t, n,
		xlab=xlab, ylab=ylab, type="l", log=log
	)
}

stochGen <- function(n0=1, lam=1, startTime=0, timeSteps=10, logscale=FALSE
	, xlab="time (years)", ylab="Label your axes!", plotType="b"
	, numSims=0
){
	forward <- 0:timeSteps
	t <- startTime + forward
	n <- n0*lam^forward
	log = ifelse(logscale, "y", "")

	par(cex=1.6)
	plot(t, n,
		xlab=xlab, ylab=ylab, type=plotType, log=log
	)

	if (numSims>0){
		for (sim in 1:numSims){
			n <- n0
			for (c in 1:timeSteps){
				n[c+1] <- rpois(1, lam*n[c])
			}
			lines(t, n, col="blue")
		}
	}
}
