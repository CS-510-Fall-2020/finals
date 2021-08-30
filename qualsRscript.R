#Data_entry.R: run this file to load the data for plotting with the plotting R script.

#Clears workspace
rm(list=ls())

#location<-work


Dair<-6.02e-6
Dwater<-7.84e-10

# Total capture areas determined by summing circumferences of all hairs for each model.
hermit.d <-1 #NOTE: These are set to 1 because we are using effective capture area instead of total area. This calculation takes place in the calculate_plot.R file. 
marine.d <-1


##### Loads Set 1 Data #####


# Values of Cinf for each case. 
cinf1.marinewater<-0.052328952493219  #Blue crab in water
cinf1.marineair<-0.038140257522164   #Blue crab in air
cinf1.hermitair<- 0.529629241195228	 #Terrestrial crab in air
cinf1.hermitwater<-0.513774451365372  	 #Terrestrial crab in water

# Loads data, Blue crab in water, Condition 1
marinewater11.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3300_marinewater.csv",header=FALSE)
summary(marinewater11.perstepdata)
marinewater11.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3300_marinewater.csv",header=FALSE)
summary(marinewater11.totals)

# Loads data, Blue crab in water PIV with air D coefficient, Condition 1
marinewaterdair1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3315_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair1.perstepdata)
marinewaterdair1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3315_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair1.totals)







# Loads data, Blue crab in air, Condition 1
marineair11.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3306_marineair.csv",header=FALSE)
summary(marineair11.perstepdata)
marineair11.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3306_marineair.csv",header=FALSE)
summary(marineair11.totals)

# Loads data, Blue crab in air PIV with water D coefficient
marineairdwater1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3312_marineairDswap.csv",header=FALSE)
summary(marineairdwater1.perstepdata)
marineairdwater1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3312_marineairDswap.csv",header=FALSE)
summary(marineairdwater1.totals)

# Loads data, Blue crab in water, Condition 2
marinewater21.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3303_marinewater.csv",header=FALSE)
summary(marinewater21.perstepdata)
marinewater21.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3303_marinewater.csv",header=FALSE)
summary(marinewater21.totals)

# Loads data, Blue crab in water long duration, condition 2
marinewaterTswap1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3321_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap1.perstepdata)
marinewaterTswap1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3321_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap1.totals)

# Loads data, Blue crab in air, Condition 2
marineair21.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3309_marineair.csv",header=FALSE)
summary(marineair21.perstepdata)
marineair21.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3309_marineair.csv",header=FALSE)
summary(marineair21.totals)

# Loads data, Blue crab in air long duration, condition 2
marineairTswap1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3318_marineairTswap.csv",header=FALSE)
summary(marineairTswap1.perstepdata)
marineairTswap1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3318_marineairTswap.csv",header=FALSE)
summary(marineairTswap1.totals)

# Creates C/Cinf for per time step data, Condition 1
marinewater11.perstepdata$C<-marinewater11.perstepdata$V2/cinf1.marinewater
marineair11.perstepdata$C<-marineair11.perstepdata$V2/cinf1.marineair
marinewaterdair1.perstepdata$C<-marinewaterdair1.perstepdata$V2/cinf1.marineair
marineairdwater1.perstepdata$C<-marineairdwater1.perstepdata$V2/cinf1.marinewater


# Adjusts for capture distance.
marinewater11.perstepdata$Cadj<-marinewater11.perstepdata$C/marine.d
marineair11.perstepdata$Cadj<-marineair11.perstepdata$C/marine.d
marinewaterdair1.perstepdata$Cadj<-marinewaterdair1.perstepdata$C/marine.d
marineairdwater1.perstepdata$Cadj<-marineairdwater1.perstepdata$C/marine.d


# Creates C/Cinf for per hair data, Condition 1
marinewater11.totals$V5<-marinewater11.totals$V5/cinf1.marinewater
marinewater11.totals$V5<-marinewater11.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair11.totals$V5<-marineair11.totals$V5/cinf1.marineair
marineair11.totals$V5<-marineair11.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marinewaterdair1.totals$V5<-marinewaterdair1.totals$V5/cinf1.marineair
marinewaterdair1.totals$V5<-marinewaterdair1.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineairdwater1.totals$V5<-marineairdwater1.totals$V5/cinf1.marinewater
marineairdwater1.totals$V5<-marineairdwater1.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area


# Creates C/Cinf for per time step data, Condition 2
marinewater21.perstepdata$C<-marinewater21.perstepdata$V2/cinf1.marinewater
marineair21.perstepdata$C<-marineair21.perstepdata$V2/cinf1.marineair
# Adjusts for capture distance.
marinewater21.perstepdata$Cadj<-marinewater21.perstepdata$C/marine.d
marineair21.perstepdata$Cadj<-marineair21.perstepdata$C/marine.d
marinewaterTswap1.perstepdata$C<-marinewaterTswap1.perstepdata$V2/cinf1.marinewater
marineairTswap1.perstepdata$C<-marineairTswap1.perstepdata$V2/cinf1.marineair
marinewaterTswap1.perstepdata$Cadj<-marinewaterTswap1.perstepdata$C/marine.d
marineairTswap1.perstepdata$Cadj<-marineairTswap1.perstepdata$C/marine.d

# Creates C/Cinf for per hair data, Condition 2
marinewater21.totals$V5<-marinewater21.totals$V5/cinf1.marinewater
marinewater21.totals$V5<-marinewater21.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marinewaterTswap1.totals$V5<-marinewaterTswap1.totals$V5/cinf1.marinewater
marinewaterTswap1.totals$V5<-marinewaterTswap1.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair21.totals$V5<-marineair21.totals$V5/cinf1.marineair
marineair21.totals$V5<-marineair21.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marineairTswap1.totals$V5<-marineairTswap1.totals$V5/cinf1.marineair
marineairTswap1.totals$V5<-marineairTswap1.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area


# Loads data, Terrestrial crab in water, Condition 1
hermitwater11.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3161_hermitwater.csv",header=FALSE)
summary(hermitwater11.perstepdata)
hermitwater11.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3161_hermitwater.csv",header=FALSE)
summary(hermitwater11.totals)

# Loads data, Terrestrial crab in water PIV with air D coefficient
hermitwaterdair1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3163_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair1.perstepdata)
hermitwaterdair1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3163_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair1.totals)

# Loads data, Terrestrial crab in air
hermitair11.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3116_hermitair.csv",header=FALSE)
summary(hermitair11.perstepdata)
hermitair11.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3116_hermitair.csv",header=FALSE)
summary(hermitair11.totals)

# Loads data, Terrestrial crab in air PIV with water D coefficient
hermitairdwater1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3118_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater1.perstepdata)
hermitairdwater1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3118_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater1.totals)



# Loads data, Terrestrial crab in water, Condition 2
hermitwater21.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3162_hermitwater.csv",header=FALSE)
summary(hermitwater21.perstepdata)
hermitwater21.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3162_hermitwater.csv",header=FALSE)
summary(hermitwater21.totals)

# Loads data, Terrestrial crab in water, short duration of marine crab
hermitwaterTswap1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3164_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap1.perstepdata)
hermitwaterTswap1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3164_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap1.totals)

# Loads data, Terrestrial crab in air, Condition 2
hermitair21.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3117_hermitair.csv",header=FALSE)
summary(hermitair21.perstepdata)
hermitair21.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3117_hermitair.csv",header=FALSE)
summary(hermitair21.totals)

# Loads data, Terrestrial crab in water, short duration of marine crab
hermitairTswap1.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/pertimestep_3120_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap1.perstepdata)
hermitairTswap1.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/totalhairs_3120_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap1.totals)

# Creates C/Cinf for per time step data, Condition 1
hermitwater11.perstepdata$C<-hermitwater11.perstepdata$V2/cinf1.hermitwater
hermitair11.perstepdata$C<-hermitair11.perstepdata$V2/cinf1.hermitair
hermitwaterdair1.perstepdata$C<-hermitwaterdair1.perstepdata$V2/cinf1.hermitair
hermitairdwater1.perstepdata$C<-hermitairdwater1.perstepdata$V2/cinf1.hermitwater






# Adjusts for capture distance.
hermitwater11.perstepdata$Cadj<-hermitwater11.perstepdata$C/hermit.d
hermitair11.perstepdata$Cadj<-hermitair11.perstepdata$C/hermit.d
hermitwaterdair1.perstepdata$Cadj<-hermitwaterdair1.perstepdata$C/hermit.d
hermitairdwater1.perstepdata$Cadj<-hermitairdwater1.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data
hermitwater11.totals$V3<-hermitwater11.totals$V3/cinf1.hermitwater
hermitwater11.totals$V3<-hermitwater11.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair11.totals$V3<-hermitair11.totals$V3/cinf1.hermitair
hermitair11.totals$V3<-hermitair11.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitairdwater1.totals$V3<-hermitairdwater1.totals$V3/cinf1.hermitwater
hermitairdwater1.totals$V3<-hermitairdwater1.totals$V3/hermit.d
hermitwaterdair1.totals$V3<-hermitwaterdair1.totals$V3/cinf1.hermitair
hermitwaterdair1.totals$V3<-hermitwaterdair1.totals$V3/hermit.d

# Creates C/Cinf for per time step data, Condition 2
hermitwater21.perstepdata$C<-hermitwater21.perstepdata$V2/cinf1.hermitwater
hermitair21.perstepdata$C<-hermitair21.perstepdata$V2/cinf1.hermitair
hermitwaterTswap1.perstepdata$C<-hermitwaterTswap1.perstepdata$V2/cinf1.hermitwater
hermitairTswap1.perstepdata$C<-hermitairTswap1.perstepdata$V2/cinf1.hermitair

# Adjusts for capture distance.
hermitwater21.perstepdata$Cadj<-hermitwater21.perstepdata$C/hermit.d
hermitair21.perstepdata$Cadj<-hermitair21.perstepdata$C/hermit.d
hermitwaterTswap1.perstepdata$Cadj<-hermitwaterTswap1.perstepdata$C/hermit.d
hermitairTswap1.perstepdata$Cadj<-hermitairTswap1.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data, Condition 2
hermitwater21.totals$V3<-hermitwater21.totals$V3/cinf1.hermitwater
hermitwater21.totals$V3<-hermitwater21.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair21.totals$V3<-hermitair21.totals$V3/cinf1.hermitair
hermitair21.totals$V3<-hermitair21.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitwaterTswap1.totals$V3<-hermitwaterTswap1.totals$V3/cinf1.hermitwater
hermitwaterTswap1.totals$V3<-hermitwaterTswap1.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitairTswap1.totals$V3<-hermitairTswap1.totals$V3/cinf1.hermitair
hermitairTswap1.totals$V3<-hermitairTswap1.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area

##############
##############










##### Loads Set 2 Data #####



# Values of Cinf for each case. 
cinf2.marinewater<-0.052328952493219  #Blue crab in water
cinf2.marineair<-0.037996784146410   #Blue crab in air
cinf2.hermitair<- 0.512951477711897 #Terrestrial crab in air
cinf2.hermitwater<-0.512951477711897  #Terrestrial crab in water



# Loads data, Blue crab in water, Condition 1
marinewater12.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3301_marinewater.csv",header=FALSE)
summary(marinewater12.perstepdata)
marinewater12.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3301_marinewater.csv",header=FALSE)
summary(marinewater12.totals)

# Loads data, Blue crab in water PIV with air D coefficient, Condition 1
marinewaterdair2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3316_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair2.perstepdata)
marinewaterdair2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3316_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair2.totals)


# Loads data, Blue crab in air, Condition 1
marineair12.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3307_marineair.csv",header=FALSE)
summary(marineair12.perstepdata)
marineair12.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3307_marineair.csv",header=FALSE)
summary(marineair12.totals)

# Loads data, Blue crab in air PIV with water D coefficient
marineairdwater2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3313_marineairDswap.csv",header=FALSE)
summary(marineairdwater2.perstepdata)
marineairdwater2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3313_marineairDswap.csv",header=FALSE)
summary(marineairdwater2.totals)

# Loads data, Blue crab in water, Condition 2
marinewater22.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3304_marinewater.csv",header=FALSE)
summary(marinewater22.perstepdata)
marinewater22.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3304_marinewater.csv",header=FALSE)
summary(marinewater22.totals)

# Loads data, Blue crab in water long duration, condition 2
marinewaterTswap2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3322_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap2.perstepdata)
marinewaterTswap2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3322_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap2.totals)

# Loads data, Blue crab in air, Condition 2
marineair22.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3310_marineair.csv",header=FALSE)
summary(marineair22.perstepdata)
marineair22.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3310_marineair.csv",header=FALSE)
summary(marineair22.totals)

# Loads data, Blue crab in air long duration, condition 2
marineairTswap2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3319_marineairTswap.csv",header=FALSE)
summary(marineairTswap2.perstepdata)
marineairTswap2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3319_marineairTswap.csv",header=FALSE)
summary(marineairTswap2.totals)

# Creates C/Cinf for per time step data, Condition 1
marinewater12.perstepdata$C<-marinewater12.perstepdata$V2/cinf2.marinewater
marineair12.perstepdata$C<-marineair12.perstepdata$V2/cinf2.marineair
marinewaterdair2.perstepdata$C<-marinewaterdair2.perstepdata$V2/cinf2.marineair
marineairdwater2.perstepdata$C<-marineairdwater2.perstepdata$V2/cinf2.marinewater



# Adjusts for capture distance.
marinewater12.perstepdata$Cadj<-marinewater12.perstepdata$C/marine.d
marineair12.perstepdata$Cadj<-marineair12.perstepdata$C/marine.d
marinewaterdair2.perstepdata$Cadj<-marinewaterdair2.perstepdata$C/marine.d
marineairdwater2.perstepdata$Cadj<-marineairdwater2.perstepdata$C/marine.d


# Creates C/Cinf for per hair data, Condition 1
marinewater12.totals$V5<-marinewater12.totals$V5/cinf2.marinewater
marinewater12.totals$V5<-marinewater12.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair12.totals$V5<-marineair12.totals$V5/cinf2.marineair
marineair12.totals$V5<-marineair12.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marinewaterdair2.totals$V5<-marinewaterdair2.totals$V5/cinf2.marineair
marinewaterdair2.totals$V5<-marinewaterdair2.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineairdwater2.totals$V5<-marineairdwater2.totals$V5/cinf2.marinewater
marineairdwater2.totals$V5<-marineairdwater2.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area


# Creates C/Cinf for per time step data, Condition 2
marinewater22.perstepdata$C<-marinewater22.perstepdata$V2/cinf2.marinewater
marineair22.perstepdata$C<-marineair22.perstepdata$V2/cinf2.marineair


# Adjusts for capture distance.
marinewater22.perstepdata$Cadj<-marinewater22.perstepdata$C/marine.d
marineair22.perstepdata$Cadj<-marineair22.perstepdata$C/marine.d
marinewaterTswap2.perstepdata$C<-marinewaterTswap2.perstepdata$V2/cinf2.marinewater
marineairTswap2.perstepdata$C<-marineairTswap2.perstepdata$V2/cinf2.marineair
marinewaterTswap2.perstepdata$Cadj<-marinewaterTswap2.perstepdata$C/marine.d
marineairTswap2.perstepdata$Cadj<-marineairTswap2.perstepdata$C/marine.d



# Creates C/Cinf for per hair data, Condition 2
marinewater22.totals$V5<-marinewater22.totals$V5/cinf2.marinewater
marinewater22.totals$V5<-marinewater22.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marinewaterTswap2.totals$V5<-marinewaterTswap2.totals$V5/cinf2.marinewater
marinewaterTswap2.totals$V5<-marinewaterTswap2.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair22.totals$V5<-marineair22.totals$V5/cinf2.marineair
marineair22.totals$V5<-marineair22.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marineairTswap2.totals$V5<-marineairTswap2.totals$V5/cinf2.marineair
marineairTswap2.totals$V5<-marineairTswap2.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area



# Loads data, Terrestrial crab in water, Condition 1
hermitwater12.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3165_hermitwater.csv",header=FALSE)
summary(hermitwater12.perstepdata)
hermitwater12.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3165_hermitwater.csv",header=FALSE)
summary(hermitwater12.totals)

# Loads data, Terrestrial crab in water PIV with air D coefficient
hermitwaterdair2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3170_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair2.perstepdata)
hermitwaterdair2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3170_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair2.totals)

# Loads data, Terrestrial crab in air
hermitair12.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3167_hermitair.csv",header=FALSE)
summary(hermitair12.perstepdata)
hermitair12.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3167_hermitair.csv",header=FALSE)
summary(hermitair12.totals)

# Loads data, Terrestrial crab in air PIV with water D coefficient
hermitairdwater2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3169_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater2.perstepdata)
hermitairdwater2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3169_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater2.totals)



# Loads data, Terrestrial crab in water, Condition 2
hermitwater22.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3166_hermitwater.csv",header=FALSE)
summary(hermitwater22.perstepdata)
hermitwater22.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3166_hermitwater.csv",header=FALSE)
summary(hermitwater22.totals)

# Loads data, Terrestrial crab in water, short duration of marine crab
hermitwaterTswap2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3172_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap2.perstepdata)
hermitwaterTswap2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3172_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap2.totals)

# Loads data, Terrestrial crab in air, Condition 2
hermitair22.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3168_hermitair.csv",header=FALSE)
summary(hermitair22.perstepdata)
hermitair22.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3168_hermitair.csv",header=FALSE)
summary(hermitair22.totals)

# Loads data, Terrestrial crab in air, short duration of marine crab
hermitairTswap2.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/pertimestep_3171_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap2.perstepdata)
hermitairTswap2.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/totalhairs_3171_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap2.totals)

# Creates C/Cinf for per time step data, Condition 1
hermitwater12.perstepdata$C<-hermitwater12.perstepdata$V2/cinf2.hermitwater
hermitair12.perstepdata$C<-hermitair12.perstepdata$V2/cinf2.hermitair
hermitwaterdair2.perstepdata$C<-hermitwaterdair2.perstepdata$V2/cinf2.hermitair
hermitairdwater2.perstepdata$C<-hermitairdwater2.perstepdata$V2/cinf2.hermitwater


# Adjusts for capture distance.
hermitwater12.perstepdata$Cadj<-hermitwater12.perstepdata$C/hermit.d
hermitair12.perstepdata$Cadj<-hermitair12.perstepdata$C/hermit.d
hermitwaterdair2.perstepdata$Cadj<-hermitwaterdair2.perstepdata$C/hermit.d
hermitairdwater2.perstepdata$Cadj<-hermitairdwater2.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data
hermitwater12.totals$V3<-hermitwater12.totals$V3/cinf2.hermitwater
hermitwater12.totals$V3<-hermitwater12.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair12.totals$V3<-hermitair12.totals$V3/cinf2.hermitair
hermitair12.totals$V3<-hermitair12.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitairdwater2.totals$V3<-hermitairdwater2.totals$V3/cinf2.hermitwater
hermitairdwater2.totals$V3<-hermitairdwater2.totals$V3/hermit.d
hermitwaterdair2.totals$V3<-hermitwaterdair2.totals$V3/cinf2.hermitair
hermitwaterdair2.totals$V3<-hermitwaterdair2.totals$V3/hermit.d

# Creates C/Cinf for per time step data, Condition 2
hermitwater22.perstepdata$C<-hermitwater22.perstepdata$V2/cinf2.hermitwater
hermitair22.perstepdata$C<-hermitair22.perstepdata$V2/cinf2.hermitair
hermitwaterTswap2.perstepdata$C<-hermitwaterTswap2.perstepdata$V2/cinf2.hermitwater
hermitairTswap2.perstepdata$C<-hermitairTswap2.perstepdata$V2/cinf2.hermitair



# Adjusts for capture distance.
hermitwater22.perstepdata$Cadj<-hermitwater22.perstepdata$C/hermit.d
hermitair22.perstepdata$Cadj<-hermitair22.perstepdata$C/hermit.d
hermitwaterTswap2.perstepdata$Cadj<-hermitwaterTswap2.perstepdata$C/hermit.d
hermitairTswap2.perstepdata$Cadj<-hermitairTswap2.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data, Condition 2
hermitwater22.totals$V3<-hermitwater22.totals$V3/cinf2.hermitwater
hermitwater22.totals$V3<-hermitwater22.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair22.totals$V3<-hermitair22.totals$V3/cinf2.hermitair
hermitair22.totals$V3<-hermitair22.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitwaterTswap2.totals$V3<-hermitwaterTswap2.totals$V3/cinf2.hermitwater
hermitwaterTswap2.totals$V3<-hermitwaterTswap2.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitairTswap2.totals$V3<-hermitairTswap2.totals$V3/cinf2.hermitair
hermitairTswap2.totals$V3<-hermitairTswap2.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area






