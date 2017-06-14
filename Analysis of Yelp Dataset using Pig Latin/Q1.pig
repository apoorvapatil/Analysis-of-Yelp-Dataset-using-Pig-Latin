review = LOAD '/dataset/review.csv' USING PigStorage('^') as (review_id:chararray, user_id:chararray, business_id:chararray, stars:float);
review = DISTINCT review;
grp_businessid = GROUP review BY business_id;
avg_ratings = FOREACH grp_businessid GENERATE group as business_id, AVG(review.stars) as stars;

business = LOAD '/dataset/business.csv' USING PigStorage('^') as (business_id:chararray, address:chararray, category:chararray);
business = DISTINCT business;
business_filter = FILTER business BY (address MATCHES '.*CA.*');

join_final = JOIN business_filter by business_id, avg_ratings by business_id;
order_by = ORDER join_final BY avg_ratings::stars DESC;
final = FOREACH order_by GENERATE $0,$1,$2;
result1 = LIMIT final 10;
STORE result1 into ‘/pig/Q1’ using PigStorage('^');