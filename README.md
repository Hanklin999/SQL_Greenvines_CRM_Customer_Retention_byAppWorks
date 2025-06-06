# SQL Case Study: CRM Retention Analysis (AppWorks Simulation)

📅 Duration: 3 days | 🛠 Tool: SQLite / Colab  
🔎 Focus: E-commerce CRM | New Customer Retention | Channel Performance

This SQL project analyzes **customer retention by acquisition channel and year**, using a simulated CRM dataset. By calculating return rates and tiering performance, we identify growth opportunities and underperforming segments for actionable business insights.

---

## 🎯 Project Objective

- Analyze new customer **retention rate by acquisition channel**
- Compare **year-over-year retention performance** (2021 vs 2022)
- Identify **underperforming segments** for CRM targeting
- Translate SQL logic into actionable growth strategy

---

## 🔄 SQL Query Flow Overview

1. **Define Cohorts** – Group new customers by year and channel  
2. **Join Orders** – Identify returning customers  
3. **Calculate Retention** – Compute return rates by segment  
4. **Assign Tiers** – Label performance (Strong / Moderate / Underperforming)

![Retention Pipeline](assets/sql_crm_retention_pipeline.png)

---

## 📦 Dataset Summary

| Table         | Description                               | Key Columns         |
|---------------|-------------------------------------------|---------------------|
| Customers     | New customer list                         | customer_id, year   |
| Orders        | Order transactions                        | order_id, customer_id, order_date |
| OrderDetails  | Product details per order                 | order_id, product_id|
| Products      | Product category and metadata             | product_id          |
| Channels      | Acquisition channel metadata              | channel_id          |


---


## 🧩 CRM Entity-Relationship Diagram

![Entity Diagram](assets/sql_crm_erd_diagram.png)

---
## 🧮 SQL Logic Structure

> The analysis uses Common Table Expressions (CTEs) to filter cohorts, join customer return activity, and calculate return rates with conditional aggregation.

![Query Flow](assets/sql_crm_query_flowchart.png)

---

📂 Queries stored in [`/sql`](./sql):

| File | Description |
|------|-------------|
| [`Query 1: New Customers by Channel and Year`](sql/query_1_retention_by_channel.sql) | Retention rate by channel and year |
| [`Query 2: Returning Customers & Return Rate)`](sql/query_2_yoy_diff.sql) | YoY retention change |
| [`Query 3: Performance Tier Classification`](sql/query_3_flag_underperforming.sql) | Tier-based channel performance labeling |
---


## 📊  Analysis Highlights

### Step 5.1 – Retention Rate by Channel and Year
> Calculates return rates for new customers by acquisition channel and cohort year.
Return rates across channels for both years. Channels like「台北統一門市」showed strong growth.
![Retention by Channel](assets/Q1_yoy_retention_rate_graph.png)

Data Summary:
![Table – Return Rate by Year](assets/Q1_yoy_retention_rate_form.png)

### Step 5.2 – Year-over-Year Trends
> Shows which channels improved or declined in retention from 2021 to 2022.
Bar chart showing which acquisition channels improved or declined in 2022.
![YoY Change Chart](assets/Q2_yoy_retention_change.png)

Data Table:
![YoY Diff Table](assets/Q2_yoy_retention_change_form.png)

### Step 5.3 – Performance Tiering
> Labels channels as “Strong”, “Moderate”, or “Underperforming” for action prioritization.
Channel-year pairs are flagged as:
- 🔴 **Underperforming** (< 0.30)
- 🟡 **Moderate** (0.30–0.39)
- 🟢 **Strong** (0.40+)

Table Breakdown:
![Tier Table](assets/Q3_performance_tier_table.png)

---

## ✅ Key Insights

- **Online channel return rate (14%)** is significantly lower than the **best-performing retail store (30%)**.
- Tier analysis identified 3 stores with under 10% retention – potential targets for intervention.
- Suggest **optimizing CRM campaigns** for online-acquired customers or invest in offline conversion tracking.

This analysis can guide **budget allocation** and **CRM strategies** for future acquisition campaigns.

---

## 💡 Decision Simulation (Use Cases)

### 👩‍💼 PM (Product Manager)
> Design re-engagement flow (email/push/loyalty) for web customers acquired in 2022 with low return rates.

### 📈 Growth Strategist
> Recommend shifting ad spend to retail-based onboarding due to stronger in-store retention trends.

### 💰 Investor / BizOps
> Use return rate as KPI proxy to evaluate CAC effectiveness across channels before reinvestment.

---

## 🛠 Tech Stack

- **SQL (SQLite-style CTE logic)**
- **Google Colab (query execution + visualization)**
- **Notion / GitHub (portfolio presentation)**

---

## 📁 Project Structure
```
SQL_CRM_Retention_Analysis/
├── data/ # Simulated customer & order tables (csv)
├── sql/ # SQL query files
├── notebooks/ # Optional: Jupyter or Colab notebook
├── assets/ # Retention chart images
└── README.md
```
---

## 📬 Contact

**Hank Lin（林致翰）**  
📧 [chihhanlin99@gmail.com](mailto:chihhanlin99@gmail.com)  
🔗 [GitHub](https://github.com/Hanklin999)  
🔗 [LinkedIn](https://www.linkedin.com/in/hank-lin-a05189181/)  
🌐 [Portfolio (Notion)](https://four-elbow-906.notion.site/Personal-Project-SQL-CRM-Retention-Analysis-208d839e9e7e8010aeebd067b140ca5b?pvs=74) 

