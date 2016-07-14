geometricPlot(lam=2, ylab="Dandelions")
geometricPlot(lam=2, ylab="Dandelions", logscale=TRUE)

geometricPlot(lam=1/2, n0=100, ylab="Dandelions")
geometricPlot(lam=1/2, n0=100, ylab="Dandelions", logscale=TRUE)

set.seed(1819)
stochGen(startTime=0
	, xlab="Year", ylab="Dandelions", lam=2
	, timeSteps=4
	, logscale=FALSE
	, numSims=1
)
stochGen(startTime=0
	, xlab="Year", ylab="Dandelions", lam=2
	, timeSteps=4
	, logscale=FALSE
	, numSims=5
)
