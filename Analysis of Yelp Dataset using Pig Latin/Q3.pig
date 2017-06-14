review = LOAD '/dataset/review.csv' USING PigStorage('^') as (review_id:chararray, user_id:chararray, business_id:chararray, stars:float);
review = DISTINCT review;

business = LOAD '/dataset/business.csv' USING PigStorage('^') as (business_id:chararray, address:chararray, category:chararray);
business = DISTINCT business;

grouped = COGROUP business by business_id, review by business_id;
result3 = limit grouped 5;

STORE result3 into ‘/pig/Q3’ using PigStorage('^');