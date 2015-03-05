##This script uses the “Individual household electric power consumption Data Set” to demonstrate plotting functions in R.
##This is part of a four part series. Each script uses the same data, and exports a unique .png image of the resulting plot to the working directory.
##The top portion of this code gets and cleans the data. The lower portion, which makes the plot, is unique to each script.
##See the Code Book and ReadMe for more details. 


##GET AND FORMAT DATA-------------------------------------------------------------------------------------------------------------------------------
##First check if data file exists. If not, download and unzip the data.
if(!file.exists("household_power_consumption.txt")){
	download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_data_household_power_consumption.zip")
	##Unzip the data file in the working diretory.
	unzip("exdata_data_household_power_consumption.zip")
}

##Next pull rows of data from the unzipped text file. Only specific rows are needed. These rows have been predetermined 
##by prior experimentation.
alldata<-read.table("household_power_consumption.txt", sep=";",skip=66637, nrows=2880)

##Due to the row skip operator, the column names are not in the data. Read just the the first row of file to establish column titles.
datanames<-read.table("household_power_consumption.txt", sep=";",header=TRUE,nrows=1)

##Put these same column headers into the main data frame.
colnames(alldata)<-names(datanames)

##Format the data: Create a new data column that will comnine date and time info. 
alldata[,"DateTimeCombo"]<-paste(alldata$Date,alldata$Time)

##Reformat (re class) this new column into date and time form.
alldata$DateTimeCombo<-strptime(alldata$DateTimeCombo,format="%d/%m/%Y %H:%M:%S") 

##PLOT 3 ---------------------------------------------------------------------------------------------------------------------------------------------
##Create line plot of each of the sub metered areas of the home. 
##Chart is generated in working directory as .png file. 

png(filename = "plot3.png", width = 480, height = 480, units = "px")
	##Open the plot area and format:
	plot(alldata$DateTimeCombo, alldata$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
	##Add data lines:
	lines(alldata$DateTimeCombo, alldata$Sub_metering_1,col="black")
	lines(alldata$DateTimeCombo, alldata$Sub_metering_2,col="red")
	lines(alldata$DateTimeCombo, alldata$Sub_metering_3,col="blue")
	legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")
dev.off()
