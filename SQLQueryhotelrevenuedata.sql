--To see the total revenue for each hotel in 2018, 2019 and 2020:

with hotels as (
Select * 
From Hotelproject.dbo.[2018]
UNION
Select * 
From Hotelproject.dbo.[2019]
UNION
Select * 
From Hotelproject.dbo.[2020]
)


Select 
Arrival_date_year,hotel, round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as Revenue 
from hotels
group by arrival_date_year, hotel



--Now we want to see only the revenue from the customers who came with babies, so we can figure out that they aren't a huge part of the total profit:

with hotels as (
Select * From ProjectSQL.dbo.[2018]
union
Select * From ProjectSQL.dbo.[2019]
union
Select * From ProjectSQL.dbo.[2020])


Select 
Arrival_date_year,
hotel,
SUM(babies) as Total_of_babies,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as Revenue 
from hotels
where babies >= 1
group by arrival_date_year, hotel

--Now we need to know how many males and females are coming to the hotels over 30
Select Gender, COUNT(Gender) as CountGender
From
WHere Age >=31
GROUP BY Gender
ORDER BY CountGender DESC


--Using Joins to combine data
with hotels as 
(
Select * From Hotelproject.dbo.[2018]
union
Select * From Hotelproject.dbo.[2019]
union
Select * From Hotelproject.dbo.[2020]
)


Select * from hotels
left join dbo.market_segment
on hotels.market_segment = market_segment.market_segment
left join dbo.meal_cost
on meal_cost.meal = hotels.meal

