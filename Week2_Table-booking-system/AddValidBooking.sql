DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER $$
CREATE PROCEDURE AddValidBooking(
  IN bookingSlot VARCHAR(45),
  IN table_No INT
)
BEGIN
  DECLARE existingBooking INT;
  START TRANSACTION;
  
  -- Check if the table is already booked on the given date
  SELECT COUNT(*) INTO existingBooking
  FROM Bookings
  WHERE BookingSlot = bookingSlot AND TableNo = table_No;
  
  IF existingBooking > 0 THEN
    -- Rollback the transaction if the table is already booked
    ROLLBACK;
    SELECT CONCAT('Table ', table_No, ' is already booked - booking cancelled.') AS 'Booking Status';
  ELSE
    -- Insert the new booking record
    -- INSERT INTO Bookings (BookingSlot, TableNo)
    -- VALUES (bookingSlot, table_No);
    -- Commit the transaction if the table is available
    COMMIT;
    SELECT CONCAT('Table ', table_No, ' is available - booking confirmed.') AS 'Booking Status';
  END IF;
END$$
DELIMITER ;



CALL AddValidBooking('2022-11-12', 3);

