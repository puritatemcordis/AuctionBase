SELECT COUNT(SellerID) FROM (SELECT DISTINCT SellerID FROM Items WHERE SellerID IN (SELECT UserID from Users WHERE Rating > 1000));
