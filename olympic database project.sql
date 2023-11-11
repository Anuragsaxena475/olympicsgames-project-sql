-- (1) fetch the details of the all the countries which have won most number of medals.
select team, sum(gold),
sum(silver),
sum(bronze)
from(
		select*, 
			case medal when "gold" then 1 else 0 end as gold,
			case medal when "silver" then 1 else 0 end as silver,
			case medal when "bronze" then 1 else 0 end as bronze
        from olympics. athletes_events
 ) innerT
 group by Team
 having sum(gold)>0
 order by sum(gold) desc;

-- (2) find best player from the data who got max medals?
 WITH T1 AS
			(select name,count(1) as total_medals
            from athletes_events
            where medal = "gold"
            group by name
            order by count(1) desc),
 T2 as 
	  (select* , rank() over (order by total_medals desc) as rnk
      from T1)
 select*
 from T2
 where rnk<=5;

-- (3)  In which sport and year india won maximum medals?
select year, event, count(medal)
from athletes_events
where team ="india"
and medal <> "na" 
group by year, event
order by count(medal) desc; 

-- (4)Write a SQL query to find out which sports event held maximum time? 
select event ,count(event)
from athletes_events
where season= "summer"
group by event
order by count(Event) desc;

-- (5) find out the event which was played in all the summer Olympics games?
WITH t1 AS (
        SELECT COUNT(DISTINCT games) AS total_summer_games
        FROM athletes_events
        WHERE season = 'summer'),
    t2 AS (SELECT DISTINCT sport, games
        FROM athletes_events
        WHERE season = 'summer' ORDER BY games),
    t3 AS (SELECT sport, COUNT(games) AS no_of_games
        FROM t2 GROUP BY sport)
SELECT *
FROM t3
JOIN t1 ON t1.total_summer_games = t3.no_of_games;

-- (6) find total count of countries which are  took part in Olympics ?
select year, season, count(distinct (team)) as nation_cnt
from athletes_events
group by year, season
order by 1;

-- (7) find out on which year the participation is minimum and maximum?
WITH cte_low AS (SELECT year, season, COUNT(DISTINCT team) AS nation_cnt
    FROM athletes_events
    GROUP BY year, season
    ORDER BY nation_cnt
    LIMIT 1),
cte_high AS (SELECT year, season, COUNT(DISTINCT team) AS nation_cnt
    FROM athletes_events
    GROUP BY year, season
    ORDER BY nation_cnt DESC
    LIMIT 1)
SELECT cte_low.year AS lowest_part, cte_high.year AS highest_part
FROM cte_high, cte_low;

-- (8) find sports were just played only once in the Olympics?	
select sport, count(distinct (games)) as count_of_games
from athletes_events
group by sport
having count(distinct (games)) =1;

-- (9) find the oldest athletes to win gold medal?
with cte_gold_age as(select ID,name, sex, age, 
dense_rank () over (order by age desc) as rnk
from athletes_events
where Medal ="gold")
select cte_gold_age.ID, cte_gold_age.name, cte_gold_age.sex, cte_gold_age.Age
from cte_gold_age where rnk=1; 

-- (10 find the oldest athletes who win any medal ?  
WITH cte_gold_age AS (
    SELECT ID, Name, Sex, Age, Games,Event,
           DENSE_RANK() OVER (ORDER BY Age DESC) AS rnk
    FROM athletes_events
    WHERE Medal IN ('Gold', 'Silver', 'Bronze')
)
SELECT ID, Name, Sex, Age, Games,event
FROM cte_gold_age
WHERE rnk = 1;

-- (11) find out the ratio of male and female athletes participated in all Olympics games?
WITH cte_distinct_name AS (
    SELECT DISTINCT Name, Sex
    FROM athletes_events
)
SELECT
    ROUND(CAST(SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*), 3) AS male_ratio,
    ROUND(CAST(SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*), 3) AS female_ratio,
    COUNT(*) AS total_count
FROM cte_distinct_name;

-- (12) The total number of females and males by region?
SELECT
    region,
    sex,
    COUNT(*) AS totalno,
    SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS Male,
    SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS Female,
    COALESCE(SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END), 0), 0) AS Ratio
FROM athletes_events a
INNER JOIN noc_region n ON a.noc = n.noc
GROUP BY region, sex
ORDER BY region
LIMIT 20;

-- (13) Country that has won the highest number of medals and in which year?
SELECT team,COUNT(medal) AS total,year
FROM athletes_events
WHERE medal IN ('gold', 'silver', 'bronze')
GROUP BY team, year
ORDER BY total DESC;

-- (14) Number of athletes in summer season vs winter season?
SELECT
    season,
    SUM(CASE WHEN season = 'summer' THEN 1 ELSE 0 END) AS summersport,
    SUM(CASE WHEN season = 'winter' THEN 1 ELSE 0 END) AS wintersport
FROM
    athletes_events
WHERE
    year >= 1986
GROUP BY
    season;




    
        
        