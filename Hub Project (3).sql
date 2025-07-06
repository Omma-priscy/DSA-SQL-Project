-----KULTRA MEGA STORES INVENTORY PROJECT

CREATE DATABASE KMS_ORDERS




-----Table----

CREATE TABLE KMS_Sql (
[ROW_ID] INT,
[Order_ID] INT,
[Order_Date] DATE,
[Order_Priority] VARCHAR (50),
[Order_Quantity] INT,
Sales DECIMAL (10,2),
Discount DECIMAL (10,2),
[Ship_Mode] VARCHAR(50),
Profit DECIMAL (10,2),
[Unit_Price] DECIMAL (10,2),
[Shipping_Cost] DECIMAL (10,2),
[Customer_Name] VARCHAR (255),
Province VARCHAR(100),
Region VARCHAR (100),
[Customer_Segment] VARCHAR(100),
[Product_Category] VARCHAR(100),
[Product_Sub-Category] VARCHAR(100),
[Product_Name] VARCHAR (MAX),
[Product_Container] VARCHAR(100),
[Product_Base Margin] DECIMAL (10,2),
[Ship_Date] DATE
)


---drop table KMS_Sql


Select * from kms_sql

---Question1
--Which Product Category has the Highest sales?

select product_category, sum(Sales) as [Total sales]
from [kms_sql]
group by product_category
order by [Total sales] desc

--Answer
-------The highest product_Category with the highest sales is 'Technology'.


----Question2a
--What are the Top 3 Regions in terms of sales?


select top 3 region, sum(sales) as [Total sales]
from [kms_sql]
group by Region
Order by [Total sales] desc

--Answer
----- The Top 3 regions in terms of sales are West, Ontario and Prarie.



-------Question 2b
--What are the bottom 3 regions in terms o sales?

select top 3 region, sum(sales) as [Total sales]
from [kms_sql]
group by Region
Order by [Total sales] asc

--Answer
-----The Bottom 3 regions in terms of sales are Nunavut, Northwest Territories and Yukon.



----Question 3
--What are the Total sales of Appliance in Ontario?

select Product_Sub_category, sum(sales) as [Total sales]
  from [KMS_Sql]
where Region = 'Ontario'   
group by Product_Sub_Category


---Question 4
--Advice the management of KMS on what to do to increase the revenue from thebottom 10 Customers.

select top 10 Customer_Name, Shipping_cost, Sales, Discount, Unit_price, sum(sales) as [Total Sales]
   from [dbo].[KMS_Sql]
 group by Customer_Name, Shipping_Cost, Sales, Discount, Unit_Price
 Order by [Total Sales] asc

 --Answer
 ---------They Should Avoid oferring high discounts on low-quantity or low -value orders.
 -------They should buy in large quantities or in larger amount so that they can make more profit.
 ------They should go for a more economical and efficient shipping method.



 ------Question 5
-- KMS incurred the most shipping cost using which shipping method?

 select Ship_Mode, sum(Shipping_Cost) as [Total Shipping_Cost]
 from [dbo].[KMS_Sql]
 group by Ship_Mode
 Order by[Total Shipping_Cost] desc

 --Answer
 ------KMS incurred the most Shipping Cost using the Delivery Truck shipping method.



 -----Question 6
-- Who are the mos Valuable Customers,and what products or services do they typically purchase?

Select Customer_Segment, Product_Sub_Category, Customer_Name, sum(Sales) as [Total Sales]
from [dbo].[KMS_Sql]
group by Customer_Segment, Product_Sub_Category, Customer_Name
Order by [Total Sales] desc

--Answer
----------The First most Valueable Customers are Emily Phan and he purchased "Office Machines",
---the second most vaueable costomer is Raymond Book who purchased "Copiers and Fax",
-----the third most valueable customer is Dennis kane who also purchased "Copiers  and Fax"------


------Question 7
--Which small business Customer had the Hihest Sales?

Select Top 1*
from [dbo].[KMS_Sql]
where Customer_Segment = 'Small Business'
Order by [Sales] desc

--Answer
---Dennis Kane is the Small Business Customer with Highest Sales---


----Question 8----
--What Corporate Customer placed the most number of orders in 2009-2012?

Select Top 1*
from [dbo].[KMS_Sql]
where Customer_Segment = 'Corporate'
Order by [Order_Quantity] desc

--Answer 
----Sonia Cooley is the Corporate Customer that Placed th Most number of Orders between 2009-2012


-------Question 9
--Which Consumer Customer was the profitable one?

Select top 1 *
from [dbo].[KMS_Sql]
where Customer_Segment = 'Consumer'
Order by [Profit] desc

--Answer
----Emily Phan is the Consumer Customer Most Profitable


-----Question 10
--Which Customer returned items and what segment  do the belong?

Select * from (
select Order_id, Customer_Segment, Product_Sub_Category, Customer_Name
from [dbo].[KMS_Sql]) as Customer
join (
select [Order_Id], [Sales], [Order_id] as Customer_Returned
   from [dbo].[KMS_Sql])
 order by [Customer_Name] asc

-- Answer
----No Customer returned any items and they can not be found in any segment because, 
--the provided data does not have a column for RETURNED ITEMS.



Select * from kms_sql


------------Question 11
--If the delivery truck was the most economical bt slowest shipping method
--and EXpress Airis the fastest but the most expensive one, do you think
--the company appropriately spent shipping costs based on the Order Priority?
--Explain your answer.

--Answer
-----I do not think that the Company spent appropriately the shipping cost based
----on the Order Priority because as the Delivery Truck is economical but slowest 
---in shipping method, it has automatically dissappoint some Reliable Customers and 
---might have missed out in some huge Orders placed by Impatient customers which is
--not good for the Company, thereby making their competitors have an edge over them.-----




