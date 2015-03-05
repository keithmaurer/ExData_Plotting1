## Introduction:

This is the first project from Coursera's "Exploratory Data Analysis" course, and is intended to demonstrate basic graphing abilities in the R programming language. Data has been provided, and several example charts are produced. Further, each of these charts have been produced in R's Base package, with no outside "packages" used.


This project uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
data sets. It uses data from the "Individual household
electric power consumption Data Set". Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

* <b>Data Source</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]
* <b>Data Description:</b> <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>

##How the code works:
The four scripts for this project (plot1.R,plot2.R,plot3.R,plot4.R) each have two sections. The first section is common to all scripts, and involves getting and organizing the data. This is possible as each plot uses the same data. The second part of the code is unique to each script, and has the specifics for the particular chart generated. This allows each of the plot functions to be run independently, or in any order.

<b>Part 1</b>
* The code searches the working directory for the raw data. If it is missing, it will automatically download and unzip the file to the working directory. If the data source is present, then this process will be skipped.

* Next, specific data rows will be loaded into R. These rows were determined by prior examination of the entire data set. These scripts look at two days of data, where 4+ years of data are available from the downloaded data file. As such, +99% of the original data go unused, and selectively loading data makes the program perform faster and more reliably. All columns are used.

* Pulling specific data rows omits column titles. To fix this, another, smaller table is created with column names. Column names are copied from the smaller table to the larger, working table.

* A new column is created at right "DateTimeCombo." The text from the "Date" and "Time" fields are merged, and reformatted as to understood by R.

  
##The Four Plots:
Each of the plots can be run independently on the same data set. They each create unique plots that appear as PNG files in the working directory.  
<ol>
<li>The first plot is a histogram of "Active Power" over a two day period. Since sampling was done on an averaged minute by minute basis, this is a histogram of the number of minutes at each power intensity.</li>
<li>This chart is a line chart of "Active power" over the time scale of two days.</li>
<li>The third chart shows energy consumption for three areas of the house that have been sub-metered</li>
<li>The last collection of charts shows includes the first two, along with "Voltage" and "Reactive Power" readings over the same two day period. </li>
</ol>