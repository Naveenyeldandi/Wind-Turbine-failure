create database project;
use project;

select*from wind_turbine;
--  To find Mean --
select avg(Wind_speed) as mean_Wind_speed
from wind_turbine;
select avg(Power) as mean_Power
from wind_turbine;
select avg(Nacelle_ambient_temperature) as mean_Nacelle_ambient_temperature
from wind_turbine;
select avg(Generator_bearing_temperature) as mean_Generator_bearing_temperature
from wind_turbine;
select avg(Gear_oil_temperature) as mean_Gear_oil_temperature
from wind_turbine;
select avg(Ambient_temperature) as mean_Ambient_temperature
from wind_turbine;
select avg(Rotor_Speed) as mean_Rotor_Speed
from wind_turbine;
select avg(Nacelle_temperature) as mean_Nacelle_temperature
from wind_turbine;
select avg(Generator_speed) as mean_Generator_speed
from wind_turbine;
select avg(Yaw_angle) as mean_Yaw_angle
from wind_turbine;
select avg(Wind_direction) as mean_Wind_direction
from wind_turbine;
select avg(Wheel_hub_temperature) as mean_Wheel_hub_temperature
from wind_turbine;
select avg(Gear_box_inlet_temperature) as mean_Gear_box_inlet_temperature
from wind_turbine;


-- To Find Median --
select Wind_speed as median_wind_speed
FROM (
    SELECT wind_speed, ROW_NUMBER() OVER (ORDER BY wind_speed) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 16.55 --

select power as median_power
FROM (
    SELECT power, ROW_NUMBER() OVER (ORDER BY power) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 2.78 --

select Nacelle_ambient_temperature as median_Nacelle_ambient_temperature
FROM (
    SELECT Nacelle_ambient_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_ambient_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 23.03 --

select Generator_bearing_temperature as median_Generator_bearing_temperature
FROM (
    SELECT Generator_bearing_temperature, ROW_NUMBER() OVER (ORDER BY Generator_bearing_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Gear_oil_temperature as median_Gear_oil_temperature
FROM (
    SELECT Gear_oil_temperature, ROW_NUMBER() OVER (ORDER BY Gear_oil_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Ambient_temperature as median_Ambient_temperature
FROM (
    SELECT Ambient_temperature, ROW_NUMBER() OVER (ORDER BY Ambient_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Rotor_Speed as median_Rotor_Speed
FROM (
    SELECT Rotor_Speed, ROW_NUMBER() OVER (ORDER BY Rotor_Speed) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Nacelle_temperature as median_Nacelle_temperature
FROM (
    SELECT Nacelle_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 44.9 --


select Generator_speed as median_Generator_speed
FROM (
    SELECT Generator_speed, ROW_NUMBER() OVER (ORDER BY Generator_speed) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 1403.41 --

select Yaw_angle as median_Yaw_angle
FROM (
    SELECT Yaw_angle, ROW_NUMBER() OVER (ORDER BY Yaw_angle) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 32.22 --

select Wind_direction as median_Wind_direction
FROM (
    SELECT Wind_direction, ROW_NUMBER() OVER (ORDER BY Wind_direction) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Wheel_hub_temperature as median_Wheel_hub_temperature
FROM (
    SELECT Wheel_hub_temperature, ROW_NUMBER() OVER (ORDER BY Wheel_hub_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

select Gear_box_inlet_temperature as median_Gear_box_inlet_temperature
FROM (
    SELECT Gear_box_inlet_temperature, ROW_NUMBER() OVER (ORDER BY Gear_box_inlet_temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2; -- 15.87 --

-- Mode --
SELECT Failure_status AS mode_Failure_status
FROM (
SELECT Failure_status, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Failure_status
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

-- second moment business decision --
# standard deviation and variance

SELECT VARIANCE(power) AS power_variance FROM wind_turbine; --- variance
SELECT VARIANCE(Wind_speed) AS power_variance FROM wind_turbine; --- variance
SELECT VARIANCE(Generator_speed) AS power_variance FROM wind_turbine; --- variance

SELECT STDDEV(power) AS power_stddev FROM wind_turbine; --- standard deviation
SELECT STDDEV(Wind_speed) AS Wind_speed_stddev FROM wind_turbine; --- standard deviation
SELECT STDDEV(Generator_speed) AS Generator_speed_stddev FROM wind_turbine; --- standard deviation

SELECT MAX(power) - MIN(power) AS experience_range FROM wind_turbine; --- Range
SELECT MAX(Wind_speed) - MIN(Wind_speed) AS experience_range FROM wind_turbine; --- Range
SELECT MAX(Generator_speed) - MIN(Generator_speed) AS experience_range FROM wind_turbine; --- Range



select (select std(Wind_speed)) as std ,(select variance(wind_speed)) as variance from wind_turbine;
select (select std(power)) as std,(select variance(power)) as variance from wind_turbine;
select (select std(Nacelle_ambient_temperature)) as std,(select variance(Nacelle_ambient_temperature)) as variance from wind_turbine; 
select (select std(Generator_bearing_temperature)) as std,(select variance(Generator_bearing_temperature)) as variance from wind_turbine;
select (select std(Gear_oil_temperature)) as std,(select variance(Gear_oil_temperature)) as variance from wind_turbine;
select (select std(Ambient_temperature)) as std,(select variance(Ambient_temperature)) as variance from wind_turbine;
select (select std(Rotor_Speed)) as std,(select variance(Rotor_Speed)) as variance from wind_turbine;
select (select std(Nacelle_temperature)) as std,(select variance(Nacelle_temperature)) as variance from wind_turbine;
select (select std(Generator_speed)) as std,(select variance(Generator_speed)) as variance from wind_turbine;
select (select std(Yaw_angle)) as std,(select variance(Yaw_angle)) as variance from wind_turbine; 
select (select std(Wind_direction)) as std,(select variance(Wind_direction)) as variance from wind_turbine;
select (select std(Wheel_hub_temperature)) as std,(select variance(Wheel_hub_temperature)) as variance from wind_turbine;
select (select std(Gear_box_inlet_temperature)) as std,(select variance(Gear_box_inlet_temperature)) as variance from wind_turbine;



-- Third and Fourth moment busniess decision --
SELECT
    (
        SUM(POWER(wind_speed - (SELECT AVG(wind_speed) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(wind_speed) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(wind_speed - (SELECT AVG(wind_speed) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(wind_speed) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(power - (SELECT AVG(power) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(power) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(power - (SELECT AVG(power) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(power) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;


SELECT
    (
        SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

SELECT
    (
        SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 4))) - 3
    ) AS kurtosis
FROM wind_turbine;

-- Changing date format -- 
update wind_turbine set date = str_to_date(date,"%d-%m-%Y");

-- Changing date datatype from text to date
alter table wind_turbine modify column date date;

-- Checking for duplicates --
select distinct count(*) from wind_turbine;

-- Bivarient analysis
select wind_speed,power from wind_turbine;

-- Correlation coefficient value wind_speed vs power
select
(avg(Wind_speed*Power)-avg(Wind_speed)*avg(Power))/
(sqrt(avg(wind_speed*wind_speed)-avg(Wind_speed)*avg(Wind_speed))*sqrt(avg(Power*Power)-avg(Power)*avg(Power)))
from wind_turbine;

-- Checking For Missing Values --
select count(*) from wind_turbine where date is null;
select count(*) from wind_turbine where Wind_speed is null; -- Yes
select count(*) from wind_turbine where power is null; -- Yes --
select count(*) from wind_turbine where Nacelle_ambient_temperature is null; -- Yes --
select count(*) from wind_turbine where Generator_bearing_temperature is null; 
select count(*) from wind_turbine where Gear_oil_temperature is null;
select count(*) from wind_turbine where Ambient_temperature is null;
select count(*) from wind_turbine where Rotor_Speed is null;
select count(*) from wind_turbine where Nacelle_temperature is null; -- Yes --
select count(*) from wind_turbine where Bearing_temperature is null;
select count(*) from wind_turbine where Generator_speed is null; -- Yes --
select count(*) from wind_turbine where Yaw_angle is null; -- Yes --
select count(*) from wind_turbine where Wind_direction is null;
select count(*) from wind_turbine where Wheel_hub_temperature is null;
select count(*) from wind_turbine where Gear_box_inlet_temperature is null; -- Yes --
select count(*) from wind_turbine where Failure_status is null; 

-- To imputing Missing Values -- 
update wind_turbine set Wind_speed = 16.55 where Wind_speed is null;
update wind_turbine set power = 2.78 where power is null;
update wind_turbine set Nacelle_ambient_temperature = 23.03 where Nacelle_ambient_temperature is null;
update wind_turbine set Nacelle_temperature = 44.9 where Nacelle_temperature is null;
update wind_turbine set Generator_speed = 1403.41 where Generator_speed is null;
update wind_turbine set Yaw_angle = 32.22 where Yaw_angle is null;
update wind_turbine set Gear_box_inlet_temperature = 15.87 where Gear_box_inlet_temperature is null;
select*from wind_turbine;



-- Find the outliers --
select * from (select Wind_speed,(Wind_speed-avg(Wind_speed) over ()) /std(Wind_speed) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3;

select * from (select power,(power-avg(power) over ()) /std(power) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Nacelle_ambient_temperature,(Nacelle_ambient_temperature-avg(Nacelle_ambient_temperature) over ()) /std(Nacelle_ambient_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Generator_bearing_temperature,(Generator_bearing_temperature-avg(Generator_bearing_temperature) over ()) /std(Generator_bearing_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Gear_oil_temperature,(Gear_oil_temperature-avg(Gear_oil_temperature) over ()) /std(Gear_oil_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3;

select * from (select Ambient_temperature,(Ambient_temperature-avg(Ambient_temperature) over ()) /std(Ambient_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Rotor_Speed,(Rotor_Speed-avg(Rotor_Speed) over ()) /std(Rotor_Speed) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Nacelle_temperature,(Nacelle_temperature-avg(Nacelle_temperature) over ()) /std(Nacelle_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Bearing_temperature,(Bearing_temperature-avg(Bearing_temperature) over ()) /std(Bearing_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Generator_speed,(Generator_speed-avg(Generator_speed) over ()) /std(Generator_speed) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Yaw_angle,(Yaw_angle-avg(Yaw_angle) over ()) /std(Yaw_angle) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3;

select * from (select Wind_direction,(Wind_direction-avg(Wind_direction) over ()) /std(Wind_direction) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3;

select * from (select Wheel_hub_temperature,(Wheel_hub_temperature-avg(Wheel_hub_temperature) over ()) /std(Wheel_hub_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3; 

select * from (select Gear_box_inlet_temperature,(Gear_box_inlet_temperature-avg(Gear_box_inlet_temperature) over ()) /std(Gear_box_inlet_temperature) over() as zscore 
from wind_turbine) as score_table where zscore>3 or zscore<-3;

select*from wind_turbine;


-- Outlier Treatment --
UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Wind_speed,
NTILE(4) OVER (ORDER BY Wind_speed) AS Wind_speed_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Wind_speed = subquery.Wind_speed
SET wind_turbine_1.Wind_speed = (
SELECT AVG(Wind_speed)
FROM (
SELECT
Wind_speed,
NTILE(4) OVER (ORDER BY Wind_speed) AS Wind_speed_quartile
FROM wind_turbine
) AS temp
WHERE Wind_speed_quartile = subquery.Wind_speed_quartile
)
WHERE subquery.Wind_speed_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Power,
NTILE(4) OVER (ORDER BY Power) AS Power_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Power = subquery.Power
SET wind_turbine_1.Power = (
SELECT AVG(Power)
FROM (
SELECT
Power,
NTILE(4) OVER (ORDER BY Power) AS Power_quartile
FROM wind_turbine
) AS temp
WHERE Power_quartile = subquery.Power_quartile
)
WHERE subquery.Power_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Nacelle_ambient_temperature,
NTILE(4) OVER (ORDER BY Nacelle_ambient_temperature) AS Nacelle_ambient_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Nacelle_ambient_temperature = subquery.Nacelle_ambient_temperature
SET wind_turbine_1.Nacelle_ambient_temperature = (
SELECT AVG(Nacelle_ambient_temperature)
FROM (
SELECT
Nacelle_ambient_temperature,
NTILE(4) OVER (ORDER BY Nacelle_ambient_temperature) AS Nacelle_ambient_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Nacelle_ambient_temperature_quartile = subquery.Nacelle_ambient_temperature_quartile
)
WHERE subquery.Nacelle_ambient_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Generator_bearing_temperature,
NTILE(4) OVER (ORDER BY Generator_bearing_temperature) AS Generator_bearing_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Generator_bearing_temperature = subquery.Generator_bearing_temperature
SET wind_turbine_1.Generator_bearing_temperature = (
SELECT AVG(Generator_bearing_temperature)
FROM (
SELECT
Generator_bearing_temperature,
NTILE(4) OVER (ORDER BY Generator_bearing_temperature) AS Generator_bearing_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Generator_bearing_temperature_quartile = subquery.Generator_bearing_temperature_quartile
)
WHERE subquery.Generator_bearing_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Gear_oil_temperature,
NTILE(4) OVER (ORDER BY Gear_oil_temperature) AS Gear_oil_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Gear_oil_temperature = subquery.Gear_oil_temperature
SET wind_turbine_1.Gear_oil_temperature = (
SELECT AVG(Gear_oil_temperature)
FROM (
SELECT
Gear_oil_temperature,
NTILE(4) OVER (ORDER BY Gear_oil_temperature) AS Gear_oil_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Gear_oil_temperature_quartile = subquery.Gear_oil_temperature_quartile
)
WHERE subquery.Gear_oil_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Ambient_temperature,
NTILE(4) OVER (ORDER BY Ambient_temperature) AS Ambient_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Ambient_temperature = subquery.Ambient_temperature
SET wind_turbine_1.Ambient_temperature = (
SELECT AVG(Ambient_temperature)
FROM (
SELECT
Ambient_temperature,
NTILE(4) OVER (ORDER BY Ambient_temperature) AS Ambient_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Ambient_temperature_quartile = subquery.Ambient_temperature_quartile
)
WHERE subquery.Ambient_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Rotor_Speed,
NTILE(4) OVER (ORDER BY Rotor_Speed) AS Rotor_Speed_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Rotor_Speed = subquery.Rotor_Speed
SET wind_turbine_1.Rotor_Speed = (
SELECT AVG(Rotor_Speed)
FROM (
SELECT
Rotor_Speed,
NTILE(4) OVER (ORDER BY Rotor_Speed) AS Rotor_Speed_quartile
FROM wind_turbine
) AS temp
WHERE Rotor_Speed_quartile = subquery.Rotor_Speed_quartile
)
WHERE subquery.Rotor_Speed_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Nacelle_temperature,
NTILE(4) OVER (ORDER BY Nacelle_temperature) AS Nacelle_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Nacelle_temperature = subquery.Nacelle_temperature
SET wind_turbine_1.Nacelle_temperature = (
SELECT AVG(Nacelle_temperature)
FROM (
SELECT
Nacelle_temperature,
NTILE(4) OVER (ORDER BY Nacelle_temperature) AS Nacelle_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Nacelle_temperature_quartile = subquery.Nacelle_temperature_quartile
)
WHERE subquery.Nacelle_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Bearing_temperature,
NTILE(4) OVER (ORDER BY Bearing_temperature) AS Bearing_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Bearing_temperature = subquery.Bearing_temperature
SET wind_turbine_1.Bearing_temperature = (
SELECT AVG(Bearing_temperature)
FROM (
SELECT
Bearing_temperature,
NTILE(4) OVER (ORDER BY Bearing_temperature) AS Bearing_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Bearing_temperature_quartile = subquery.Bearing_temperature_quartile
)
WHERE subquery.Bearing_temperature_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Generator_speed,
NTILE(4) OVER (ORDER BY Generator_speed) AS Generator_speed_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Generator_speed = subquery.Generator_speed
SET wind_turbine_1.Generator_speed = (
SELECT AVG(Generator_speed)
FROM (
SELECT
Generator_speed,
NTILE(4) OVER (ORDER BY Generator_speed) AS Generator_speed_quartile
FROM wind_turbine
) AS temp
WHERE Generator_speed_quartile = subquery.Generator_speed_quartile
)
WHERE subquery.Generator_speed_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Yaw_angle,
NTILE(4) OVER (ORDER BY Yaw_angle) AS Yaw_angle_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Yaw_angle = subquery.Yaw_angle
SET wind_turbine_1.Yaw_angle = (
SELECT AVG(Yaw_angle)
FROM (
SELECT
Yaw_angle,
NTILE(4) OVER (ORDER BY Yaw_angle) AS Yaw_angle_quartile
FROM wind_turbine
) AS temp
WHERE Yaw_angle_quartile = subquery.Yaw_angle_quartile
)
WHERE subquery.Yaw_angle_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Wind_direction,
NTILE(4) OVER (ORDER BY Wind_direction) AS Wind_direction_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Wind_direction = subquery.Wind_direction
SET wind_turbine_1.Wind_direction = (
SELECT AVG(Wind_direction)
FROM (
SELECT
Wind_direction,
NTILE(4) OVER (ORDER BY Wind_direction) AS Wind_direction_quartile
FROM wind_turbine
) AS temp
WHERE Wind_direction_quartile = subquery.Wind_direction_quartile
)
WHERE subquery.Wind_direction_quartile IN (1, 4);

UPDATE wind_turbine AS wind_turbine_1
JOIN (
SELECT
Gear_box_inlet_temperature,
NTILE(4) OVER (ORDER BY Gear_box_inlet_temperature) AS Gear_box_inlet_temperature_quartile
FROM wind_turbine
) AS subquery ON wind_turbine_1.Gear_box_inlet_temperature = subquery.Gear_box_inlet_temperature
SET wind_turbine_1.Gear_box_inlet_temperature = (
SELECT AVG(Gear_box_inlet_temperature)
FROM (
SELECT
Gear_box_inlet_temperature,
NTILE(4) OVER (ORDER BY Gear_box_inlet_temperature) AS Gear_box_inlet_temperature_quartile
FROM wind_turbine
) AS temp
WHERE Gear_box_inlet_temperature_quartile = subquery.Gear_box_inlet_temperature_quartile
)
WHERE subquery.Gear_box_inlet_temperature_quartile IN (1, 4);

-- Discretisation
update wind_turbine set Bearing_temperature =
case
when Bearing_temperature < 70 then 'low temperature'
when Bearing_temperature > 100 then 'high temperature'
else 'optimum temperature' 
end; 

-- Dummy Variable Creation
select * from wind_turbine;
SELECT
Failure_status,
CASE WHEN Failure_status = 'Failure' THEN 1 ELSE 0 END AS is_Failure,
CASE WHEN Failure_status = 'No_failure' THEN 1 ELSE 0 END AS is_No_failure 
FROM wind_turbine;

-- Transformations
UPDATE wind_turbine set wind_speed = SQRT(wind_speed);
SELECT
wind_speed,
SQRT(wind_speed) AS wind_speed_sqrt
FROM wind_turbine;

-- Normalization
CREATE TABLE wind_turbine_scaled as
SELECT
Wind_speed,
Power,
Nacelle_ambient_temperature,
Generator_bearing_temperature,
Gear_oil_temperature,
Ambient_temperature,
Rotor_Speed,
Nacelle_temperature,
Generator_speed,
Yaw_angle,
Wind_direction,
Wheel_hub_temperature,
Gear_box_inlet_temperature,
(Wind_speed - min_Wind_speed) / (max_Wind_speed - min_Wind_speed) AS scaled_Wind_speed,
(Power - min_Power) / (max_Power - min_Power) AS scaled_Power,
(Nacelle_ambient_temperature - min_Nacelle_ambient_temperature) / (max_Nacelle_ambient_temperature - min_Nacelle_ambient_temperature)AS scaled_Nacelle_ambient_temperature,
(Generator_bearing_temperature - min_Generator_bearing_temperature) / (max_Generator_bearing_temperature - min_Generator_bearing_temperature)AS scaled_Generator_bearing_temperature,
(Gear_oil_temperature - min_Gear_oil_temperature) / (max_Gear_oil_temperature - min_Gear_oil_temperature) AS scaled_Gear_oil_temperature,
(Ambient_temperature - min_Ambient_temperature) / (max_Ambient_temperature - min_Ambient_temperature) AS scaled_Ambient_temperature,
(Rotor_Speed - min_Rotor_Speed) / (max_Rotor_Speed - min_Rotor_Speed) AS scaled_Rotor_Speed,
(Nacelle_temperature - min_Nacelle_temperature) / (max_Nacelle_temperature - min_Nacelle_temperature) AS scaled_Nacelle_temperature,
(Generator_speed - min_Generator_speed) / (max_Generator_speed - min_Generator_speed) AS scaled_Generator_speed,
(Yaw_angle - min_Yaw_angle) / (max_Yaw_angle - min_Yaw_angle) AS scaled_Yaw_angle,
(Wind_direction - min_Wind_direction) / (max_Wind_direction - min_Wind_direction) AS scaled_Wind_direction,
(Wheel_hub_temperature - min_Wheel_hub_temperature) / (max_Wheel_hub_temperature - min_Wheel_hub_temperature) AS scaled_Wheel_hub_temperature,
(Gear_box_inlet_temperature - min_Gear_box_inlet_temperature) / (max_Gear_box_inlet_temperature - min_Gear_box_inlet_temperature) AS scaled_Gear_box_inlet_temperature
FROM (
SELECT
Wind_speed,
Power,
Nacelle_ambient_temperature,
Generator_bearing_temperature,
Gear_oil_temperature,
Ambient_temperature,
Rotor_Speed,
Nacelle_temperature,
Generator_speed,
Yaw_angle,
Wind_direction,
Wheel_hub_temperature,
Gear_box_inlet_temperature,
(SELECT MIN(Wind_speed) FROM wind_turbine) AS min_Wind_speed,
(SELECT MAX(Wind_speed) FROM wind_turbine) AS max_Wind_speed,
(SELECT MIN(Power) FROM wind_turbine) AS min_Power,
(SELECT MAX(Power) FROM wind_turbine) AS max_Power,
(SELECT MIN(Nacelle_ambient_temperature) FROM wind_turbine) AS min_Nacelle_ambient_temperature,
(SELECT MAX(Nacelle_ambient_temperature) FROM wind_turbine) AS max_Nacelle_ambient_temperature,
(SELECT MIN(Generator_bearing_temperature) FROM wind_turbine) AS min_Generator_bearing_temperature,
(SELECT MAX(Generator_bearing_temperature) FROM wind_turbine) AS max_Generator_bearing_temperature,
(SELECT MIN(Gear_oil_temperature) FROM wind_turbine) AS min_Gear_oil_temperature,
(SELECT MAX(Gear_oil_temperature) FROM wind_turbine) AS max_Gear_oil_temperature,
(SELECT MIN(Ambient_temperature) FROM wind_turbine) AS min_Ambient_temperature,
(SELECT MAX(Ambient_temperature) FROM wind_turbine) AS max_Ambient_temperature,
(SELECT MIN(Rotor_Speed) FROM wind_turbine) AS min_Rotor_Speed,
(SELECT MAX(Rotor_Speed) FROM wind_turbine) AS max_Rotor_Speed,
(SELECT MIN(Nacelle_temperature) FROM wind_turbine) AS min_Nacelle_temperature ,
(SELECT MAX(Nacelle_temperature) FROM wind_turbine) AS max_Nacelle_temperature,
(SELECT MIN(Generator_speed) FROM wind_turbine) AS min_Generator_speed ,
(SELECT MAX(Generator_speed) FROM wind_turbine) AS max_Generator_speed,
(SELECT MIN(Yaw_angle) FROM wind_turbine) AS min_Yaw_angle,
(SELECT MAX(Yaw_angle) FROM wind_turbine) AS max_Yaw_angle,
(SELECT MIN(Wind_direction) FROM wind_turbine) AS min_Wind_direction,
(SELECT MAX(Wind_direction) FROM wind_turbine) AS max_Wind_direction,
(SELECT MIN(Wheel_hub_temperature) FROM wind_turbine) AS min_Wheel_hub_temperature ,
(SELECT MAX(Wheel_hub_temperature) FROM wind_turbine) AS max_Wheel_hub_temperature,
(SELECT MIN(Gear_box_inlet_temperature) FROM wind_turbine) AS min_Gear_box_inlet_temperature ,
(SELECT MAX(Gear_box_inlet_temperature) FROM wind_turbine) AS max_Gear_box_inlet_temperature

FROM wind_turbine
) AS scaled_data;

-- After Data-preprocessing -- 
-- Mean --
select avg(scaled_Wind_speed) as mean_scaled_Wind_speed
from wind_turbine_scaled; -- 0.46 --
select avg(scaled_Power) as mean_scaled_Power
from wind_turbine_scaled; -- 0.40 --
select avg(scaled_Nacelle_ambient_temperature) as mean_scaled_Nacelle_ambient_temperature
from wind_turbine_scaled; -- 0.561 --
select avg(scaled_Generator_bearing_temperature) as mean_scaled_Generator_bearing_temperature
from wind_turbine_scaled; -- 0.48 --
select avg(scaled_Gear_oil_temperature) as mean_scaled_Gear_oil_temperature
from wind_turbine_scaled; -- 0.41 --
select avg(scaled_Ambient_temperature) as mean_scaled_Ambient_temperature
from wind_turbine_scaled; -- 0.43 --
select avg(scaled_Rotor_Speed) as mean_scaled_Rotor_Speed
from wind_turbine_scaled; -- 0.47 --
select avg(scaled_Nacelle_temperature) as mean_scaled_Nacelle_temperature
from wind_turbine_scaled; -- 0.498 --
select avg(scaled_Generator_speed) as mean_scaled_Generator_speed
from wind_turbine_scaled; -- 0.49 --
select avg(scaled_Yaw_angle) as mean_scaled_Yaw_angle
from wind_turbine_scaled; -- 0.43 --
select avg(scaled_Wind_direction) as mean_scaled_Wind_direction
from wind_turbine_scaled; -- 0.40 --
select avg(scaled_Wheel_hub_temperature) as mean_scaled_Wheel_hub_temperature
from wind_turbine_scaled; -- 0.52 --
select avg(scaled_Gear_box_inlet_temperature) as mean_Gear_scaled_box_inlet_temperature
from wind_turbine_scaled; -- 0.30 --

-- Standard deviation -- 
select std(scaled_Wind_speed) as std_scaled_Wind_speed
from wind_turbine_scaled; -- 0.366 --
select std(scaled_Power) as std_scaled_Power
from wind_turbine_scaled; -- 0.368 --
select std(scaled_Nacelle_ambient_temperature) as std_scaled_Nacelle_ambient_temperature
from wind_turbine_scaled; -- 0.389 --
select std(scaled_Generator_bearing_temperature) as std_scaled_Generator_bearing_temperature
from wind_turbine_scaled; -- 0.361 --
select std(scaled_Gear_oil_temperature) as std_scaled_Gear_oil_temperature
from wind_turbine_scaled; -- 0.372 --
select std(scaled_Ambient_temperature) as std_scaled_Ambient_temperature
from wind_turbine_scaled; -- 0.371 --
select std(scaled_Rotor_Speed) as mean_scaled_Rotor_Speed
from wind_turbine_scaled; -- 0.366 --
select std(scaled_Nacelle_temperature) as std_scaled_Nacelle_temperature
from wind_turbine_scaled; -- 0.359 --
select std(scaled_Generator_speed) as std_scaled_Generator_speed
from wind_turbine_scaled; -- 0.361 --
select avg(scaled_Yaw_angle) as std_scaled_Yaw_angle
from wind_turbine_scaled; -- 0.435 --
select avg(scaled_Wind_direction) as std_scaled_Wind_direction
from wind_turbine_scaled; -- 0.404 --
select avg(scaled_Wheel_hub_temperature) as std_scaled_Wheel_hub_temperature
from wind_turbine_scaled; -- 0.525 --
select avg(scaled_Gear_box_inlet_temperature) as std_Gear_scaled_box_inlet_temperature
from wind_turbine_scaled; -- 0.305 --
select*from wind_turbine_scaled;