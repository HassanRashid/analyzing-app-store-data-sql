/* EXPLORATORY DATA ANALYSIS */

-- Checking the number of unique apps in both tables

select count(distinct id) as unique_app_ids
from AppleStore;

select count(distinct id) as unique_app_ids
from appleStore_description_combined;

-- Outputs for both SQL queries above show the same result: 7197

/*
Check for any missing values in key fields (app name, user rating, app genre, description)
from both tables
*/

select count(*) as missing_values_app
from AppleStore
where track_name is null or user_rating is null or prime_genre is null;

select count(*) as missing_values_desc
from appleStore_description_combined
where app_desc is null;

-- Output shows 0 missing values for both tables

-- Finding out the number of apps per genre 

select
	prime_genre,
    count(*) as number_of_apps
from AppleStore
group by prime_genre
order by number_of_apps desc;

-- Get an overview of the apps' ratings

select
	min(user_rating) as min_rating,
	max(user_rating) as max_rating,
    avg(user_rating) as avg_rating
from AppleStore;

/* DATA ANALYSIS */

-- Determing whether paid apps have higher ratings than free apps

select
	case
    	when price > 0 then 'Paid'
    	else 'Free'
    end as app_type,
 	avg(user_rating) as avg_rating
from AppleStore
group by app_type;

-- On average, the rating of Paid apps is slightly (10.19%) higher than Free apps

select
	case
    	when lang_num < 10 then '<10 Languages Supported'
        when lang_num between 10 and 30 then '10-30 Languages Supported'
        when lang_num > 30 then '>30 Languages Supported'
    END as language_bucket,
    avg(user_rating) as avg_rating
from AppleStore
group by language_bucket
order by avg_rating desc;

select
	prime_genre,
	avg(user_rating) as avg_rating
from AppleStore
group by prime_genre
order by avg_rating
limit 10;

select
	case
    	when length(d.app_desc) < 500 then 'Short'
        when length(d.app_desc) between 500 and 1000 then 'Medium'
        else 'Long'
    END as desc_length_bucket,
    avg(a.user_rating) as avg_rating
from AppleStore a
join AppleStore_description_combined d
on a.id = d.id
group by desc_length_bucket
order by avg_rating desc;

select
	prime_genre,
    track_name,
    user_rating
from (
      select
      prime_genre,
      track_name,
      user_rating,
      rank() over(partition by prime_genre order by user_rating desc, rating_count_tot desc) as rank
      from AppleStore
  	 ) a 
where a.rank = 1;