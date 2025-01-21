WITH unique_events AS (
    -- Get unique events based on the previous query
    SELECT 
        user_pseudo_id,
        event_name AS Event,
        event_timestamp AS timestamp,
        category,
        country,
        page_title,
        ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp ASC) AS rn
    FROM 
        `tc-da-1.turing_data_analytics.raw_events`
),
top_countries AS (
    -- Find the top 3 countries by total number of events
    SELECT 
        country,
        COUNT(*) AS total_events
    FROM 
        unique_events
    WHERE rn = 1
    GROUP BY country
    ORDER BY total_events DESC
    LIMIT 3
)
-- Now count the events for each funnel step and split by the top 3 countries
SELECT 
    ue.country,
    COUNT(CASE WHEN ue.Event = 'page_view' THEN ue.user_pseudo_id END) AS page_view_count,
    COUNT(CASE WHEN ue.Event = 'session_start' THEN ue.user_pseudo_id END) AS session_start_count,
    COUNT(CASE WHEN ue.Event = 'first_visit' THEN ue.user_pseudo_id END) AS first_visit_count,
    COUNT(CASE WHEN ue.Event = 'user_engagement' THEN ue.user_pseudo_id END) AS user_engagement_count,
    COUNT(CASE WHEN ue.Event = 'add_to_cart' THEN ue.user_pseudo_id END) AS add_to_carte_count,
    COUNT(CASE WHEN ue.Event = 'purchase' THEN ue.user_pseudo_id END) AS purchase_count

FROM 
    unique_events ue
JOIN 
    top_countries tc
ON 
    ue.country = tc.country
WHERE 
    ue.rn = 1
GROUP BY 
    ue.country;
