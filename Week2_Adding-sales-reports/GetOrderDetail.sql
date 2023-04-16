-- -----------------------------------------------------
-- prepared statement 'GetOrderDetail': maximum ordered quantity
-- -----------------------------------------------------

PREPARE GetOrderDetail 
FROM 
	'SELECT 
		OrderID, 
        Quantity, 
        BillAmount AS Cost 
	FROM Orders 
		WHERE BookingID IN 
			(SELECT BookingID FROM Bookings WHERE CustomerID = ?)';
            
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

