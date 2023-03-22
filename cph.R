geometricPlot(lam=2, ylab="New cases")
geometricPlot(lam=2, ylab="New cases", logscale=TRUE)

geometricPlot(lam=1/2, n0=100, ylab="New cases")
geometricPlot(lam=1/2, n0=100, ylab="New cases", logscale=TRUE)

set.seed(1819)
stochGen(startTime=0
	, xlab="Week", ylab="New cases", lam=2
	, timeSteps=4
	, logscale=FALSE
	, numSims=1
)
stochGen(startTime=0
	, xlab="Week", ylab="New cases", lam=2
	, timeSteps=4
	, logscale=FALSE
	, numSims=5
)

