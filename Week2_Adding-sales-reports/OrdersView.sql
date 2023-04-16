DROP VIEW OrdersView;

CREATE VIEW OrdersView AS 
	SELECT 
    OrderID,
    Quantity,
    BillAmount AS Cost
    FROM Orders;
    
Select * from OrdersView;