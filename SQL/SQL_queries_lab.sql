![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | My First Queries

Open the PgAdmin server from PostgreSQL - pgAdmin 4 is a server that runs on a browser, which is pretty good for an easy start. If you haven't already, start a new server by passing the password you've setup. Create a database called **applestore** and use the `dump file` provided to import a database. 

After creating the `applestore` database, right click it and `restore` it. Select the dump file and hopefully pgAdmin will create the database needed for the following exercises.

Use the table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**

SELECT DISTINCT prime_genre FROM data;

**2. Which is the genre with the most apps rated?**
The count of ratings an app has received is in the rating_count_tot column.

SELECT
prime_genre, 
rating_count_tot
FROM 
data
ORDER BY
rating_count_tot DESC;


**3. Which is the genre with most apps?**

Social Networking

**4. Which is the one with least?**

SELECT
prime_genre, 
rating_count_tot
FROM 
data
ORDER BY
rating_count_tot;

**5. Find the top 10 apps most rated.**

SELECT
track_name,
prime_genre, 
rating_count_tot
FROM 
data
ORDER BY
rating_count_tot DESC 
LIMIT 10;


**6. Find the top 10 apps best rated by users.**

SELECT
track_name,
prime_genre, 
user_rating
FROM 
data
ORDER BY
user_rating DESC 
LIMIT 10;

**7. Take a look at the data you retrieved in question 5. Give some insights.**

Facebook is the most rated app in Social Networking
Instagram is the most rated app in Photo & Video
The most rated app of all genres is Facebook

**8. Take a look at the data you retrieved in question 6. Give some insights.**

Different categories feature the highest user ratings

**9. Now compare the data from questions 5 and 6. What do you see?**

Data from question 5 is more accurate because it totalizes the ratings and gives more precise insights

**10. How could you take the top 3 regarding both user ratings and number of votes?**

SELECT
track_name,
prime_genre, 
rating_count_tot,
user_rating
FROM 
data
ORDER BY
rating_count_tot DESC 
LIMIT 3; 

SELECT
track_name,
prime_genre, 
user_rating
FROM 
data
ORDER BY
user_rating DESC 
LIMIT 3; 

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT 
track_name,
cont_rating,
rating_count_tot,
price
FROM 
data
ORDER BY
price DESC
LIMIT 10;

The most expensive apps with the total ratings: There are very few ratings

SELECT 
track_name,
cont_rating,
rating_count_tot,
price
FROM 
data
ORDER BY
rating_count_tot DESC
LIMIT 10;

When grouping by total ratings, the apps with the most ratings are the free apps 

**Bonus: Find the total number of games available in more than 1 language.**

SELECT 
prime_genre, 
COUNT(prime_genre) 
FROM
(SELECT
prime_genre,
"lang.num"
FROM 
data
WHERE 
prime_genre = 'Games'
AND
"lang.num" > 1
ORDER BY 
"lang.num" DESC) AS A
GROUP BY
prime_genre;
1660 

**Bonus2: Find the number of free vs paid apps**

CREATE TABLE Apps1 (Free_Apps SMALLINT, Paid_Apps SMALLINT);
INSERT INTO Apps VALUES ((SELECT COUNT(*) FROM data WHERE price = 0), 
(SELECT COUNT(*) FROM data WHERE price > 0));
select * from Apps;

**Bonus3: Find the number of free vs paid apps for each genre**



## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
