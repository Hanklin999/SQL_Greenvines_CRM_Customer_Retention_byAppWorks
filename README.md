# SQL_Greenvines_CRM_Customer_Retention_byAppWorks
SQL cohort analysis for CRM strategy and channel-based customer retention insights. Dataset provided by ALPHA Camp Taiwan.

This project explores how customer retention behavior varies by acquisition channel and year using SQL and cohort-based logic.  
It simulates a real business scenario for **Greenvines**, a clean beauty brand in Asia, and was originally developed for the **AppWorks Data Program**.

##  Objective

To help the Growth Marketing team understand which acquisition channels generate more loyal customers, and how return rates evolve year-over-year.

##  Dataset

- 5 tables: `Customers`, `Orders`, `OrderDetails`, `Products`, `Channels`
- Format: CSV files (see `/data` folder)
- Simulated but realistic transaction and customer history data

##  Tools Used

- Google Colab (Python, pandas, sqlite3)
- SQL (SQLite)
- GitHub for documentation
- Optional: Tableau for visualizations

##  Analysis Highlights

### Step 5.1 – Retention Rate by Channel and Year
> Calculates return rates for new customers by acquisition channel and cohort year.

### Step 5.2 – Year-over-Year Trends
> Shows which channels improved or declined in retention from 2021 to 2022.

### Step 5.3 – Performance Tiering
> Labels channels as “Strong”, “Moderate”, or “Underperforming” for action prioritization.

##  Key Insights

- **Website-acquired customers had the lowest return rates** across both years (~14%)
- **Retail channels demonstrated higher loyalty**, with up to 35% return rate in 2022
- **Some channels improved dramatically YoY**, e.g., 台北敦南 improved from 6% → 23%
- Performance tiering helps CRM team identify priority segments for re-engagement

##  Strategic Recommendations

- Improve UX and retention campaigns for website cohorts
- Consider duplicating offline customer experience online
- Segment channels with declining trends for targeted experiments

