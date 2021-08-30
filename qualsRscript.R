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









##############
##############


##### Loads Set 3 Data #####

# Values of Cinf for each case. 
cinf3.marinewater<-0.053844453778029  #Blue crab in water
cinf3.marineair<-0.037957737240439    #Blue crab in air
cinf3.hermitair<- 0.526007400705351	 #Terrestrial crab in air
cinf3.hermitwater<- 0.537114520259193  	 #Terrestrial crab in water


# Loads data, Blue crab in water, Condition 1
marinewater13.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3302_marinewater.csv",header=FALSE)
summary(marinewater13.perstepdata)
marinewater13.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3302_marinewater.csv",header=FALSE)
summary(marinewater13.totals)

# Loads data, Blue crab in water PIV with air D coefficient, Condition 1
marinewaterdair3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3317_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair3.perstepdata)
marinewaterdair3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3317_marinewaterDswap.csv",header=FALSE)
summary(marinewaterdair3.totals)


# Loads data, Blue crab in air, Condition 1
marineair13.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3308_marineair.csv",header=FALSE)
summary(marineair13.perstepdata)
marineair13.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3308_marineair.csv",header=FALSE)
summary(marineair13.totals)

# Loads data, Blue crab in air PIV with water D coefficient
marineairdwater3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3314_marineairDswap.csv",header=FALSE)
summary(marineairdwater3.perstepdata)
marineairdwater3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3314_marineairDswap.csv",header=FALSE)
summary(marineairdwater3.totals)

# Loads data, Blue crab in water, Condition 2
marinewater23.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3305_marinewater.csv",header=FALSE)
summary(marinewater23.perstepdata)
marinewater23.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3305_marinewater.csv",header=FALSE)
summary(marinewater23.totals)

# Loads data, Blue crab in water long duration, condition 2
marinewaterTswap3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3323_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap3.perstepdata)
marinewaterTswap3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3323_marinewaterTswap.csv",header=FALSE)
summary(marinewaterTswap3.totals)

# Loads data, Blue crab in air, Condition 2
marineair23.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3311_marineair.csv",header=FALSE)
summary(marineair23.perstepdata)
marineair23.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3311_marineair.csv",header=FALSE)
summary(marineair23.totals)

# Loads data, Blue crab in air long duration, condition 2
marineairTswap3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3320_marineairTswap.csv",header=FALSE)
summary(marineairTswap3.perstepdata)
marineairTswap3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3320_marineairTswap.csv",header=FALSE)
summary(marineairTswap3.totals)

# Creates C/Cinf for per time step data, Condition 1
marinewater13.perstepdata$C<-marinewater13.perstepdata$V2/cinf3.marinewater
marineair13.perstepdata$C<-marineair13.perstepdata$V2/cinf3.marineair
marinewaterdair3.perstepdata$C<-marinewaterdair3.perstepdata$V2/cinf3.marineair
marineairdwater3.perstepdata$C<-marineairdwater3.perstepdata$V2/cinf3.marinewater


# Adjusts for capture distance.
marinewater13.perstepdata$Cadj<-marinewater13.perstepdata$C/marine.d
marineair13.perstepdata$Cadj<-marineair13.perstepdata$C/marine.d
marinewaterdair3.perstepdata$Cadj<-marinewaterdair3.perstepdata$C/marine.d
marineairdwater3.perstepdata$Cadj<-marineairdwater3.perstepdata$C/marine.d


# Creates C/Cinf for per hair data, Condition 1
marinewater13.totals$V5<-marinewater13.totals$V5/cinf3.marinewater
marinewater13.totals$V5<-marinewater13.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair13.totals$V5<-marineair13.totals$V5/cinf3.marineair
marineair13.totals$V5<-marineair13.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marinewaterdair3.totals$V5<-marinewaterdair3.totals$V5/cinf3.marineair
marinewaterdair3.totals$V5<-marinewaterdair3.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineairdwater3.totals$V5<-marineairdwater3.totals$V5/cinf3.marinewater
marineairdwater3.totals$V5<-marineairdwater3.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area


# Creates C/Cinf for per time step data, Condition 2
marinewater23.perstepdata$C<-marinewater23.perstepdata$V2/cinf3.marinewater
marineair23.perstepdata$C<-marineair23.perstepdata$V2/cinf3.marineair



# Adjusts for capture distance.
marinewater23.perstepdata$Cadj<-marinewater23.perstepdata$C/marine.d
marineair23.perstepdata$Cadj<-marineair23.perstepdata$C/marine.d
marinewaterTswap3.perstepdata$C<-marinewaterTswap3.perstepdata$V2/cinf3.marinewater
marineairTswap3.perstepdata$C<-marineairTswap3.perstepdata$V2/cinf3.marineair
marinewaterTswap3.perstepdata$Cadj<-marinewaterTswap3.perstepdata$C/marine.d
marineairTswap3.perstepdata$Cadj<-marineairTswap3.perstepdata$C/marine.d


# Creates C/Cinf for per hair data, Condition 2
marinewater23.totals$V5<-marinewater23.totals$V5/cinf3.marinewater
marinewater23.totals$V5<-marinewater23.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marinewaterTswap3.totals$V5<-marinewaterTswap3.totals$V5/cinf3.marinewater
marinewaterTswap3.totals$V5<-marinewaterTswap3.totals$V5/marine.d  #Uncomment for standardizing per hair data by capture area
marineair23.totals$V5<-marineair23.totals$V5/cinf3.marineair
marineair23.totals$V5<-marineair23.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area
marineairTswap3.totals$V5<-marineairTswap3.totals$V5/cinf3.marineair
marineairTswap3.totals$V5<-marineairTswap3.totals$V5/marine.d      #Uncomment for standardizing per hair data by capture area



# Loads data, Terrestrial crab in water, Condition 1
hermitwater13.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3173_hermitwater.csv",header=FALSE)
summary(hermitwater13.perstepdata)
hermitwater13.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3173_hermitwater.csv",header=FALSE)
summary(hermitwater13.totals)

# Loads data, Terrestrial crab in water PIV with air D coefficient
hermitwaterdair3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3178_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair3.perstepdata)
hermitwaterdair3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3178_hermitwaterDswap.csv",header=FALSE)
summary(hermitwaterdair3.totals)

# Loads data, Terrestrial crab in air
hermitair13.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3175_hermitair.csv",header=FALSE)
summary(hermitair13.perstepdata)
hermitair13.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3175_hermitair.csv",header=FALSE)
summary(hermitair13.totals)

# Loads data, Terrestrial crab in air PIV with water D coefficient
hermitairdwater3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3177_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater3.perstepdata)
hermitairdwater3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3177_hermitairDswap.csv",header=FALSE)
summary(hermitairdwater3.totals)



# Loads data, Terrestrial crab in water, Condition 2
hermitwater23.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3174_hermitwater.csv",header=FALSE)
summary(hermitwater23.perstepdata)
hermitwater23.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3174_hermitwater.csv",header=FALSE)
summary(hermitwater23.totals)

# Loads data, Terrestrial crab in water, short duration of marine crab
hermitwaterTswap3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3180_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap3.perstepdata)
hermitwaterTswap3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3180_hermitwaterTswap.csv",header=FALSE)
summary(hermitwaterTswap3.totals)

# Loads data, Terrestrial crab in air, Condition 2
hermitair23.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3176_hermitair.csv",header=FALSE)
summary(hermitair23.perstepdata)
hermitair23.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3176_hermitair.csv",header=FALSE)
summary(hermitair23.totals)

# Loads data, Terrestrial crab in water, short duration of marine crab
hermitairTswap3.perstepdata<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/pertimestep_3179_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap3.perstepdata)
hermitairTswap3.totals<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/totalhairs_3179_hermitairTswap.csv",header=FALSE)
summary(hermitairTswap3.totals)

# Creates C/Cinf for per time step data, Condition 1
hermitwater13.perstepdata$C<-hermitwater13.perstepdata$V2/cinf3.hermitwater
hermitair13.perstepdata$C<-hermitair13.perstepdata$V2/cinf3.hermitair
hermitwaterdair3.perstepdata$C<-hermitwaterdair3.perstepdata$V2/cinf3.hermitair
hermitairdwater3.perstepdata$C<-hermitairdwater3.perstepdata$V2/cinf3.hermitwater


# Adjusts for capture distance.
hermitwater13.perstepdata$Cadj<-hermitwater13.perstepdata$C/hermit.d
hermitair13.perstepdata$Cadj<-hermitair13.perstepdata$C/hermit.d
hermitwaterdair3.perstepdata$Cadj<-hermitwaterdair3.perstepdata$C/hermit.d
hermitairdwater3.perstepdata$Cadj<-hermitairdwater3.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data
hermitwater13.totals$V3<-hermitwater13.totals$V3/cinf3.hermitwater
hermitwater13.totals$V3<-hermitwater13.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair13.totals$V3<-hermitair13.totals$V3/cinf3.hermitair
hermitair13.totals$V3<-hermitair13.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitairdwater3.totals$V3<-hermitairdwater3.totals$V3/cinf3.hermitwater
hermitairdwater3.totals$V3<-hermitairdwater3.totals$V3/hermit.d
hermitwaterdair3.totals$V3<-hermitwaterdair3.totals$V3/cinf3.hermitair
hermitwaterdair3.totals$V3<-hermitwaterdair3.totals$V3/hermit.d

# Creates C/Cinf for per time step data, Condition 2
hermitwater23.perstepdata$C<-hermitwater23.perstepdata$V2/cinf3.hermitwater
hermitair23.perstepdata$C<-hermitair23.perstepdata$V2/cinf3.hermitair
hermitwaterTswap3.perstepdata$C<-hermitwaterTswap3.perstepdata$V2/cinf3.hermitwater
hermitairTswap3.perstepdata$C<-hermitairTswap3.perstepdata$V2/cinf3.hermitair



# Adjusts for capture distance.
hermitwater23.perstepdata$Cadj<-hermitwater23.perstepdata$C/hermit.d
hermitair23.perstepdata$Cadj<-hermitair23.perstepdata$C/hermit.d
hermitwaterTswap3.perstepdata$Cadj<-hermitwaterTswap3.perstepdata$C/hermit.d
hermitairTswap3.perstepdata$Cadj<-hermitairTswap3.perstepdata$C/hermit.d

# Creates C/Cinf for per hair data, Condition 2
hermitwater23.totals$V3<-hermitwater23.totals$V3/cinf3.hermitwater
hermitwater23.totals$V3<-hermitwater23.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitair23.totals$V3<-hermitair23.totals$V3/cinf3.hermitair
hermitair23.totals$V3<-hermitair23.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area
hermitwaterTswap3.totals$V3<-hermitwaterTswap3.totals$V3/cinf3.hermitwater
hermitwaterTswap3.totals$V3<-hermitwaterTswap3.totals$V3/hermit.d  #Uncomment for standardizing per hair data by capture area
hermitairTswap3.totals$V3<-hermitairTswap3.totals$V3/cinf3.hermitair
hermitairTswap3.totals$V3<-hermitairTswap3.totals$V3/hermit.d      #Uncomment for standardizing per hair data by capture area


##############
##############





##install.packages("signal")##install this package for the first time
##install.packages("rgl") #install this package for the first time


library(signal)
library(rgl)
library(plotrix)
library(ggplot2)
require(plotrix)
require(ggplot2)
library(cowplot)
require(cowplot)











n=3   #number of replicates

findMeans<-function(set1data.time,set1data.Cadj,set2data.time,set2data.Cadj,set3data.time,set3data.Cadj){
  if(length(set1data.Cadj)==length(set2data.Cadj) & length(set2data.Cadj)==length(set3data.Cadj)){		
    meanCadj<-matrix(0,length(set1data.time),1)
    SDCadj<-matrix(0,length(set1data.time),1)
    flux<-matrix(0,length(set1data.time),1)
    for (i in 1:length(set1data.time)){
      a<-c(set1data.Cadj[i],set2data.Cadj[i],set3data.Cadj[i])
      meanCadj[i]<-mean(a)
      SDCadj[i]<-sd(a)
    }
    for(i in 2:length(flux)){
      flux[i] = abs(meanCadj[i+1]-meanCadj[i])/abs(set1data.time[i+1]-set1data.time[i])
    }
    dataresult<-data.frame(set1data.time,set1data.Cadj,set2data.Cadj,set3data.Cadj,meanCadj,SDCadj,flux)
    names(dataresult)<-c("time","set1","set2","set3","mean","SD","flux")
    return(dataresult)
    
  } else{
    if(length(set1data.Cadj)<=length(set2data.Cadj) & length(set1data.Cadj)<=length(set3data.Cadj)){
      timeint<-set1data.time
    } else if (length(set2data.Cadj)<=length(set1data.Cadj) & length(set2data.Cadj)<=length(set3data.Cadj)) {
      timeint<-set2data.time
    } else if(length(set3data.Cadj)<=length(set1data.Cadj) & length(set3data.Cadj)<=length(set2data.Cadj)) {
      timeint<-set3data.time	
    } else {
      timeint<-set1data.time
    }
    set1dataint.Cadj<-interp1(set1data.time,set1data.Cadj,timeint,method=c("linear"),extrap=FALSE)
    set2dataint.Cadj<-interp1(set2data.time,set2data.Cadj,timeint,method=c("linear"),extrap=FALSE)
    set3dataint.Cadj<-interp1(set3data.time,set3data.Cadj,timeint,method=c("linear"),extrap=FALSE)
    
    meanCadj<-matrix(0,length(timeint),1)		
    SDCadj<-matrix(0,length(timeint),1)
    flux<-matrix(0,length(timeint),1)
    for (i in 1:length(timeint)){
      a<-c(set1dataint.Cadj[i],set2dataint.Cadj[i],set3dataint.Cadj[i])
      meanCadj[i]<-mean(a)
      SDCadj[i]<-sd(a)
    }
    for(i in 2:length(flux)){
      flux[i] = abs(meanCadj[i+1]-meanCadj[i])/abs(timeint[i+1]-timeint[i])
    }
    
    
    dataresult<-data.frame(timeint,set1dataint.Cadj,set2dataint.Cadj,set3dataint.Cadj,meanCadj,SDCadj,flux)
    names(dataresult)<-c("time","set1","set2","set3","mean","SD","flux")
    return(dataresult)
  }
}




findMeans2<-function(set1data.time,set1data.Cadj,set2data.time,set2data.Cadj){
  if(length(set1data.Cadj)==length(set2data.Cadj)){		
    meanCadj<-matrix(0,length(set1data.time),1)
    SDCadj<-matrix(0,length(set1data.time),1)
    flux<-matrix(0,length(set1data.time),1)
    for (i in 1:length(set1data.time)){
      a<-c(set1data.Cadj[i],set2data.Cadj[i])
      meanCadj[i]<-mean(a)
      SDCadj[i]<-sd(a)
    }
    #for(i in 2:length(flux)){
    #	flux[i] = abs(meanCadj[i+1]-meanCadj[i])/abs(set1data.time[i+1]-set1data.time[i])
    #}
    dataresult<-data.frame(set1data.time,set1data.Cadj,set2data.Cadj,meanCadj,SDCadj,flux)
    names(dataresult)<-c("time","set1","set2","mean","SD","flux")
    return(dataresult)
    
  } else{
    if(length(set1data.Cadj)<=length(set2data.Cadj)){
      timeint<-set1data.time
    } else if (length(set2data.Cadj)<=length(set1data.Cadj) & length(set2data.Cadj)<=length(set3data.Cadj)) {
      timeint<-set2data.time
      #} else if(length(set3data.Cadj)<=length(set1data.Cadj) & length(set3data.Cadj)<=length(set2data.Cadj)) {
      #	timeint<-set3data.time	
    } else {
      timeint<-set1data.time
    }
    set1dataint.Cadj<-interp1(set1data.time,set1data.Cadj,timeint,method=c("linear"),extrap=FALSE)
    set2dataint.Cadj<-interp1(set2data.time,set2data.Cadj,timeint,method=c("linear"),extrap=FALSE)
    
    
    meanCadj<-matrix(0,length(timeint),1)		
    SDCadj<-matrix(0,length(timeint),1)
    flux<-matrix(0,length(timeint),1)
    for (i in 1:length(timeint)){
      a<-c(set1dataint.Cadj[i],set2dataint.Cadj[i])
      meanCadj[i]<-mean(a)
      SDCadj[i]<-sd(a)
    }
    for(i in 2:length(flux)){
      flux[i] = abs(meanCadj[i+1]-meanCadj[i])/abs(timeint[i+1]-timeint[i])
    }
    
    
    dataresult<-data.frame(timeint,set1dataint.Cadj,set2dataint.Cadj,meanCadj,SDCadj,flux)
    names(dataresult)<-c("time","set1","set2","mean","SD","flux")
    return(dataresult)
  }
}







###############################
###### Hair Calculations ######

#### Hermit Crabs #####


hermithairsset1<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set1/hermithairseffectarea.csv",header=FALSE)

hermithairsset2<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set2/hermithairseffectarea.csv",header=FALSE)

hermithairsset3<-read.csv("C:/Users/isaac/OneDrive/Desktop/cs510-qe-aug2021-nwimozu-main/practical/set3/hermithairseffectarea.csv",header=FALSE)





hermitair1.d<-((hermithairsset1$V1+hermithairsset2$V1+hermithairsset3$V1)/n)*hermit.d
hermitwater1.d<-((hermithairsset1$V2+hermithairsset2$V2+hermithairsset3$V2)/n)*hermit.d
hermitwaterdair.d<-((hermithairsset1$V3+hermithairsset2$V3+hermithairsset3$V3)/n)*hermit.d
hermitairdwater.d<-((hermithairsset1$V4+hermithairsset2$V4+hermithairsset3$V4)/n)*hermit.d
hermitair2.d<-((hermithairsset1$V5+hermithairsset2$V5+hermithairsset3$V5)/n)*hermit.d
hermitwater2.d<-((hermithairsset1$V6+hermithairsset2$V6+hermithairsset3$V6)/n)*hermit.d
hermitwaterTswap.d<-((hermithairsset1$V7+hermithairsset2$V7+hermithairsset3$V7)/n)*hermit.d
hermitairTswap.d<-((hermithairsset1$V8+hermithairsset2$V8+hermithairsset3$V8)/n)*hermit.d

hermitair1totals<-findMeans(hermitair11.totals$V1,hermitair11.totals$V3/hermitair1.d,hermitair12.totals$V1,hermitair12.totals$V3/hermitair1.d,hermitair13.totals$V1,hermitair13.totals$V3/hermitair1.d)
hermitair1totals$ratios<-hermitair1totals$mean/sum(hermitair1totals$mean)*100

hermitwater1totals<-findMeans(hermitwater11.totals$V1,hermitwater11.totals$V3/hermitwater1.d,hermitwater12.totals$V1,hermitwater12.totals$V3/hermitwater1.d,hermitwater13.totals$V1,hermitwater13.totals$V3/hermitwater1.d)
hermitwater1totals$ratios<-hermitwater1totals$mean/sum(hermitwater1totals$mean)*100

hermitairdwatertotals<-findMeans(hermitairdwater1.totals$V1,hermitairdwater1.totals$V3/hermitairdwater.d,hermitairdwater2.totals$V1,hermitairdwater2.totals$V3/hermitairdwater.d,hermitairdwater3.totals$V1,hermitairdwater3.totals$V3/hermitairdwater.d)
hermitairdwatertotals$ratios<-hermitairdwatertotals$mean/sum(hermitairdwatertotals$mean)*100

hermitwaterdairtotals<-findMeans(hermitwaterdair1.totals$V1,hermitwaterdair1.totals$V3/hermitwaterdair.d,hermitwaterdair2.totals$V1,hermitwaterdair2.totals$V3/hermitwaterdair.d,hermitwaterdair3.totals$V1,hermitwaterdair3.totals$V3/hermitwaterdair.d)
hermitwaterdairtotals$ratios<-hermitwaterdairtotals$mean/sum(hermitwaterdairtotals$mean)*100

hermitair2totals<-findMeans(hermitair21.totals$V1,hermitair21.totals$V3/hermitair2.d,hermitair22.totals$V1,hermitair22.totals$V3/hermitair2.d,hermitair23.totals$V1,hermitair23.totals$V3/hermitair2.d)
hermitair2totals$ratios<-hermitair2totals$mean/sum(hermitair2totals$mean)*100

hermitwater2totals<-findMeans(hermitwater21.totals$V1,hermitwater21.totals$V3/hermitwater2.d,hermitwater22.totals$V1,hermitwater22.totals$V3/hermitwater2.d,hermitwater23.totals$V1,hermitwater23.totals$V3/hermitwater2.d)
hermitwater2totals$ratios<-hermitwater2totals$mean/sum(hermitwater2totals$mean)*100

hermitairTswaptotals<-findMeans(hermitairTswap1.totals$V1,hermitairTswap1.totals$V3/hermitairTswap.d,hermitairTswap2.totals$V1,hermitairTswap2.totals$V3/hermitairTswap.d,hermitairTswap3.totals$V1,hermitairTswap3.totals$V3/hermitairTswap.d)
hermitairTswaptotals$ratios<-hermitairTswaptotals$mean/sum(hermitairTswaptotals$mean)*100

hermitwaterTswaptotals<-findMeans(hermitwaterTswap1.totals$V1,hermitwaterTswap1.totals$V3/hermitwaterTswap.d,hermitwaterTswap2.totals$V1,hermitwaterTswap2.totals$V3/hermitwaterTswap.d,hermitwaterTswap3.totals$V1,hermitwaterTswap3.totals$V3/hermitwaterTswap.d)
hermitwaterTswaptotals$ratios<-hermitwaterTswaptotals$mean/sum(hermitwaterTswaptotals$mean)*100












#Setting cutoff for hair inclusion.
cutoffuse<-1e-10 # Use -1 for all area



#### Marine Crabs #####

marineair1totals<-findMeans(marineair11.totals$V1,marineair11.totals$V5,marineair12.totals$V1,marineair12.totals$V5,marineair13.totals$V1,marineair13.totals$V5)
marineair1totals$ratios<-marineair1totals$mean/sum(marineair1totals$mean)*100
marineair1.numhairs=length(marineair1totals$mean[marineair1totals$mean>=cutoffuse])
marineair1.d<-marine.d*(marineair1.numhairs/205)
marineair1totals<-findMeans(marineair11.totals$V1,marineair11.totals$V5/marineair1.d,marineair12.totals$V1,marineair12.totals$V5/marineair1.d,marineair13.totals$V1,marineair13.totals$V5/marineair1.d)

marinewater1totals<-findMeans(marinewater11.totals$V1,marinewater11.totals$V5,marinewater12.totals$V1,marinewater12.totals$V5,marinewater13.totals$V1,marinewater13.totals$V5)
marinewater1totals$ratios<-marinewater1totals$mean/sum(marinewater1totals$mean)*100
marinewater1.numhairs=length(marinewater1totals$mean[marinewater1totals$mean>=cutoffuse])
marinewater1.d<-marine.d*(marinewater1.numhairs/205)
marinewater1totals<-findMeans(marinewater11.totals$V1,marinewater11.totals$V5/marinewater1.d,marinewater12.totals$V1,marinewater12.totals$V5/marinewater1.d,marinewater13.totals$V1,marinewater13.totals$V5/marinewater1.d)

marineairdwatertotals<-findMeans(marineairdwater1.totals$V1,marineairdwater1.totals$V5,marineairdwater2.totals$V1,marineairdwater2.totals$V5,marineairdwater3.totals$V1,marineairdwater3.totals$V5)
marineairdwatertotals$ratios<-marineairdwatertotals$mean/sum(marineairdwatertotals$mean)*100
marineairdwater.numhairs=length(marineairdwatertotals$mean[marineairdwatertotals$mean>=cutoffuse])
marineairdwater.d<-marine.d*(marineairdwater.numhairs/205)
marineairdwatertotals<-findMeans(marineairdwater1.totals$V1,marineairdwater1.totals$V5/marineairdwater.d,marineairdwater2.totals$V1,marineairdwater2.totals$V5/marineairdwater.d,marineairdwater2.totals$V1,marineairdwater3.totals$V5/marineairdwater.d)

marinewaterdairtotals<-findMeans(marinewaterdair1.totals$V1,marinewaterdair1.totals$V5,marinewaterdair2.totals$V1,marinewaterdair2.totals$V5,marinewaterdair3.totals$V1,marinewaterdair3.totals$V5)
marinewaterdairtotals$ratios<-marinewaterdairtotals$mean/sum(marinewaterdairtotals$mean)*100
marinewaterdair.numhairs=length(marinewaterdairtotals$mean[marinewaterdairtotals$mean>=cutoffuse])
marinewaterdair.d<-marine.d*(marinewaterdair.numhairs/205)
marinewaterdairtotals<-findMeans(marinewaterdair1.totals$V1,marinewaterdair1.totals$V5/marinewaterdair.d,marinewaterdair2.totals$V1,marinewaterdair2.totals$V5/marinewaterdair.d,marinewaterdair2.totals$V1,marinewaterdair2.totals$V5/marinewaterdair.d)

marineair2totals<-findMeans(marineair21.totals$V1,marineair21.totals$V5,marineair22.totals$V1,marineair22.totals$V5,marineair22.totals$V1,marineair22.totals$V5)
marineair2totals$ratios<-marineair2totals$mean/sum(marineair2totals$mean)*100
marineair2.numhairs=length(marineair2totals$mean[marineair2totals$mean>=cutoffuse])
marineair2.d<-marine.d*(marineair2.numhairs/205)
marineair2totals<-findMeans(marineair21.totals$V1,marineair21.totals$V5/marineair2.d,marineair22.totals$V1,marineair22.totals$V5/marineair2.d,marineair22.totals$V1,marineair22.totals$V5/marineair2.d)

marinewater2totals<-findMeans(marinewater21.totals$V1,marinewater21.totals$V5,marinewater22.totals$V1,marinewater22.totals$V5,marinewater23.totals$V1,marinewater23.totals$V5)
marinewater2totals$ratios<-marinewater2totals$mean/sum(marinewater2totals$mean)*100
marinewater2.numhairs=length(marinewater2totals$mean[marinewater2totals$mean>=cutoffuse])
marinewater2.d<-marine.d*(marinewater2.numhairs/205)
marinewater2totals<-findMeans(marinewater21.totals$V1,marinewater21.totals$V5/marinewater2.d,marinewater22.totals$V1,marinewater22.totals$V5/marinewater2.d,marinewater22.totals$V1,marinewater22.totals$V5/marinewater2.d)

marineairTswaptotals<-findMeans(marineairTswap1.totals$V1,marineairTswap1.totals$V5,marineairTswap2.totals$V1,marineairTswap2.totals$V5,marineairTswap2.totals$V1,marineairTswap2.totals$V5)
marineairTswaptotals$ratios<-marineairTswaptotals$mean/sum(marineairTswaptotals$mean)*100
marineairTswap.numhairs=length(marineairTswaptotals$mean[marineairTswaptotals$mean>=cutoffuse])
marineairTswap.d<-marine.d*(marineairTswap.numhairs/205)
marineairTswaptotals<-findMeans(marineairTswap1.totals$V1,marineairTswap1.totals$V5/marineairTswap.d,marineairTswap2.totals$V1,marineairTswap2.totals$V5/marineairTswap.d,marineairTswap2.totals$V1,marineairTswap2.totals$V5/marineairTswap.d)

marinewaterTswaptotals<-findMeans(marinewaterTswap1.totals$V1,marinewaterTswap1.totals$V5,marinewaterTswap2.totals$V1,marinewaterTswap2.totals$V5,marinewaterTswap3.totals$V1,marinewaterTswap3.totals$V5)
marinewaterTswaptotals$ratios<-marinewaterTswaptotals$mean/sum(marinewaterTswaptotals$mean)*100
marinewaterTswap.numhairs=length(marinewaterTswaptotals$mean[marinewaterTswaptotals$mean>=cutoffuse])
marinewaterTswap.d<-marine.d*(marinewaterTswap.numhairs/205)
marinewaterTswaptotals<-findMeans(marinewaterTswap1.totals$V1,marinewaterTswap1.totals$V5/marinewaterTswap.d,marinewaterTswap2.totals$V1,marinewaterTswap2.totals$V5/marinewaterTswap.d,marinewaterTswap2.totals$V1,marinewaterTswap2.totals$V5/marinewaterTswap.d)







###############################
##### Thin filament plot ######

#calculate mean at each time step

hermitair1<-findMeans(hermitair11.perstepdata$V1,hermitair11.perstepdata$Cadj/hermitair1.d,hermitair12.perstepdata$V1,hermitair12.perstepdata$Cadj/hermitair1.d,hermitair13.perstepdata$V1,hermitair13.perstepdata$Cadj/hermitair1.d)

hermitwater1<-findMeans(hermitwater11.perstepdata$V1,hermitwater11.perstepdata$Cadj/hermitwater1.d,hermitwater12.perstepdata$V1,hermitwater12.perstepdata$Cadj/hermitwater1.d,hermitwater13.perstepdata$V1,hermitwater13.perstepdata$Cadj/hermitwater1.d)

marineair1<-findMeans(marineair11.perstepdata$V1,marineair11.perstepdata$Cadj/marineair1.d,marineair12.perstepdata$V1,marineair12.perstepdata$Cadj/marineair1.d,marineair13.perstepdata$V1,marineair13.perstepdata$Cadj/marineair1.d) 

marinewater1<-findMeans(marinewater11.perstepdata$V1,marinewater11.perstepdata$Cadj/marinewater1.d,marinewater12.perstepdata$V1,marinewater12.perstepdata$Cadj/marinewater1.d,marinewater13.perstepdata$V1,marinewater13.perstepdata$Cadj/marinewater1.d)



hermitairdwater<-findMeans2(hermitairdwater2.perstepdata$V1,hermitairdwater2.perstepdata$Cadj/hermitairdwater.d,hermitairdwater3.perstepdata$V1,hermitairdwater3.perstepdata$Cadj/hermitairdwater.d)

hermitwaterdair<-findMeans(hermitwaterdair1.perstepdata$V1,hermitwaterdair1.perstepdata$Cadj/hermitwaterdair.d,hermitwaterdair2.perstepdata$V1,hermitwaterdair2.perstepdata$Cadj/hermitwaterdair.d,hermitwaterdair3.perstepdata$V1,hermitwaterdair3.perstepdata$Cadj/hermitwaterdair.d)

marineairdwater<-findMeans(marineairdwater1.perstepdata$V1,marineairdwater1.perstepdata$Cadj/marineairdwater.d,marineairdwater2.perstepdata$V1,marineairdwater2.perstepdata$Cadj/marineairdwater.d,marineairdwater3.perstepdata$V1,marineairdwater3.perstepdata$Cadj/marineairdwater.d)

marinewaterdair<-findMeans(marinewaterdair1.perstepdata$V1,marinewaterdair1.perstepdata$Cadj/marinewaterdair.d,marinewaterdair2.perstepdata$V1,marinewaterdair2.perstepdata$Cadj/marinewaterdair.d,marinewaterdair3.perstepdata$V1,marinewaterdair3.perstepdata$Cadj/marinewaterdair.d)







###############################
##### Thick filament plot ######

#calculate mean at each time step

hermitair2<-findMeans(hermitair21.perstepdata$V1,hermitair21.perstepdata$Cadj/hermitair2.d,hermitair22.perstepdata$V1,hermitair22.perstepdata$Cadj/hermitair2.d,hermitair23.perstepdata$V1,hermitair23.perstepdata$Cadj/hermitair2.d)

hermitwater2<-findMeans(hermitwater21.perstepdata$V1,hermitwater21.perstepdata$Cadj/hermitwater2.d,hermitwater22.perstepdata$V1,hermitwater22.perstepdata$Cadj/hermitwater2.d,hermitwater23.perstepdata$V1,hermitwater23.perstepdata$Cadj/hermitwater2.d)

marineair2<-findMeans(marineair21.perstepdata$V1,marineair21.perstepdata$Cadj/marineair2.d,marineair22.perstepdata$V1,marineair22.perstepdata$Cadj/marineair2.d,marineair23.perstepdata$V1,marineair23.perstepdata$Cadj/marineair2.d)

marinewater2<-findMeans(marinewater21.perstepdata$V1,marinewater21.perstepdata$Cadj/marinewater2.d,marinewater22.perstepdata$V1,marinewater22.perstepdata$Cadj/marinewater2.d,marinewater23.perstepdata$V1,marinewater23.perstepdata$Cadj/marinewater2.d)

hermitairTswap<-findMeans(hermitairTswap1.perstepdata$V1,hermitairTswap1.perstepdata$Cadj/hermitairTswap.d,hermitairTswap2.perstepdata$V1,hermitairTswap2.perstepdata$Cadj/hermitairTswap.d,hermitairTswap3.perstepdata$V1,hermitairTswap3.perstepdata$Cadj/hermitairTswap.d)

hermitwaterTswap<-findMeans(hermitwaterTswap1.perstepdata$V1,hermitwaterTswap1.perstepdata$Cadj/hermitwaterTswap.d,hermitwaterTswap2.perstepdata$V1,hermitwaterTswap2.perstepdata$Cadj/hermitwaterTswap.d,hermitwaterTswap3.perstepdata$V1,hermitwaterTswap3.perstepdata$Cadj/hermitwaterTswap.d)

marineairTswap<-findMeans(marineairTswap1.perstepdata$V1,marineairTswap1.perstepdata$Cadj/marineairTswap.d,marineairTswap2.perstepdata$V1,marineairTswap2.perstepdata$Cadj/marineairTswap.d,marineairTswap3.perstepdata$V1,marineairTswap3.perstepdata$Cadj/marineairTswap.d)

marinewaterTswap<-findMeans(marinewaterTswap1.perstepdata$V1,marinewaterTswap1.perstepdata$Cadj/marinewaterTswap.d,marinewaterTswap2.perstepdata$V1,marinewaterTswap2.perstepdata$Cadj/marinewaterTswap.d,marinewaterTswap3.perstepdata$V1,marinewaterTswap3.perstepdata$Cadj/marinewaterTswap.d)








