.PHONY: clean

clean: 
	rm source/*
	rm figures/*
 
source/CVD_cleaned.csv:
	curl -Lo source/CVD_cleaned.csv https://raw.githubusercontent.com/AshkanEpi/BIOS611_Project/main/source/CVD_cleaned.csv
 
figures/figure1.png figures/figure2.png: source/CVD_cleaned.csv
	Rscript instructions.R