# Analysis-of-Yelp-Dataset-using-Pig-Latin
Analysis of Yelp Dataset using Pig Latin

This repository contains the Pig Latin Scripts which are executed in Mapreduce mode through interactive execution mode(through Grunt Shell)

Q1: List the business_id , full address and categories of the Top 10 businesses located in CA using the

average ratings. This will require you to use review.csv and business.csv files.

Please answer the question by calculating the average ratings given to each business using the

review.csv file. Do not use the already calculated ratings (average_stars) contained in the

business entity rows.

Q2: List the business_id , full address and categories of the top 10 most reviewed businesses not located

in CA. Please answer the question by counting the reviews given to each business id not located in

CA.

Q3: Using Pig Latin script, Implement co-group command on business_id for the datasets review

and business. Print first 5 rows.

Q4: Repeat Question 2 (implement join) with co-group commands. Print first 5 rows.
