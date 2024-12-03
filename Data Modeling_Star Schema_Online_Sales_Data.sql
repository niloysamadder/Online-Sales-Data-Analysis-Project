-- Creating Schema "online_sales_data"

CREATE SCHEMA online_sales_data;

-- Creating 'OnlineSalesData' Table to populate the complete dataset

CREATE TABLE online_sales_data.OnlineSalesData (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10, 2),
    CustomerID VARCHAR(50),
    Country VARCHAR(100),
    Discount DECIMAL(5, 2),
    PaymentMethod VARCHAR(50),
    ShippingCost DECIMAL(10, 2),
    Category VARCHAR(100),
    SalesChannel VARCHAR(50),
    ReturnStatus VARCHAR(50),
    ShipmentProvider VARCHAR(100),
    WarehouseLocation VARCHAR(100),
    OrderPriority VARCHAR(50)
);

-- Setting up Star Schema

-- Creating Dimension Tables

-- Customer Dimension

CREATE TABLE online_sales_data.DimCustomer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    CustomerCode VARCHAR(50) UNIQUE,
    Country VARCHAR(50)
);

-- Product Dimension

CREATE TABLE online_sales_data.DimProduct (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,   -- Surrogate key
    StockCode VARCHAR(50) UNIQUE,
    Description VARCHAR(255),
    Category VARCHAR(50)
);


-- Date Dimension

CREATE TABLE online_sales_data.DimDate (
    DateID INT IDENTITY(1,1) PRIMARY KEY,     -- Surrogate key
    DateKey INT UNIQUE,
    DateValue DATE,
    Year INT,
    Month INT,
    Day INT,
    DayOfWeek INT,
    MonthName VARCHAR(20)
);


-- Shipment Provider Dimension

CREATE TABLE online_sales_data.DimShipmentProvider (
    ShipmentProviderID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    ShipmentProvider VARCHAR(50) UNIQUE
);


-- Warehouse Location Dimension

CREATE TABLE online_sales_data.DimWarehouseLocation (
    WarehouseLocationID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    WarehouseLocation VARCHAR(100) UNIQUE
);


-- Order Priority Dimension

CREATE TABLE online_sales_data.DimOrderPriority (
    OrderPriorityID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    OrderPriority VARCHAR(50) UNIQUE
);


-- Sales Channel Dimension

CREATE TABLE online_sales_data.DimSalesChannel (
    SalesChannelID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    SalesChannel VARCHAR(50) UNIQUE
);


-- Payment Dimension

CREATE TABLE online_sales_data.DimPayment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    PaymentMethod VARCHAR(50) UNIQUE
);

-- Creating the Fact Table "FactSales"

CREATE TABLE online_sales_data.FactSales (
    SalesID INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key for the fact table

    -- Foreign keys referencing dimension tables
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    DateID INT NOT NULL,
    ShipmentProviderID INT NOT NULL,
    WarehouseLocationID INT NOT NULL,
    OrderPriorityID INT NOT NULL,
    SalesChannelID INT NOT NULL,
    PaymentID INT NOT NULL,

    -- Fact table measures
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Discount DECIMAL(5, 2) DEFAULT 0,
    ShippingCost DECIMAL(10, 2) DEFAULT 0,
    TotalSales DECIMAL(15, 2) NOT NULL,  -- Calculated field: Quantity * UnitPrice - Discount

    -- Foreign key constraints
    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (CustomerID) REFERENCES online_sales_data.DimCustomer(CustomerID),
    CONSTRAINT FK_FactSales_Product FOREIGN KEY (ProductID) REFERENCES online_sales_data.DimProduct(ProductID),
    CONSTRAINT FK_FactSales_Date FOREIGN KEY (DateID) REFERENCES online_sales_data.DimDate(DateID),
    CONSTRAINT FK_FactSales_Shipment FOREIGN KEY (ShipmentProviderID) REFERENCES online_sales_data.DimShipmentProvider(ShipmentProviderID),
    CONSTRAINT FK_FactSales_Warehouse FOREIGN KEY (WarehouseLocationID) REFERENCES online_sales_data.DimWarehouseLocation(WarehouseLocationID),
    CONSTRAINT FK_FactSales_OrderPriority FOREIGN KEY (OrderPriorityID) REFERENCES online_sales_data.DimOrderPriority(OrderPriorityID),
    CONSTRAINT FK_FactSales_SalesChannel FOREIGN KEY (SalesChannelID) REFERENCES online_sales_data.DimSalesChannel(SalesChannelID),
    CONSTRAINT FK_FactSales_Payment FOREIGN KEY (PaymentID) REFERENCES online_sales_data.DimPayment(PaymentID)
);

-- Populating the Dimension Tables and The Fact Table

-- Populating DimCustomer

INSERT INTO online_sales_data.DimCustomer (CustomerCode, Country)
SELECT DISTINCT CustomerID, Country
FROM online_sales_data.OnlineSalesData;

-- Populating DimProduct

INSERT INTO online_sales_data.DimProduct (StockCode, Description, Category)
SELECT DISTINCT StockCode, Description, Category
FROM online_sales_data.OnlineSalesData;

-- Populating DimDate

INSERT INTO online_sales_data.DimDate (DateKey, DateValue, Year, Month, Day, DayOfWeek, MonthName)
SELECT 
    FORMAT(InvoiceDate, 'yyyyMMdd') AS DateKey,
    InvoiceDate AS DateValue,
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    DAY(InvoiceDate) AS Day,
    DATEPART(WEEKDAY, InvoiceDate) AS DayOfWeek,
    DATENAME(MONTH, InvoiceDate) AS MonthName
FROM online_sales_data.OnlineSalesData;

-- Populating DimShipmentProvider

INSERT INTO online_sales_data.DimShipmentProvider (ShipmentProvider)
SELECT DISTINCT ShipmentProvider
FROM online_sales_data.OnlineSalesData;

-- Populating DimWarehouseLocation

INSERT INTO online_sales_data.DimWarehouseLocation (WarehouseLocation)
SELECT DISTINCT WarehouseLocation
FROM online_sales_data.OnlineSalesData;

-- Populating DimOrderPriority

INSERT INTO online_sales_data.DimOrderPriority (OrderPriority)
SELECT DISTINCT OrderPriority
FROM online_sales_data.OnlineSalesData;

-- Populating DimSalesChannel

INSERT INTO online_sales_data.DimSalesChannel (SalesChannel)
SELECT DISTINCT SalesChannel
FROM online_sales_data.OnlineSalesData;

-- Populating DimPayment

INSERT INTO online_sales_data.DimPayment (PaymentMethod)
SELECT DISTINCT 
    CASE 
        WHEN PaymentMethod = 'paypall' THEN 'Paypal'
        ELSE PaymentMethod
    END AS PaymentMethod
FROM online_sales_data.OnlineSalesData;


-- Populating the Fact Table

-- Fact Table Insert

INSERT INTO online_sales_data.FactSales (
    CustomerID, ProductID, DateID, ShipmentProviderID, WarehouseLocationID, 
    OrderPriorityID, SalesChannelID, PaymentID, Quantity, UnitPrice, Discount, ShippingCost, TotalSales)
SELECT
    dc.CustomerID,  -- Surrogate key from DimCustomer
    dp.ProductID,   -- Surrogate key from DimProduct
    dd.DateID,      -- Surrogate key from DimDate
    dsp.ShipmentProviderID, -- Surrogate key from DimShipmentProvider
    dwl.WarehouseLocationID, -- Surrogate key from DimWarehouseLocation
    dop.OrderPriorityID, -- Surrogate key from DimOrderPriority
    dsc.SalesChannelID, -- Surrogate key from DimSalesChannel
    dpmt.PaymentID,     -- Surrogate key from DimPayment

    osd.Quantity,
    osd.UnitPrice,
    osd.Discount,
    osd.ShippingCost,
    (osd.Quantity * osd.UnitPrice) - osd.Discount AS TotalSales
FROM
    online_sales_data.OnlineSalesData osd
    INNER JOIN online_sales_data.DimCustomer dc ON osd.CustomerID = dc.CustomerCode
    INNER JOIN online_sales_data.DimProduct dp ON osd.StockCode = dp.StockCode
    INNER JOIN online_sales_data.DimDate dd ON FORMAT(osd.InvoiceDate, 'yyyyMMdd') = dd.DateKey
    INNER JOIN online_sales_data.DimShipmentProvider dsp ON osd.ShipmentProvider = dsp.ShipmentProvider
    INNER JOIN online_sales_data.DimWarehouseLocation dwl ON osd.WarehouseLocation = dwl.WarehouseLocation
    INNER JOIN online_sales_data.DimOrderPriority dop ON osd.OrderPriority = dop.OrderPriority
    INNER JOIN online_sales_data.DimSalesChannel dsc ON osd.SalesChannel = dsc.SalesChannel
    INNER JOIN online_sales_data.DimPayment dpmt ON osd.PaymentMethod = dpmt.PaymentMethod;


