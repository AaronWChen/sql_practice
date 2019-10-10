/* Return number of records for each school year, ordered by school year */
SELECT school_year, COUNT(school_year) 
FROM cps_dropout_rate_2011_2019 
GROUP BY school_year 
ORDER BY school_year DESC;

/* Return the schools and their community info with a dropout rate 
greater than 25% in the year 2019 */
SELECT profile.school, profile.community, dropout.*
FROM cps_sy1819_cca AS profile
JOIN cps_dropout_rate_2011_2019 AS dropout
ON profile.school_id = dropout.school_id
WHERE dropout.cps_dropout_rate >= 25 AND dropout.school_year = 2019;

/* Top 10 community areas in terms of number of crimes in 2019 */
SELECT COUNT(id) AS count, "Community Area" AS cca
FROM crimes_2019
WHERE year = 2019
GROUP BY cca
ORDER BY count DESC
LIMIT 10;

/* Top 10 community areas with the highest number of jobs in 2017 */
SELECT census.commarea, SUM(jobs.c000) AS count  --, profile.community
FROM il_wac_s000_jt00_2017 AS jobs
JOIN il_xwalk
    ON jobs.w_geocode = il_xwalk.tabblk2010
JOIN census_tracts_2010 AS census
    ON il_xwalk.trct = census.geoid10
GROUP BY census.commarea
ORDER BY count DESC
LIMIT 10;