.PHONY: clean

clean: 
	rm figures/*
	rm tables/*
	rm dataset/*
 
dataset/data2.csv dataset/data1.csv dataset/raw2.csv dataset/data_c.csv: scripts/functions.R scripts/libraries.R source/CVD_cleaned.csv
	Rscript scripts/data_tidy.R

tables/first_look.RData tables/proportions.RData tables/BMI.RData tables/alcohol.RData tables/fruit.RData tables/veggies.RData tables/fries.RData: scripts/functions.R scripts/libraries.R source/CVD_cleaned.csv dataset/data_c.csv
	Rscript scripts/tables.R

figures/combined_plot.png: scripts/functions.R scripts/libraries.R dataset/raw2.csv
	Rscript scripts/categorical_figures.R

figures/combined_plot2.png: scripts/functions.R scripts/libraries.R dataset/data1.csv
	Rscript scripts/continous_figures.R

figures/relative_influence_plot.png figures/ROC.png tables/model_summary.RData tables/model_auc.RData: scripts/functions.R scripts/libraries.R dataset/data2.csv
	Rscript scripts/modeling.R

report.pdf: figures/combined_plot.png figures/combined_plot2.png figures/relative_influence_plot.png figures/ROC.png tables/model_summary.RData tables/model_auc.RData tables/first_look.RData tables/proportions.RData tables/BMI.RData tables/alcohol.RData tables/fruit.RData tables/veggies.RData tables/fries.RData scripts/libraries.R
	Rscript instructions.R
