Create view FullRequestsInfo as
select Stores.StoreCity, Stores.StoreAddress, Stores.StoreName, Goods.GoodBrand, Goods.GoodType, Quantity
from Requests
inner join Stores on Stores.StoreID=Requests.StoreID
inner join Goods on Goods.GoodID=Requests.GoodID
