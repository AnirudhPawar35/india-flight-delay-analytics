-- India Flight Delay Analytics | PostgreSQL
-- Database: flight_delay_analytics
-- Table: flight_data

-- DATA VALIDATION
SELECT COUNT(*) AS total_flights FROM flight_data;

SELECT * FROM flight_data LIMIT 10;

-- OVERALL KPIs
SELECT
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    COUNT(*) FILTER (WHERE delay_target = 0) AS on_time_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(departure_delay), 2) AS avg_departure_delay
FROM flight_data;

-- DELAY RATE BY AIRLINE
SELECT
    airline,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(departure_delay), 2) AS avg_departure_delay
FROM flight_data
GROUP BY airline
ORDER BY delay_rate_pct DESC;

-- DELAY RATE BY ORIGIN AIRPORT (500+ flights)
SELECT
    origin_airport,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(departure_delay), 2) AS avg_departure_delay
FROM flight_data
GROUP BY origin_airport
HAVING COUNT(*) >= 500
ORDER BY delay_rate_pct DESC;

-- TOP 15 ROUTES (200+ flights)
SELECT
    route,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(departure_delay), 2) AS avg_departure_delay
FROM flight_data
GROUP BY route
HAVING COUNT(*) >= 200
ORDER BY delay_rate_pct DESC
LIMIT 15;

-- CONGESTION BAND VS DELAY RATE
SELECT
    congestion_band,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(origin_congestion_index), 2) AS avg_congestion_index
FROM flight_data
GROUP BY congestion_band
ORDER BY avg_congestion_index;

-- TURNAROUND RISK VS DELAY RATE
SELECT
    turnaround_risk_band,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(turnaround_risk_index), 2) AS avg_turnaround_risk
FROM flight_data
GROUP BY turnaround_risk_band
ORDER BY avg_turnaround_risk;

-- WEATHER VS DELAY RATE
SELECT
    weather,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(rainfall_mm), 2) AS avg_rainfall_mm,
    ROUND(AVG(visibility_km), 2) AS avg_visibility_km
FROM flight_data
GROUP BY weather
ORDER BY delay_rate_pct DESC;

-- PREVIOUS FLIGHT DELAY VS CURRENT DELAY
SELECT
    previous_delay_band,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct,
    ROUND(AVG(previous_flight_delay_minutes), 2) AS avg_previous_delay
FROM flight_data
GROUP BY previous_delay_band
ORDER BY avg_previous_delay;

-- DAY OF WEEK VS DELAY RATE
SELECT
    day_of_week,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct
FROM flight_data
GROUP BY day_of_week
ORDER BY day_of_week;

-- SCHEDULED DEPARTURE HOUR VS DELAY RATE
SELECT
    scheduled_departure_hour,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay_target = 1) AS delayed_flights,
    ROUND(100.0 * COUNT(*) FILTER (WHERE delay_target = 1) / COUNT(*), 2) AS delay_rate_pct
FROM flight_data
GROUP BY scheduled_departure_hour
ORDER BY scheduled_departure_hour;
