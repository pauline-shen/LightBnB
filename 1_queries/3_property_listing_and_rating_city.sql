SELECT id, title, cost_per_night, avg(rating) as average_rating 
FROM (SELECT properties.id as id, title, cost_per_night, rating FROM property_reviews 
LEFT JOIN properties ON property_id = properties.id WHERE city LIKE ‘’) AS ratings 
GROUP BY id, title, cost_per_night
HAVING avg(rating) >= 4
ORDER BY cost_per_night
LIMIT 10;
