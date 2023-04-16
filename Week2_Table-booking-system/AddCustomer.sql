DROP PROCEDURE IF EXISTS AddCustomer;

DELIMITER $$
CREATE PROCEDURE AddCustomer(
  IN full_name VARCHAR(255),
  IN contact_no VARCHAR(100),
  IN email_address VARCHAR(100)
)
BEGIN
  INSERT INTO Customers (FullName, ContactNumber, Email)
  VALUES (full_name, contact_no, email_address);
END$$
DELIMITER ;

CALL AddCustomer("John Smith", null, null);