use Education_Renamed

--1
select *
from Position
where [Name] = N'Доцент'

--2
select *
from Discipline
where [Name] = N'Англійська'

--3
select Surname, [Name], Patronymic
from Employee

--4
select Position.Name, Duties.SubdivisionId
from Duties join Position on Duties.PositionId = Position.PositionId

--5
select *
from Duties cross join Subdivision

--6
select *
from StudyGroup cross join Subdivision

--7
select StudyGroupId as N'Група', StudyGroup.Name as N'Назва групи', StudyGroup.SubdivisionId as N'Назва підрозділу', DataVstup as N'Дата вступу',
Subdivision.SubdivisionId as N'Назва підрозділу', Subdivision.Name as N'Назва підрозділу'
from StudyGroup cross join Subdivision

--8
select Surname, Student.Name, Patronymic, StudyGroup.Name
from Student, StudyGroup
where Student.StudyGroupId = StudyGroup.StudyGroupId

select Surname as N'Прізвища', Student.Name as N'Імена', Patronymic as N'По-батькові', StudyGroup.Name as N'Група'
from Student, StudyGroup
where Student.StudyGroupId = StudyGroup.StudyGroupId

select Surname, Student.Name, Patronymic, StudyGroup.Name
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId

select Surname as N'Прізвища', Student.Name as N'Імена', Patronymic as N'По-батькові', StudyGroup.Name as N'Група'
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId

--9
select Position.Name
from Position, Subdivision, Duties
where Position.PositionId = Duties.PositionId and Duties.SubdivisionId = Subdivision.SubdivisionId and Subdivision.Name = N'Кафедра 1'

select Position.Name as N'Назва посади'
from Position, Subdivision, Duties
where Position.PositionId = Duties.PositionId and Duties.SubdivisionId = Subdivision.SubdivisionId and Subdivision.Name = N'Кафедра 1'

select Position.Name
from Position join Duties on Position.PositionId = Duties.PositionId
join Subdivision on Duties.SubdivisionId = Subdivision.SubdivisionId 
where Subdivision.Name = N'Кафедра 1'

select Position.Name as N'Назва посади'
from Position join Duties on Position.PositionId = Duties.PositionId
join Subdivision on Duties.SubdivisionId = Subdivision.SubdivisionId 
where Subdivision.Name = N'Кафедра 1'

--10
select Surname, Student.Name, Patronymic, BirthdayCity, Stipendia, StudyGroup.Name
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
where Student.BirthdayCity = N'Ялта' or Student.BirthdayCity = N'Луцьк' 

--11
select Surname, Student.Name, Patronymic, BirthdayCity, Stipendia, StudyGroup.Name
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
where (Stipendia between 620 and 800) or Stipendia is null

--12
select Student.Surname, Student.Name, Student.Patronymic, Mark, Discipline.Name, Position.Name
from Exam join Student on Exam.StudentId = Student.StudentId
join Employee on Exam.EmployeeId = Employee.EmployeeId
join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
join Discipline on Discipline.DisciplineId = Exam.DisciplineId
order by Student.Surname

--13
select Employee.Surname, Employee.Name, Employee.Patronymic, Position.Name
from Employee join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
where (Employee.Oklad + Employee.Nadbavka > 3400) and (DataVuplatu between '1940-01-01' and '1960-04-01')

--14
select Employee.Surname, Employee.Name, Employee.Patronymic, Position.Name, Subdivision.Name
from Employee join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId
where Subdivision.Name != N'Кафедра 1' and Subdivision.Name != N'Кафедра 2'
order by Employee.Surname

--15
select Employee.Surname, Employee.Name, Employee.Patronymic, Position.Name, Subdivision.Name, Discipline.Name, StudyGroup.Name
from Exam join Student on Exam.StudentId = Student.StudentId
join Employee on Exam.EmployeeId = Employee.EmployeeId
join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
join Discipline on Discipline.DisciplineId = Exam.DisciplineId
join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId
join StudyGroup on StudyGroup.StudyGroupId = Student.StudyGroupId
order by Employee.Surname

--16
select StudyGroup.Name, count(Student.StudentId)
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
group by StudyGroup.Name

--17
select StudyGroup.Name, count(Student.StudentId)
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
join Exam on Exam.StudentId = Student.StudentId
where Mark = 5
group by StudyGroup.Name

--18
select Employee.Surname, Position.Name, Subdivision.Name, count(StudyGroup.StudyGroupId)
from Exam join Student on Exam.StudentId = Student.StudentId
join Employee on Exam.EmployeeId = Employee.EmployeeId
join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
join Discipline on Discipline.DisciplineId = Exam.DisciplineId
join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId
join StudyGroup on StudyGroup.StudyGroupId = Student.StudyGroupId
where Subdivision.Name = N'Кафедра 1'
group by Employee.Surname, Position.Name, Subdivision.Name

--19
select Discipline.Name, Employee.Surname, Employee.Name, Employee.Patronymic, Exam.DateExam
from Exam join Employee on Exam.EmployeeId = Employee.EmployeeId
join Duties on Duties.DutiesId = Employee.DutiesId
join Position on Position.PositionId = Duties.PositionId
join Discipline on Discipline.DisciplineId = Exam.DisciplineId
join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId
where DateExam < '2013-06-07' and DateExam > '2013-06-01'
order by Discipline.DisciplineId, Employee.Surname

--20
select Position.Name, Subdivision.Name
from Position left join Duties on Position.PositionId = Duties.PositionId
left join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId

--21
select Subdivision.Name, StudyGroup.Name
from Subdivision left join StudyGroup on Subdivision.SubdivisionId = StudyGroup.SubdivisionId

-------------------------
use Music_Store

--1
select *
from Class
where Class.Name = N'10/10'

--2
select *
from Mark 
where Mark.Name = N'Yamaha'

--3
select Surname, Buyer.Name, Patronymic
from Buyer

--4
select [Name], ClassID
from Instrument

--5
select Instrument.Name, Provider.Name
from Instrument cross join Provider

--6
select Instrument.Name, Class.Name
from Instrument cross join Class

--7
select Instrument.Name as N'Інструмент', Class.Name as N'Клас'
from Instrument cross join Class

--8
select Instrument.Name, Mark.Name
from Instrument, Mark
where Instrument.MarkID = Mark.MarkID

select Instrument.Name as N'Інструмент', Mark.Name as N'Марка'
from Instrument, Mark
where Instrument.MarkID = Mark.MarkID

select Instrument.Name, Mark.Name
from Instrument join Mark on Instrument.MarkID = Mark.MarkID

select Instrument.Name as N'Інструмент', Mark.Name as N'Марка'
from Instrument join Mark on Instrument.MarkID = Mark.MarkID

--9
select Instrument.Name
from Instrument, Class
where Instrument.ClassID = Class.ClassID and Class.Name = N'10/10'

select Instrument.Name as N'Інструмент'
from Instrument, Class
where Instrument.ClassID = Class.ClassID and Class.Name = N'10/10'

select Instrument.Name
from Instrument join Class on Instrument.ClassID = Class.ClassID
where Class.Name = N'10/10'

select Instrument.Name as N'Інструмент'
from Instrument join Class on Instrument.ClassID = Class.ClassID
where Class.Name = N'10/10'

--10
select ManufactureYear, Instrument.Name, Price, Characteristics
from Instrument join Mark on Instrument.MarkID = Mark.MarkID
where ProducerCountry = N'Germany' or ProducerCountry = N'Japan'

--11
select ManufactureYear, Instrument.Name, Price, Characteristics
from Instrument
where Price between 6200 and 80000 or Price is null
order by Instrument.Name, Price

--12
select Buyer.Surname, Buyer.Name, Buyer.Patronymic, Start, SellDate, Instrument.Name, Mark.Name
from Buyer join Guarantee on Buyer.BuyerID = Guarantee.GuaranteeID
join Cheque on Cheque.ChequeID = Guarantee.ChequeID
join Instrument on Cheque.InstrumentID = Instrument.InstrumentID
join Mark on Mark.MarkID = Instrument.MarkID
order by Surname

--13
select Instrument.Name, Mark.Name, Amount
from Instrument join Mark on Instrument.MarkID = Mark.MarkID
join Cheque on Cheque.InstrumentID = Instrument.InstrumentID
where (Price < 80000) and (SellDate between '2022-01-01' and '2022-04-04')
order by Instrument.Name

--14
select Instrument.Name, Mark.Name, Amount
from Instrument join Mark on Instrument.MarkID = Mark.MarkID
join Cheque on Cheque.InstrumentID = Instrument.InstrumentID
where ManufactureYear != 2001 and ManufactureYear != 2005
order by Instrument.Name

--15
select Buyer.Surname, Buyer.Name, Buyer.Patronymic, Instrument.Name, Mark.Name, Provider.Name
from Buyer join Guarantee on Buyer.BuyerID = Guarantee.GuaranteeID
join Cheque c on c.ChequeID = Guarantee.ChequeID
join Instrument on c.InstrumentID = Instrument.InstrumentID
join Mark on Mark.MarkID = Instrument.MarkID
join Provider on Provider.ProviderID = Instrument.ProviderID
order by Surname

--16
select Mark.Name, count(Instrument.InstrumentID)
from Instrument join Mark on Mark.MarkID = Instrument.InstrumentID
group by Mark.Name

--17
select Mark.Name, count(Instrument.InstrumentID)
from Instrument join Mark on Mark.MarkID = Instrument.InstrumentID
join Class on Class.ClassID = Instrument.ClassID
where Class.Name = N'10/10'
group by Mark.Name

--18
select Buyer.Surname, Buyer.Name, Buyer.Patronymic, Instrument.Name, Mark.Name, Provider.Name, count(Class.ClassID)
from Buyer join Guarantee on Buyer.BuyerID = Guarantee.GuaranteeID
join Cheque on Cheque.ChequeID = Guarantee.ChequeID
join Instrument on Cheque.InstrumentID = Instrument.InstrumentID
join Mark on Mark.MarkID = Instrument.MarkID
join Class on Class.ClassID = Instrument.ClassID
join Provider on Provider.ProviderID = Instrument.ProviderID
where Buyer.Number like '33%'
group by Buyer.Surname, Buyer.Name, Buyer.Patronymic, Instrument.Name, Mark.Name, Provider.Name

--19
select Instrument.Name, Mark.Name, SellDate
from Instrument join Mark on Mark.MarkID = Instrument.MarkID
join Cheque on Cheque.InstrumentID = Instrument.InstrumentID
where month(SellDate) between 01 and 07
order by Mark.Name, Instrument.Name

--20
select Class.Name, Instrument.Name
from Class
left join Instrument on Class.ClassID = Instrument.InstrumentID

--21
select Mark.Name, Instrument.Name
from Mark
right join Instrument on Mark.MarkID = Instrument.InstrumentID