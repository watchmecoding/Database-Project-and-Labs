Create view CarsAndDrivers as
select Cars.CarBrand, Cars.CarModel, Cars.CarType, Cars.CarNumber, Drivers.DriverName,
Drivers.DriverSurname, Drivers.DriverLicense
from Cars, Drivers
where Cars.DriverID=Drivers.DriverID
