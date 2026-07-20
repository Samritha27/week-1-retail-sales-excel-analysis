CREATE DATABASE client_site_analysis;
USE client_site_analysis;
SELECT * FROM client_site_dataset LIMIT 10;
SELECT COUNT(*) AS total_rows FROM client_site_dataset;
DESCRIBE client_site_dataset;
SELECT COUNT(DISTINCT `User ID`) AS unique_users FROM client_site_dataset;
SELECT COUNT(DISTINCT `Session ID`) AS unique_sessions FROM client_site_dataset;
SELECT DISTINCT `Event` FROM client_site_dataset;
SELECT `Event`, COUNT(DISTINCT `User ID`) AS total_users FROM client_site_dataset GROUP BY `Event`;
SELECT `Event`, COUNT(*) AS total_events FROM client_site_dataset GROUP BY `Event`;
SELECT COUNT(DISTINCT CASE WHEN `Event`='Browse' THEN `User ID` END) AS browse_users,
COUNT(DISTINCT CASE WHEN `Event`='Purchase' THEN `User ID` END) AS purchase_users
FROM client_site_dataset;
SELECT SUM(Revenue) AS total_revenue FROM client_site_dataset;
SELECT Region,SUM(Revenue) AS total_revenue
FROM client_site_dataset GROUP BY Region ORDER BY total_revenue DESC;
SELECT Channel,SUM(Revenue) AS total_revenue
FROM client_site_dataset GROUP BY Channel ORDER BY total_revenue DESC;
SELECT Device,SUM(Revenue) AS total_revenue
FROM client_site_dataset GROUP BY Device
ORDER BY total_revenue DESC;
SELECT `User ID`,SUM(Revenue) AS total_revenue
FROM client_site_dataset GROUP BY `User ID`
ORDER BY total_revenue DESC LIMIT 5;
SELECT Channel, SUM(Revenue) AS total_revenue
FROM client_site_dataset
GROUP BY Channel ORDER BY total_revenue DESC LIMIT 1;
SELECT Region, SUM(Revenue) AS total_revenue
FROM client_site_dataset
GROUP BY Region ORDER BY total_revenue DESC LIMIT 1;
SELECT Device, COUNT(CASE WHEN `Event`='Purchase' THEN 1 END) AS purchases,
COUNT(*) AS total_events,ROUND(
COUNT(CASE WHEN `Event`='Purchase' THEN 1 END) * 100.0 / COUNT(*),2) 
AS conversion_rate FROM client_site_dataset
GROUP BY Device ORDER BY conversion_rate DESC;
SELECT `Event`,COUNT(DISTINCT `User ID`) AS users
FROM client_site_dataset GROUP BY `Event` ORDER BY users DESC;

