SELECT reservations.id as id, title, cost_per_night, start_date, average_rating 
FROM reservations LEFT JOIN (SELECT id, title, cost_per_night, avg(rating) as average_rating 
FROM (SELECT properties.id as id, title, cost_per_night, rating 
FROM property_reviews LEFT JOIN properties ON property_id = properties.id) AS ratings 
GROUP BY id, title, cost_per_night) AS all_ratings ON property_id = all_ratings.id 
WHERE guest_id = 1 
ORDER BY start_date LIMIT 10;
