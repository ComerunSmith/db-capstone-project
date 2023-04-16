DELIMITER //

DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(booking_date VARCHAR(45), table_num INT)
BEGIN
    DECLARE booking_status INT;
    
    SELECT COUNT(*) INTO booking_status
    FROM Bookings
    WHERE BookingSlot = booking_date AND TableNo = table_num;
    
    IF booking_status = 0 THEN
        SELECT CONCAT('Table ', table_num, ' is available') AS "Booking status";
    ELSE
        SELECT CONCAT('Table ', table_num, ' is already booked.') AS "Booking status";
    END IF;
    
END //

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);

