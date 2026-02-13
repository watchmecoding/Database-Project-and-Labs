use Music_Store;

--1
select * 
from Buyer

select *
from [Provider]

select *
from Class

--2
select [Name], Price
from Instrument

--3
select [Name], MarkID, ProducerCountry
from Mark
where ProducerCountry != N'Japan'

--4
select [Name], MarkID, ProducerCountry
from Mark 
where ProducerCountry = N'China' or ProducerCountry like N'Ca%'

--5
select [Name], MarkID, ProducerCountry
from Mark 
where (ProducerCountry = N'Germany' and [Name] like N'Y%') or ProducerCountry = N'China'

--6
select [Name], MarkID, ProducerCountry
from Mark 
where (ProducerCountry = N'Germany' or ProducerCountry = N'Japan') and [Name] like N'Y%'

--7
select [Description], [Start], BuyerID
from Guarantee
where [End] < '2023-01-01' or [End] > '2024-12-31'

--8
select *
from Instrument
where (MarkID = 1 or MarkID = 3 or MarkID = 5) and (ProviderID = 3 or ProviderID = 7)

--9
select *
from Buyer
where Surname like N'П%'

--10
select InstrumentID
from Cheque
where SellDate like '2024-08-%' and Amount >= 1

--11
select *
from Buyer
where Patronymic is not null and Number like '111%'

--12
select *
from Buyer
where Patronymic is not null

--13
select distinct [Name], Price
from Instrument
order by [Name] asc, Price desc

--14
select count(*)
from Mark

--15
select count([Name])
from Buyer

--16
select count(Patronymic)
from Buyer

--17
select count(*), min(Price), max(Price), avg(Price)
from Instrument

--18
select count(*), min(Price), max(Price), avg(Price)
from Instrument
join Class on Instrument.ClassID = Class.ClassID
group by Instrument.ClassID

--19
select distinct Surname
from Buyer

--20
select count([Name])
from Buyer
where [Name] like N'К%'

--21
select ProducerCountry as N'Країна', count(*) as 'К-ть'
from Mark
group by ProducerCountry

--22
select Price as N'Ціна', count(ProviderID) as N'К-ть постачальників', count(MarkID) as N'К-ть марок'
from Instrument
group by Price

--23
select Mark.Name as N'Марка', count(ProviderID) as N'К-ть'
from Mark
join Instrument on Mark.MarkID = Instrument.MarkID
where Instrument.Price > 13000
group by Mark.Name

--24
select SellDate, count(*)
from Cheque 
group by SellDate
order by SellDate

--25
select SellDate, count(*)
from Cheque 
group by SellDate
order by SellDate

--26
select avg(Price)
from Instrument
where ManufactureYear > 2019 and ManufactureYear < 2022
group by [Name]

--27
select count(Patronymic)
from Buyer

select count(distinct Patronymic)
from Buyer

select count(*)
from Buyer
where Patronymic is null

--28
select ClassID, avg(Price)
from Instrument
group by ClassID
having avg(Price) > 31000

--29
select MarkID, avg(Price)
from Instrument
group by MarkID
having avg(Price) > 45000

