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
![ETL Pipeline](path/to/your/ETL-pipeline-schema-image.png)
The ETL pipeline extracts raw data, transforms it (e.g., categorizing products, handling duplicates), and loads it into Azure SQL Database for analysis. The key steps include:
1. **Data Extraction**: Extracted data directly from the source systems using https link service.
2. **Data Transformation**: Standardized, cleaned, and enriched the data using Data Flow.
3. **Data Loading**: Populated the star schema in Azure SQL Database.

---

## Star Schema Data Model
![Star Schema](path/to/your/star-schema-visualization.png)
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

![Business Overview Dashboard](path/to/your/dashboard1-snapshot.png)

---

### 2. Order Analysis Dashboard
**Key Visualizations:**
- Line chart for **Number of Orders by Month**.
- Combined chart for **Order Priority vs Total Profit**.
- Donut and bar charts for **Warehouse Location** and **Shipment Providers**.

![Order Analysis Dashboard](path/to/your/dashboard2-snapshot.png)

---

### 3. Product Insights Dashboard
**Key Visualizations:**
- Matrix table for **Total Profit by Product and Country**.
- Tree map for **Average Profit per Order by Product Category**.
- Drill-through capability to explore product-level details.

![Product Insights Dashboard](path/to/your/dashboard3-snapshot.png)

---

### 4. Business Growth Analysis Dashboard
**Key Visualizations:**
- Cards for **Total Sales**, **Profit**, and **Orders**.
- Forecast charts for **Sales, Profit, Quantity Sold, and Orders**.

![Business Growth Analysis Dashboard](path/to/your/dashboard4-snapshot.png)

---

## Key Insights
1. **Business Overview**:
   - Highest revenue generated in 2023.
   - Top-performing countries contribute 60% of total profit.

2. **Order Trends**:
   - Peak order months align with marketing campaigns.
   - Warehouse optimization can reduce shipping costs.

3. **Product Insights**:
   - Electronics category contributes most to profit.
   - "Wireless Mouse" is the top-selling product.

4. **Growth Analysis**:
   - Positive year-over-year growth in total profit.
   - Forecast suggests consistent growth over the next four quarters.

---

## How to Use This Repository
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/online-sales-data-analysis.git
2. Navigate to the project directory and explore:
- ETL Pipeline Schema
- SQL Scripts
- Dashboard Snapshots
3. Open the Power BI file (OnlineSalesDashboard.pbix) to interact with the dashboards.

