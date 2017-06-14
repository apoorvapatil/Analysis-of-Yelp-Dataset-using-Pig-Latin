review = LOAD '/dataset/review.csv' USING PigStorage('^') as (review_id:chararray, user_id:chararray, business_id:chararray, stars:float);
review = DISTINCT review;

business = LOAD '/dataset/business.csv' USING PigStorage('^') as (business_id:chararray, address:chararray, category:chararray);
business = DISTINCT business;

votes = FOREACH grp_businessid generate flatten(group) as business_id, COUNT($1) as vote;
businessfilterout = FILTER business BY NOT(address MATCHES '.* CA.*');

grouped = COGROUP businessfilterout by business_id, votes by business_id;
join_final_order10 = LIMIT grouped 10;
result4 = FOREACH join_final_order10 GENERATE $1;
STORE result4 into ‘/pig/Q4’ using PigStorage('^');