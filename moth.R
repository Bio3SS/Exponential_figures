mothGeneration <- function(repFemales, fecundity, femaleProb, hatchProb, pupateProb, ecloseProb, repProb){
	eggs <- sum(rpois(repFemales, fecundity))
	femaleEggs <- rbinom(n=1, size=eggs, prob=femaleProb)
	femaleLarvae <- rbinom(n=1, size=femaleEggs, prob=hatchProb)
	femalePupae <- rbinom(n=1, size=femaleLarvae, prob=pupateProb)
	femaleAdults <- rbinom(n=1, size=femalePupae, prob=ecloseProb)
	repFemalesNew <- rbinom(n=1, size=femaleAdults, prob=repProb)

	print(paste("There were: "
		, eggs, "eggs produced.  "
		, femaleEggs, "female eggs.  "
		, femaleLarvae, "female larvae.  "
		, femalePupae, "female pupae.  "
		, femaleAdults, "emergent females.  "
		, repFemalesNew, "reproductive females.  "
	))
}

set.seed(202)
mothGeneration(repFemales=10
	, fecundity=600
	, femaleProb=0.5
	, hatchProb=0.1
	, pupateProb=0.1
	, ecloseProb=0.5
	, repProb=0.5
)

mothGeneration(repFemales=10
	, fecundity=600
	, femaleProb=0.5
	, hatchProb=0.1
	, pupateProb=0.1
	, ecloseProb=0.5
	, repProb=0.5
)

mothGeneration(repFemales=10
	, fecundity=600
	, femaleProb=0.5
	, hatchProb=0.1
	, pupateProb=0.1
	, ecloseProb=0.5
	, repProb=0.5
)

mothGeneration(repFemales=10
	, fecundity=600
	, femaleProb=0.5
	, hatchProb=0.1
	, pupateProb=0.1
	, ecloseProb=0.5
	, repProb=0.5
)
