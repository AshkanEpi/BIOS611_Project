**BIOS 611 Final Project**

Hello, and welcome to my BIOS 611 final project! This is an analysis I did using clean data on cardiovascular diseases that I downloaded from Kaggle. The data is based on the 2021 BRFSS dataset from the CDC:

https://www.kaggle.com/datasets/alphiree/cardiovascular-diseases-risk-prediction-dataset

The aim of this analysis was to see whether traditional risk factors for heart disease still hold up well for more recent populations, given the changing diets and advances in medications and public health. We also wanted to see whether we can accurately predict heart disease, given the variables in this dataset.

**How to get the report pdf**
First, you need to download and install Docker based on your operating system. It can be downloaded here:

https://www.docker.com/products/docker-desktop/

Once docker is installed, clone this git repository by putting this command into your terminal:

git clone https://github.com/AshkanEpi/BIOS611_Project

This will download the repository into your directory. Navigate to the folder named BIOS611_Project and run the following in your terminal:

docker build -t bios611 .

Once this is completed, run this in the terminal, replace <put your work directory here> with the directory to the BIOS611_Project folder:

docker run -e PASSWORD=yourpassword --rm -p 8787:8787 -v <put your work directory here>:/home/rstudio/work bios611

Go to your browser and go to this URL:

http://localhost:8787/

Sign in with this password and username:

Username: rstudio
Password: yourpassword

Once signed in, go to the “Terminal” tab and simply type the following to get your report pdf file:

cd work

make report.pdf
