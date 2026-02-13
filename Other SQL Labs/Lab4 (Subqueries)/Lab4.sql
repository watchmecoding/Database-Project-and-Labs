use Education_Renamed

--1
select distinct *
from Employee 
where EmployeeId in (select EmployeeId from Exam)
order by Surname, Employee.Name, Patronymic

--2
select distinct *
from Employee 
where EmployeeId not in (select EmployeeId from Exam)
order by Surname, Employee.Name, Patronymic

--3
select distinct *
from Student
where StudentId not in (select StudentId from Exam)
order by Surname, Student.Name, Patronymic

--4 
select distinct *
from Subdivision
where SubdivisionId in (select SubdivisionId from Duties where DutiesId in (select DutiesId from Employee))
order by Subdivision.Name

--5
select distinct *
from Subdivision
where SubdivisionId not in (select SubdivisionId from StudyGroup)
order by Subdivision.Name

--6
select Surname, Student.[Name], Patronymic, StudyGroup.Name
from Student join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
where StudentId in (select StudentId from Exam where Mark = 5)

--7
select distinct Surname, Employee.[Name], Patronymic, Position.Name
from Employee join Duties on Duties.DutiesId = Employee.DutiesId join Position on Duties.PositionId = Position.PositionId
where EmployeeId in (select EmployeeId from Exam where DisciplineId in (select DisciplineId from Discipline where [Name] = N'Математика'))

select distinct Surname, Employee.[Name], Patronymic, Position.Name
from Employee join Exam on Exam.EmployeeId = Employee.EmployeeId join Discipline on Discipline.DisciplineId = Exam.DisciplineId 
join Duties on Duties.DutiesId = Employee.DutiesId join Position on Duties.PositionId = Position.PositionId
where Discipline.[Name] = N'Математика'

--8
select Surname, Employee.Name, Patronymic, Oklad, Nadbavka, Position.Name, Subdivision.Name
from Employee join Duties on Duties.DutiesId = Employee.DutiesId join Position on Duties.PositionId = Position.PositionId
join Subdivision on Subdivision.SubdivisionId = Duties.SubdivisionId
where Nadbavka >= 450 and Oklad > (select avg(Oklad) from Employee)

--9
select Surname, s.Name, Patronymic, RecordBook, Mark, sg.Name
from Student s join Exam e on s.StudentId = e.StudentId join StudyGroup sg on s.StudyGroupId = sg.StudyGroupId
where Mark >= (select avg(Mark) from Exam)

--10
select Surname, s.Name, Patronymic, avg(Mark) as Marks
from Student s join Exam e on s.StudentId = e.StudentId
group by Surname, s.Name, Patronymic
having avg(Mark) > (select avg(Mark) from Exam)

--11
select *
from Employee
where BirthdayCity = (select BirthdayCity from Employee where EmployeeId = 1)

--12
select Surname, Employee.Name, Patronymic
from Employee
where Employee.DutiesId = (select Employee.DutiesId from Employee where Employee.Surname = N'Мацуки')

--13
select *
from Student s
where StudyGroupId = (select StudyGroupId from Student where Surname = N'Масливець')

--14
select count(a.Name)
from(select p.Name, count(EmployeeId) as cnt
	 from Employee e
	 join Duties d on d.DutiesId = e.DutiesId
	 join Position p on d.PositionId = p.PositionId
	 group by p.Name
	 having count(EmployeeId) > 2) as a

--15
select count(a.Name)
from(select sg.Name, count(StudentId) as cnt
	 from Student s join StudyGroup sg on s.StudyGroupId = sg.StudyGroupId
	 group by sg.Name
	 having count(StudentId) > 5) as a

--16
select count(a.StudentId)
from(select s.StudentId, e.DisciplineId, count(e.DisciplineId) as cnt
	 from Student s join Exam e on s.StudentId = e.StudentId
	 group by s.StudentId, e.DisciplineId
	 having count(e.DisciplineId) > 1) as a


--17
select Surname + ' ' + std.Name + ' ' + isnull(Patronymic, '') as FullName,
StudyGroupName, SubName, AvgStudentMark, AvgGroupMark
from Student as std
join (select StudyGroup.StudyGroupId, StudyGroup.Name as StudyGroupName, avg(Mark) as AvgGroupMark, Subdivision.Name as SubName
	  from Student 
	  join StudyGroup on Student.StudyGroupId = StudyGroup.StudyGroupId
	  join Subdivision on StudyGroup.SubdivisionId = Subdivision.SubdivisionId
	  join Exam on Student.StudentId = Exam.StudentId 
	  group by StudyGroup.StudyGroupId, StudyGroup.Name, Subdivision.Name) as sg on std.StudyGroupId = sg.StudyGroupId
join (select StudentId, avg(Mark) as AvgStudentMark 
	  from Exam
	  group by StudentId) as exm on exm.StudentId = std.StudentId  
where AvgStudentMark > AvgGroupMark

--18
select a.StudentId, cast(sum(a.Marks) as float) / cast(count(a.Marks) as float) as AverageMark
from(select ex.DisciplineId, std.StudentId, Max(Mark) as Marks
	 from Student std join Exam ex on std.StudentId = ex.StudentId
	 group by ex.DisciplineId, std.StudentId) as a
group by a.StudentId

--19
select *
from Student
where StudentId not in (select StudentId from Exam where Mark < 5)

--20
select *
from Employee 
where EmployeeId in (select EmployeeId from Exam where DisciplineId in (select DisciplineId from Discipline where Discipline.Name in (N'Математика', N'Фізика')))

-----------------------------------------------------------------------------------------------------------
use Music_Store

--1
select distinct * 
from Provider
where ProviderID in (select ProviderID from Instrument)
order by Provider.Name

--2
select distinct * 
from Provider
where ProviderID not in (select ProviderID from Instrument)
order by Provider.Name

--3
select distinct * 
from Class
where ClassID not in (select ClassID from Instrument)
order by Class.Name

--4
select distinct * 
from Mark
where MarkID in (select MarkID from Instrument where InstrumentID in (select InstrumentID from Cheque))
order by Mark.Name

--5
select distinct * 
from Mark
where MarkID not in (select ClassID from Instrument)
order by Mark.Name

--6
select Instrument.Name, Price, Mark.Name
from Instrument join Mark on Instrument.MarkID = Mark.MarkID
where InstrumentID in (select InstrumentID from Cheque where month(SellDate) = 07)

--7
select Instrument.Name, Mark.Name
from Cheque join Instrument on Cheque.InstrumentID = Instrument.InstrumentID join Mark on Mark.MarkID = Instrument.MarkID
where ChequeID in (select ChequeID from Guarantee where [Start] > '2024-01-01')

--8
select Instrument.Name, Mark.Name, Provider.Name
from Instrument join Mark on Mark.MarkID = Instrument.MarkID join Provider on Provider.ProviderID = Instrument.ProviderID
where ManufactureYear > 2010 and Price > (select avg(Price) from Instrument)

--9
select Instrument.Name, ClassID, ManufactureYear, Amount
from Cheque join Instrument on Instrument.InstrumentID = Cheque.InstrumentID
where Amount >= (select avg(Amount) from Cheque)

--10
select Mark.Name
from Instrument join Mark on Mark.MarkID = Instrument.MarkID
group by Mark.Name
having avg(Price) > (select avg(Price) from Instrument)

--11
select *
from Provider
where Address = (select Address from Provider where ProviderID = 7)

--12
select distinct Instrument.Name
from Instrument
where ClassID in (select ClassID from Instrument where Instrument.Name = N'Піаніно')
group by Instrument.Name
having avg(Price) > (select avg(Price) from Instrument)
order by Instrument.Name desc

--13
select *
from Instrument
where Instrument.Name = N'Фортепіано'

--14
select count(tab.BuyerID)
from(select b.BuyerID, count(g.GuaranteeID) as grnts
		from Buyer b
		join Guarantee g on b.BuyerID = g.BuyerID
		group by b.BuyerID
		having count(g.GuaranteeID) > 1) as tab

--15
select count(tab.ClassID)
from(select c.ClassID, count(i.InstrumentID) as grnts
		from Class c join Instrument i on c.ClassID = i.InstrumentID
		group by c.ClassID
		having count(i.InstrumentID) > 0) as tab

--16
select count(tab.MarkID)
from(select m.MarkID, g.BuyerID, count(m.MarkID) as cnt
		from Instrument i join Cheque ch on i.InstrumentID = ch.ChequeID
						  join Guarantee g on g.ChequeID = ch.ChequeID
						  join Mark m on m.MarkID = i.MarkID
		group by m.MarkID, g.BuyerID
		having count(m.MarkID) > 0) as tab

--17
select inst.Name as FullName, sg.MarkName, AvgEx, AvgMark
from Instrument as inst
join (select Mark.MarkID, Mark.Name as MarkName, avg(Amount) as AvgMark
		from Instrument
		join Mark on Instrument.MarkID = Mark.MarkID
		join Cheque on Cheque.InstrumentID = Instrument.InstrumentID	
		group by Mark.MarkID, Mark.Name) as sg on inst.MarkID = sg.MarkID
join (select InstrumentID, avg(Amount) as AvgEx
		from Cheque
		group by InstrumentID) as exm on exm.InstrumentID = inst.InstrumentID  
where AvgEx > AvgMark

--18
select a.MarkID, cast(sum(a.Prices) as float) / cast(count(a.Prices) as float) as AverageMark
from (select inst.ProviderID, mr.MarkID, Max(Price) as Prices
	from Mark mr join Instrument inst on mr.MarkID = inst.MarkID
	group by inst.ProviderID, mr.MarkID) as a
group by a.MarkID

--19
select *
from Mark
where MarkID in (select MarkID from Instrument where ManufactureYear = 2020)

--20
select * 
from Provider
where ProviderID in (select ProviderID from Instrument where ClassID in (select ClassID from Class where Class.Name = N'6/10'))
and ProviderID in (select ProviderID from Instrument where ClassID in (select ClassID from Class where Class.Name = N'4/10'))