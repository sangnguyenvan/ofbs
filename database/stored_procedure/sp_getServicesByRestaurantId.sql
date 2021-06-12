﻿CREATE PROCEDURE sp_getServicesByRestaurantId
	@restaurant_id int, @category_id int 
AS
DECLARE @service_category nvarchar(50)
IF (@category_id = 1)
	BEGIN
		 SET @service_category = N'Trang trí'
	END
IF (@category_id = 2) 
	BEGIN
		SET @service_category = N'Ban nhạc'
	END
IF (@category_id = 3) 
	BEGIN
		SET @service_category = N'Vũ đoàn'
	END
IF (@category_id = 4) 
	BEGIN
		SET @service_category = N'Ca sĩ'
	END
IF (@category_id = 4) 
	BEGIN
		SET @service_category = N'MC'
	END
IF (@category_id = 4) 
	BEGIN
		SET @service_category = N'Quay phim - chụp ảnh'
	END
IF (@category_id = 4) 
	BEGIN
		SET @service_category = N'Xe cưới'
	END
BEGIN
	SELECT sv.id, sv.name as service_name, img.id as image_service_id, sv.price
	FROM services sv
		left join images img on img.service_id = sv.id
		left join service_categories cat on sv.service_category_id = cat.id
	WHERE sv.restaurant_id = 30 and sv.service_category_id = @category_id
	ORDER BY sv.id asc
END