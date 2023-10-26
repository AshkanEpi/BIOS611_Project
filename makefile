.PHONY: clean

clean: 
	rm figures/*
 
figures/figure1.png figures/figure2.png: source/CVD_cleaned.csv
	Rscript instructions.R