-- -----------------------------------------------------
-- stored procedure 'CancelOrder': delete an order record 
-- based on the user input of the order id
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder (order_id INT)
	BEGIN
		DELETE FROM Orders WHERE OrderID = order_id;
		SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
	END//
DELIMITER ;

Call CancelOrder(5);