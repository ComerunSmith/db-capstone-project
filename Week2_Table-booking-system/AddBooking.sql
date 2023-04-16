DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER $$
CREATE PROCEDURE AddBooking(
  IN booking_id INT,
  IN customer_id INT,
  IN booking_slot VARCHAR(45),
  IN table_no INT
)
BEGIN
  INSERT INTO Bookings (BookingID, BookingSlot, EmployeeID, TableNo, CustomerID)
  VALUES (booking_id, booking_slot, NULL, table_no, customer_id);
  SELECT CONCAT('New booking added') AS Confirmation;
END$$
DELIMITER ;

CALL AddBooking(9, 6, "2022-12-30", 4);