options(width=200)
df <- read.table(input_files, sep="\t", header=FALSE)
names(df) <- c(
	"Abbreviation",
	"Capital",
	"Largest",
	"Entered",
	"Population",
	"Land",
	"Water",
	"Total"
)

provinces <- subset(df, select=c("Abbreviation", "Population", "Total"))
print(provinces)

classroom <- data.frame(Abbreviation = "Classroom"
	, Population=200
	, Total=1e-3
)

canada <- data.frame(Abbreviation = "Canada"
	, Population=sum(provinces$Population)
	, Total=sum(provinces$Total)
)

pa_plot = function(dat, log=""){
	par(cex=1.6)
	plot(dat$Total/10000, dat$Population/1e6,
		xlab = "Area (Mha)", ylab = "Population (Mp)", 
		type="p", pch=21, cex=1.8, bg="red",
		log=log
	)
}

pa_dual_plot = function(dat){
	pa_plot(dat)
	pa_plot(dat, log="xy")
}

pa_dual_plot(provinces)
pa_dual_plot(rbind(provinces, canada))
pa_dual_plot(rbind(provinces, canada, classroom))
