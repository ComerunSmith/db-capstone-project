-- -----------------------------------------------------
-- Stored Procedure 'GetMaxQuantity': maximum ordered quantity
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS GetMaxQuantity;

CREATE PROCEDURE GetMaxQuantity ()
  SELECT MAX(Quantity)
  FROM Orders;

CALL GetMaxQuantity();