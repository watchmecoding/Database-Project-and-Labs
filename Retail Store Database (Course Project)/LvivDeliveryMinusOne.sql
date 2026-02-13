create proc LvivDeliveryMinusOne as update Schedule
set DeliveryDate=DATEADD(day,-1,DeliveryDate)
where RequestID in
(select RequestID from Requests where StoreID in 
	(select StoreID from Stores where StoreCity='Lviv'))
