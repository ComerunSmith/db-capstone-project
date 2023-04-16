SELECT c.CustomerID, c.FullName, o.OrderID, o.BillAmount AS Cost, m.MenuName, mi.CourseName
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Orders o ON b.BookingID = o.BookingID
JOIN Menus m ON o.MenuID = m.MenuID
JOIN MenuItems mi ON m.MenuItemID = mi.MenuItemID
WHERE o.BillAmount > 150
ORDER BY o.BillAmount ASC;
