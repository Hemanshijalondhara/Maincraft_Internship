CREATE  database ecommerce_analysis;
use ecommerce_analysis;

select *
from dataset;
DROP TABLE IF EXISTS dataset;
CREATE TABLE dataset (
OrderID VARCHAR(20),
Date varchar(20),
CustomerID VARCHAR(20),
Product VARCHAR(50),
Quantity INT,
UnitPrice FLOAT,
ShippingAddress VARCHAR(255),
PaymentMethod VARCHAR(50),
OrderStatus VARCHAR(50),
TrackingNumber VARCHAR(50),
ItemsInCart INT,
CouponCode VARCHAR(50),
ReferralSource VARCHAR(50),
TotalPrice FLOAT
);
ALTER TABLE dataset
ADD COLUMN Month char(20);
ALTER TABLE dataset
ADD COLUMN SalesCategory char(50);
SELECT COUNT(*) AS Total_Rows
FROM dataset;
SELECT product ,SUM(TotalPrice) as total_profit
FROM dataset
GROUP BY product
ORDER BY total_profit DESC
LIMIT 5;
SELECT
    MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month,
    SUM(Quantity) AS Total_Sales
FROM dataset
GROUP BY MONTH(STR_TO_DATE(Date, '%m/%d/%Y'))
ORDER BY MONTH(STR_TO_DATE(Date, '%m/%d/%Y'));
      