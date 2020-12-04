DECLARE @PriceChangeDetails TABLE
(
	HotelNumber int,
	Price money,
	NewPrice money
)
UPDATE Hotels
SET Price = 3000
OUTPUT INSERTED.HotelNumber, DELETED.Price, INSERTED.Price
INTO @PriceChangeDetails WHERE HotelNumber = 101

SELECT * FROM @PriceChangeDetails