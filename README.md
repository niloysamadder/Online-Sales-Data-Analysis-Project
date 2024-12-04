# Online Sales Data Analysis Project

## Project Overview
This project involves building an end-to-end data pipeline and analytical dashboards for an **Online Sales Dataset**. The dataset contains sales data, including orders, products, and customer information. The primary goal is to analyze business performance, identify growth opportunities, and provide actionable insights for decision-making.

The project integrates Azure Data Factory for ETL processes, Azure SQL Database for data modeling, and Power BI for interactive dashboards.

---

## Business Goals
1. Automating the ETL pipeline to streamline data ingestion and transformation processes.
2. Building a **star schema** for optimized querying and data modeling.
3. Analyzing key metrics such as **Total Sales**, **Profit**, **Order Trends**, and **Product Insights**.
4. Forecasting future business growth to aid strategic planning.
5. Providing intuitive and actionable visualizations for stakeholders.

---

## Tools and Technologies Used
- **Azure Data Factory**: For ETL pipeline automation.
- **Azure SQL Database**: For data modeling and creating a star schema.
- **Power BI**: For interactive data visualization and dashboards.
- **GitHub**: For project documentation and version control.
- **SQL**: For data manipulation and transformation.
- **DAX (Power BI)**: For custom calculations and measures.

---

## ETL Pipeline Workflow
![ETL Pipeline](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/ETL%20Pipeline_Online%20Sales%20Data%20Project.PNG)
The ETL pipeline extracts raw data, transforms it (e.g., categorizing products, handling duplicates), and loads it into Azure SQL Database for analysis. The key steps include:
1. **Data Extraction**: Extracted data directly from the source systems using https link service.
2. **Data Transformation**: Standardized, cleaned, and enriched the data using Data Flow.
3. **Data Loading**: Populated the star schema in Azure SQL Database.

---

## Star Schema Data Model
![Star Schema](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/Database%20Schema_Online%20Sales%20Data%20Project.PNG)

The star schema includes:
- **Fact Table**: `FactSales` containing transactional data.
- **Dimension Tables**: Including `DimCustomer`, `DimProduct`, `DimDate`, `DimOrderPriority`, and more.

This schema improves query performance and enables seamless integration with Power BI.

---

## Dashboards and Insights
### 1. Business Overview Dashboard
**Key Visualizations:**
- KPI cards for **Current vs Target Total Sales, Profit, and Growth**.
- Line chart for **Total Sales by Year and Quarter**.
- Bar charts for **Top Countries** and **Top Products by Profit**.
- Donut chart for **Sales by Sales Channel**.

![Business Overview Dashboard](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/Business%20Overview_Dashboard.PNG)

---

### 2. Order Analysis Dashboard
**Key Visualizations:**
- Line chart for **Number of Orders by Month**.
- Combined chart for **Order Priority vs Total Profit**.
- Donut and bar charts for **Warehouse Location** and **Shipment Providers**.

![Order Analysis Dashboard](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/Order%20Analysis_Dashboard.PNG)

---

### 3. Product Insights Dashboard
**Key Visualizations:**
- Matrix table for **Total Profit by Product and Country**.
- Tree map for **Average Profit per Order by Product Category**.
- Drill-through capability to explore product-level details.

![Product Insights Dashboard](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/Product%20Insights_Dashboard.PNG)

---

### 4. Business Growth Analysis Dashboard
**Key Visualizations:**
- Cards for **Total Sales**, **Profit**, and **Orders**.
- Forecast charts for **Sales, Profit, Quantity Sold, and Orders**.

![Business Growth Analysis Dashboard](https://github.com/niloysamadder/Online-Sales-Data-Analysis-Project/blob/8c1af4915a254d2295d4204750bbe9fc67b56b20/Business%20Growth%20Analysis_Dashboard.PNG)

---

## Key Insights
1. **Business Overview**:
   - The current sales, profit, and number of orders are about 25% less than the target sales, profit, and number of orders.
   - Highest profit generated in 2020 around € 4.2M.
   - Top-performing countries contributed around 52% of total profit.

3. **Order Trends**:
   - Peak order months align with marketing campaigns in January and June.
   - Warehouse optimization can reduce shipping costs.

4. **Product Insights**:
   - Around 45% of orders belong to the Electronics product category.
   - Stationery products generated the highest average profit per order.
   - "White Mug" product has the highest year-over-year growth in sales with around 23.71%. 

5. **Growth Analysis**:
   - The forecast suggests below-average growth over the next four quarters.

## Key Metrics (KPIs) to Track
- **Total Sales**: Total amount of sales.
- **Total Profit**: Total profit generated from selling products.
- **Year Over Year Growth in Sales**: Growth in sales compared to the previous year.
- **Number of Orders**: Number of Orders placed from the customers.
- **Total Quantity of Sold**: Total number of products sold to the customers.     
---

## Recommendation
- Monitoring the recommended Key Performance Indicators (KPIs) to observe the growth.
- Promoting the top-performing products based on the countries.
- Launching campaigns for low-performing products.
- Launching campaigns in countries with higher year-over-year growth.

## How to Use This Repository
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/online-sales-data-analysis.git
2. Navigate to the project directory and explore:
- ETL Pipeline Schema
- SQL Scripts
- Dashboard Snapshots
3. Open the Power BI file (Online Sales Data_Dashboard.pbix) to interact with the dashboards.
---
## Credits
- **Dataset Source**: [Kaggle Online Sales Data](https://www.kaggle.com/datasets/yusufdelikkaya/online-sales-dataset/data)
- **Project Author**: Niloy Samadder
- **Contact**: [LinkedIn](https://www.linkedin.com/in/niloy-samadder-a6533a167/) | [Email](mailto:niloysamadder.ruet@gmail.com)


