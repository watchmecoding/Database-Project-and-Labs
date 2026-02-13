create proc miller as
select Cars.CarBrand,Cars.CarModel,Cars.CarType,Cars.CarNumber,Cars.DriverID
from Cars join Drivers on Cars.DriverID=Drivers.DriverID
where Drivers.DriverSurname='Miller'