--15. All new bids must be placed at the time which matches the current time of your AuctionBase system.
PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS current_time;

--Catch any instance of a bid being placed which has a time inconsistent with the database's current 
--time and ROLLBACK. 
CREATE TRIGGER current_time
BEFORE INSERT ON Bids
FOR EACH ROW
WHEN EXISTS (
	SELECT * 
	FROM CurrentTime 
	WHERE CurrentTime.currentTime <> new.Time
)
BEGIN
  SELECT RAISE(ROLLBACK, 'All new bids must be placed at the time which matches the current time of your AuctionBase system.');
END;
