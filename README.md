# Funnel Analysis Project

## Overview

This project focuses on analyzing user behavior across different stages of the customer conversion funnel for three countries: USA, India, and Canada. The funnel stages analyzed include:
- `page_view`
- `session_start`
- `first_visit`
- `user_engagement`
- `add_to_cart`
- `purchase`

The aim of this analysis is to understand where users drop off in the funnel and to provide insights on optimizing conversions, particularly at the checkout stage. The analysis uses SQL to extract and process data from the `tc-da-1.turing_data_analytics.raw_events` table.

## Key Insights

- **High Engagement:** Users in all three countries show high engagement in the initial stages (`page_view`, `session_start`, and `first_visit`).
- **Conversion Drop-off:** Significant user drop-off occurs between the `user_engagement` and `add_to_cart` stages, with fewer than 5% of users adding items to their cart.
- **Low Purchase Rate:** The final purchase rate is low, around 1.6% across all countries, suggesting room for improvement in converting user engagement to purchases.

### Recommendations
- **Improve Checkout Process:** Simplify the checkout experience to minimize cart abandonment.
- **Offer Incentives:** Consider offering promotions or discounts to encourage users to complete purchases.
- **Address Cart Abandonment:** Conduct further investigation into why users are abandoning their carts through surveys or A/B testing.

## Funnel Visualization

The funnel visualization for USA, India, and Canada can be viewed here:
[Google Sheets Funnel Visualization](https://docs.google.com/spreadsheets/d/1LMYBdaoGMT7ic1OWltrHzkxI6gsY8Gvu-WHFBgpnr6g/edit?usp=sharing)

## Technologies Used

- **SQL**: For querying and analyzing event data.
- **Google BigQuery**: Used to process large datasets and perform cohort analysis.
- **Google Sheets**: For funnel data visualization.
