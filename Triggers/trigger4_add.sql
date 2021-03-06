--13. In every auction, the Number of Bids attribute corresponds to the actual number of bids for that particular item.
PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS number_of_bids;

--Update the number_of_bids to correspond to the correct number of bids 
--by adding 1 bid after each insert in bids 
CREATE TRIGGER number_of_bids
AFTER INSERT ON Bids
FOR EACH ROW
BEGIN
  UPDATE Items SET Number_of_Bids = Number_of_Bids + 1 WHERE ItemID = new.ItemID;
END;
