use Education_Renamed

--1
select Surname, [Name], Patronymic, BirthdayCity, Birthday
from Student
union all
select Surname, [Name], Patronymic, BirthdayCity, Birthday
from Employee

--2 
select Surname, [Name], Patronymic, BirthdayCity, Birthday
from Student
union 
select Surname, [Name], Patronymic, BirthdayCity, Birthday
from Employee

--3
select BirthdayCity
from Student
except
select BirthdayCity
from Employee

--4
select BirthdayCity
from Student
intersect
select BirthdayCity
from Employee

--5
select *
from Employee join Exam on Employee.EmployeeId = Exam.EmployeeId join Discipline on Discipline.DisciplineId = Exam.DisciplineId
where Discipline.Name = N'Математика'
union 
select *
from Employee join Exam on Employee.EmployeeId = Exam.EmployeeId join Discipline on Discipline.DisciplineId = Exam.DisciplineId
where Discipline.Name = N'Фізика'

--6
create database zkVnzCopyF
GO

use zkVnzCopyF
GO

CREATE TABLE SubdivisionCopyA
(
	SubdivisionId int Identity NOT NULL,
	Name nvarchar(250) NOT NULL, 
	CONSTRAINT PK_SubdivisionId PRIMARY KEY (SubdivisionId)
)
GO

CREATE TABLE SubdivisionCopyB
(
	SubdivisionId int Identity NOT NULL,
	Name nvarchar(250) NOT NULL, 
	Abbreviation nvarchar(250),
	CONSTRAINT PK_SubdivisionIdd PRIMARY KEY (SubdivisionId)
)
GO

CREATE TABLE SubdivisionCopyC
(
	SubdivisionId int Identity NOT NULL,
	Name nvarchar(250) NOT NULL, 
	CONSTRAINT PK_SubdivisionIddd PRIMARY KEY (SubdivisionId)
)
GO

insert into zkVnzCopyF.dbo.SubdivisionCopyA(Name)
select Name
from Education_Renamed.dbo.Subdivision

insert into zkVnzCopyF.dbo.SubdivisionCopyB(Name)
select Name
from Education_Renamed.dbo.Subdivision

--7
insert into zkVnzCopyF.dbo.SubdivisionCopyC(Name)
select Name
from Education_Renamed.dbo.Subdivision
where SubdivisionId > 5

--8
use zkVnzCopyF
CREATE TABLE DisciplineCopy
(
	DisciplineId int Identity NOT NULL, 
	Name nvarchar(250) NOT NULL, 
	CONSTRAINT PK_DisciplineId PRIMARY KEY (DisciplineId)
)
GO

use Education_Renamed
insert into zkVnzCopyF.dbo.DisciplineCopy(Name)
select Name
from Discipline
where DisciplineId > 3 and DisciplineId < 6

--9
select * into zkVnzCopyF.dbo.ExamCopy
from Exam
where Mark = 5

--10
select * into zkVnzCopyF.dbo.DisciplineCopyNew
from Discipline

--11
use Education_Renamed
update Student
set RecordBook = N'ІК-24-03-0'
where Surname = N'Персиков'
GO

--12
update Student
set BirthdayCity = N'Прага'
where StudentId between 5 and 10
GO

--13
update Employee
set Oklad = Oklad * 1.25
from Employee 
join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.DutiesId
where Position.Name in (N'Професор', N'Доцент')
GO

--14
update Employee
set Oklad = Oklad + 0.7
from Employee 
where Oklad = (select min(Oklad) from Employee)
GO

--15
update Employee
set Oklad = Oklad * 2
from Employee 
where Oklad = (select max(Oklad) from Employee)
GO

--16
alter table Student
add EnrollmentDate date NULL
GO

update Student
set EnrollmentDate = '2003-09-01'
GO

update Student
set EnrollmentDate = '2005-09-01'
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
where StudyGroup.Name = N'ІК-11'
GO

--17
delete from Exam
where StudentId > 3 and StudentId < 5
GO

--18
delete from Exam
from Exam
join Student on Student.StudentId = Exam.StudentId 
where Student.BirthdayCity = N'Одеса'
GO

--19
delete from Exam
where StudentId > 4 and StudentId < 8
GO

delete from Student
where StudentId > 4 and StudentId < 8
GO

-------------------------------------------
use Music_Store
GO

--1
select b.Surname + ' ' + b.[Name] + ' ' + Patronymic as FullName, Number
from Buyer b
union all
select p.Name, Number
from Provider p

--2
select b.Surname + ' ' + b.[Name] + ' ' + Patronymic as FullName, Number
from Buyer b
union 
select p.Name, Number
from Provider p

--3
select SellDate
from Cheque
except
select Start 
from Guarantee

--4
select SellDate
from Cheque
intersect
select Start 
from Guarantee

--5
select Buyer.*
from Buyer join Guarantee on Buyer.BuyerID = Guarantee.BuyerID
join Cheque on Cheque.ChequeID = Guarantee.ChequeID
join Instrument on Instrument.InstrumentID = Cheque.ChequeID
where ManufactureYear = 2019
union
select Buyer.*
from Buyer join Guarantee on Buyer.BuyerID = Guarantee.BuyerID
join Cheque on Cheque.ChequeID = Guarantee.ChequeID
join Instrument on Instrument.InstrumentID = Cheque.ChequeID
where ManufactureYear = 2021

--6
create database zkMyCopyF
GO

use zkMyCopyF
GO

CREATE TABLE MarkCopyA
(
	MarkID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	ProducerCountry nvarchar(250),
	[Description] nvarchar(250)
)
GO

CREATE TABLE MarkCopyB
(
	MarkID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	ProducerCountry nvarchar(250),
	Abbreviation nvarchar(250),
	[Description] nvarchar(250)
)
GO

CREATE TABLE MarkCopyC
(
	MarkID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	ProducerCountry nvarchar(250),
	[Description] nvarchar(250)
)
GO

use Music_Store
insert into zkMyCopyF.dbo.MarkCopyA(Name, ProducerCountry, Description)
select Name, ProducerCountry, Description
from Mark

insert into zkMyCopyF.dbo.MarkCopyB(Name, ProducerCountry, Description)
select Name, ProducerCountry, Description
from Mark

--7
insert into zkMyCopyF.dbo.MarkCopyC(Name, ProducerCountry, Description)
select Name, ProducerCountry, Description
from Mark
where MarkID > 5

--8
use zkMyCopyF
CREATE TABLE ClassCopy
(
	ClassID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	[Description] nvarchar(250),
)
GO

use Music_Store
insert into zkMyCopyF.dbo.ClassCopy(Name, Description)
select Name, Description
from Class
where ClassId > 3 and ClassId < 6

--9
select * into zkMyCopyF.dbo.InstrumentCopy
from Instrument
where ManufactureYear = '2024'

--10
select * into zkVnzCopyF.dbo.ClassCopyNew
from Class

--11
use Music_Store
GO

update Provider
set Number = '0632223411'
where Name = N'TaylorPR'
GO

--12
update Provider
set Address = N'Мороя, 15'
where ProviderID between 2 and 4
GO

--13
update Instrument
set Price = Price * 1.25
from Instrument
join Class on Class.ClassId = Instrument.ClassId
where Class.Name in (N'9/10', N'10/10')
GO

--14
update Instrument
set Price = Price + 0.7
from Instrument 
where Price = (select min(Price) from Instrument)
GO

--15
update Instrument
set Price = Price * 2
from Instrument 
where Price = (select max(Price) from Instrument)
GO

--16
alter table Instrument
add ProvideDate date NULL
GO

update Instrument
set ProvideDate = '2024-07-05'
GO

update Instrument
set ProvideDate = '2024-11-11'
from Instrument join Provider on Instrument.ProviderID = Provider.ProviderID
where Provider.Name = N'TaylorPR'
GO

--17
delete from Guarantee
where BuyerID > 3 and BuyerID < 5
GO

--18
delete from Guarantee
from Guarantee
join Buyer on Buyer.BuyerID = Guarantee.BuyerID 
where Buyer.Number like '063%'
GO

--19
delete from Guarantee
where BuyerID > 4 and BuyerID < 8
GO

delete from Buyer
where BuyerID > 4 and BuyerID < 8
GO
