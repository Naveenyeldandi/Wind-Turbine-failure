# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 21:11:48 2023

@author: Naveen Yeldandi
"""

import pandas as pd

wind_turbine = pd.read_csv(r"C:\360 DigitMG\Project\Project Data Set\Wind_turbine.csv") #To read the data

# Exploratory Data Analysis
# Measures of Central Tendency / First moment business decision
wind_turbine.mean() # To find mean
wind_turbine.median() # To find median
wind_turbine.mode() # To find the mode (mode is only for categorical data)

# Measures of dispersion / Second moment of business decision
wind_turbine.var() #Variance
wind_turbine.std() #Standard Deviation


# Third moment of business decision skewness
wind_turbine.skew() # To find skewness

# Fourth moment of business decision kurtosis
wind_turbine.kurtosis() # To find kurtosis

#Data Pre-processing
#Type casting
wind_turbine.dtypes

wind_turbine.drop(['Unnamed: 16'],axis=1,inplace=True)
wind_turbine.columns
duplicate = wind_turbine.duplicated()  
duplicate
sum(duplicate)

# wind_turbine_1 = wind_turbine.drop_duplicates() #There no duplictes in this data
# wind_turbine_1

# Rename the column 
wind_turbine = wind_turbine.rename(columns={'Bearing_temperature)':'Bearing_temperature'})

# we have some missing values in it
# Missing Values 
# Imputation
import numpy as np
from sklearn.impute import SimpleImputer
wind_turbine.isna().sum()


# Median Imputer
median_imputer = SimpleImputer(missing_values = np.nan, strategy = 'median')
wind_turbine[["Wind_speed","Power","Nacelle_ambient_temperature",
              "Nacelle_temperature","Generator_speed","Yaw_angle",
              "Gear_box_inlet_temperature"]] = pd.DataFrame(
                  median_imputer.fit_transform(wind_turbine[["Wind_speed","Power",
                    "Nacelle_ambient_temperature","Nacelle_temperature",
                    "Generator_speed","Yaw_angle","Gear_box_inlet_temperature"]]))
                  
wind_turbine.isna().sum()                  


# To find the Outlier 
import seaborn as sns
sns.boxplot(wind_turbine.Wind_speed)
sns.boxplot(wind_turbine.Power)
sns.boxplot(wind_turbine.Nacelle_ambient_temperature)
sns.boxplot(wind_turbine.Generator_bearing_temperature)
sns.boxplot(wind_turbine.Gear_oil_temperature)
sns.boxplot(wind_turbine.Ambient_temperature)
sns.boxplot(wind_turbine.Rotor_Speed)
sns.boxplot(wind_turbine.Nacelle_temperature)
sns.boxplot(wind_turbine.Bearing_temperature)
sns.boxplot(wind_turbine.Generator_speed)
sns.boxplot(wind_turbine.Yaw_angle)
sns.boxplot(wind_turbine.Wind_direction)
sns.boxplot(wind_turbine.Wheel_hub_temperature)
sns.boxplot(wind_turbine.Gear_box_inlet_temperature)
sns.boxplot(wind_turbine.Failure_status)


# To detect the outliers 
 # pip install feature_engine
from feature_engine.outliers import Winsorizer
winsor_iqr = Winsorizer(capping_method = 'iqr', 
                          tail = 'both',  
                          fold = 1.5, 
                          variables = ['Wind_speed','Power','Nacelle_ambient_temperature',
                                       'Generator_bearing_temperature','Gear_oil_temperature',
                                       'Ambient_temperature','Rotor_Speed','Nacelle_temperature',
                                       'Bearing_temperature','Generator_speed','Yaw_angle',
                                       'Wind_direction','Wheel_hub_temperature','Gear_box_inlet_temperature'])

wind_turbine_n = winsor_iqr.fit_transform(wind_turbine[['Wind_speed','Power','Nacelle_ambient_temperature',
             'Generator_bearing_temperature','Gear_oil_temperature',
             'Ambient_temperature','Rotor_Speed','Nacelle_temperature',
             'Bearing_temperature','Generator_speed','Yaw_angle',
             'Wind_direction','Wheel_hub_temperature','Gear_box_inlet_temperature']])

winsor_iqr
sns.boxplot(wind_turbine_n.Wind_speed)
sns.boxplot(wind_turbine_n.Power)
sns.boxplot(wind_turbine_n.Nacelle_ambient_temperature)
sns.boxplot(wind_turbine_n.Generator_bearing_temperature)
sns.boxplot(wind_turbine_n.Gear_oil_temperature)
sns.boxplot(wind_turbine_n.Ambient_temperature)
sns.boxplot(wind_turbine_n.Rotor_Speed)
sns.boxplot(wind_turbine_n.Nacelle_temperature)
sns.boxplot(wind_turbine_n.Bearing_temperature)
sns.boxplot(wind_turbine_n.Generator_speed)
sns.boxplot(wind_turbine_n.Yaw_angle)
sns.boxplot(wind_turbine_n.Wind_direction)
sns.boxplot(wind_turbine_n.Wheel_hub_temperature)
sns.boxplot(wind_turbine_n.Gear_box_inlet_temperature)

# Q-Q Plot 
import pylab
import scipy.stats as stats
# Checking whether data is normally distributed
stats.probplot(wind_turbine_n.Wind_speed, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Power, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Nacelle_ambient_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Generator_bearing_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Gear_oil_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Ambient_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Rotor_Speed, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Nacelle_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Bearing_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Generator_speed, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Yaw_angle, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Wind_direction, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Wheel_hub_temperature, dist = "norm", plot = pylab)
stats.probplot(wind_turbine_n.Gear_box_inlet_temperature, dist = "norm", plot = pylab)



# TRANSFORMATION 
import scipy.stats as stats
import pylab
stats.probplot(np.log(wind_turbine_n.Wind_speed),dist='norm',plot=pylab)
stats.boxcox(wind_turbine_n.Power)
from feature_engine import transformation

power=transformation.YeoJohnsonTransformer(variables='Power')
wind_turbine_n['Power']=power.fit_transform(wind_turbine_n[['Power']])

windspeed=transformation.YeoJohnsonTransformer(variables='Wind_speed')
wind_turbine_n['Wind_speed']=windspeed.fit_transform(wind_turbine_n[['Wind_speed']])

nat=transformation.YeoJohnsonTransformer(variables='Nacelle_ambient_temperature')
wind_turbine_n['Nacelle_ambient_temperature']=nat.fit_transform(wind_turbine_n[['Nacelle_ambient_temperature']])

gbt=transformation.YeoJohnsonTransformer(variables='Generator_bearing_temperature')
wind_turbine_n['Generator_bearing_temperature']=gbt.fit_transform(wind_turbine_n[['Generator_bearing_temperature']])

got=transformation.YeoJohnsonTransformer(variables='Gear_oil_temperature')
wind_turbine_n['Gear_oil_temperature']=got.fit_transform(wind_turbine_n[['Gear_oil_temperature']])

at=transformation.YeoJohnsonTransformer(variables='Ambient_temperature')
wind_turbine_n['Ambient_temperature']=at.fit_transform(wind_turbine_n[['Ambient_temperature']])


rs=transformation.YeoJohnsonTransformer(variables='Rotor_Speed')
wind_turbine_n['Rotor_Speed']=rs.fit_transform(wind_turbine_n[['Rotor_Speed']])


nt=transformation.YeoJohnsonTransformer(variables='Nacelle_temperature')
wind_turbine_n['Nacelle_temperature']=nt.fit_transform(wind_turbine_n[['Nacelle_temperature']])


bt=transformation.YeoJohnsonTransformer(variables='Bearing_temperature')
wind_turbine_n['Bearing_temperature']=bt.fit_transform(wind_turbine_n[['Bearing_temperature']])

gs=transformation.YeoJohnsonTransformer(variables='Generator_speed')
wind_turbine_n['Generator_speed']=gs.fit_transform(wind_turbine_n[['Generator_speed']])

yw=transformation.YeoJohnsonTransformer(variables='Yaw_angle')
wind_turbine_n['Yaw_angle']=yw.fit_transform(wind_turbine_n[['Yaw_angle']])


wd=transformation.YeoJohnsonTransformer(variables='Wind_direction')
wind_turbine_n['Wind_direction']=wd.fit_transform(wind_turbine_n[['Wind_direction']])

wht=transformation.YeoJohnsonTransformer(variables='Wheel_hub_temperature')
wind_turbine_n['Wheel_hub_temperature']=wht.fit_transform(wind_turbine_n[['Wheel_hub_temperature']])

gbit=transformation.YeoJohnsonTransformer(variables='Gear_box_inlet_temperature')
wind_turbine_n['Gear_box_inlet_temperature']=gbit.fit_transform(wind_turbine_n[['Gear_box_inlet_temperature']])

#DATA SCALING -
#STANDARDISATION
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
wind_turbine_n['Wind_speed']=scaler.fit_transform(wind_turbine_n[['Wind_speed']])
wind_turbine_n['Power']=scaler.fit_transform(wind_turbine_n[['Power']])
wind_turbine_n['Nacelle_ambient_temperature']=scaler.fit_transform(wind_turbine_n[['Nacelle_ambient_temperature']])
wind_turbine_n['Generator_bearing_temperature']=scaler.fit_transform(wind_turbine_n[['Generator_bearing_temperature']])
wind_turbine_n['Gear_oil_temperature']=scaler.fit_transform(wind_turbine_n[['Gear_oil_temperature']])
wind_turbine_n['Ambient_temperature']=scaler.fit_transform(wind_turbine_n[['Ambient_temperature']])
wind_turbine_n['Rotor_Speed']=scaler.fit_transform(wind_turbine_n[['Rotor_Speed']])
wind_turbine_n['Nacelle_temperature']=scaler.fit_transform(wind_turbine_n[['Nacelle_temperature']])
wind_turbine_n['Bearing_temperature']=scaler.fit_transform(wind_turbine_n[['Bearing_temperature']])
wind_turbine_n['Wheel_hub_temperature']=scaler.fit_transform(wind_turbine_n[['Wheel_hub_temperature']])
wind_turbine_n['Gear_box_inlet_temperature']=scaler.fit_transform(wind_turbine_n[['Gear_box_inlet_temperature']])
wind_turbine_n['Generator_speed']=scaler.fit_transform(wind_turbine_n[['Generator_speed']])
wind_turbine_n['Yaw_angle']=scaler.fit_transform(wind_turbine_n[['Yaw_angle']])
wind_turbine_n['Wind_direction']=scaler.fit_transform(wind_turbine_n[['Wind_direction']])

wind_turbine_n


m=wind_turbine_n.mean()
n=wind_turbine_n.std()











