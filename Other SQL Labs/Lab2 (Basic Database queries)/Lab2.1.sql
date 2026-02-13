use Education_Renamed;

--1
select * 
from Discipline

select *
from StudyGroup

select * 
from Position

--2
select distinct Surname, [Name], Patronymic, Oklad 
from Employee

--3
select DateExam, Mark, StudentId, EmployeeId
from Exam

--4
select Surname, [Name], Patronymic, Stipendia, StudentId
from Student
where Stipendia < 300

--5
select Surname, [Name], Patronymic, Stipendia, StudentId, BirthdayCity
from Student
where Stipendia > 500 and BirthdayCity = N'Київ'

--6
select Surname, [Name], Patronymic, StudentId, BirthdayCity
from Student
where BirthdayCity != N'Київ'

--7
select Surname, [Name], Patronymic, StudentId, BirthdayCity
from Student
where BirthdayCity = N'Київ' or BirthdayCity like N'Тер%'

--8
select Surname, [Name], Patronymic, StudentId, BirthdayCity, Stipendia
from Student
where (BirthdayCity = N'Київ' and Stipendia = 300) or BirthdayCity = N'Черкаси'

--9
select Surname, [Name], Patronymic, StudentId, Birthday
from Student
where Birthday between '1989-01-01' and '1990-12-31'

--10
select Surname, [Name], Patronymic, StudentId, Birthday, Stipendia
from Student
where (Birthday between '1989-01-01' and '1990-12-31') and (Stipendia >= 600)

--11
select Surname, [Name], Patronymic, StudentId, Birthday, Stipendia
from Student
where Birthday < '1989-01-01' or Birthday > '1990-12-31'

--12
select Mark, DisciplineId, EmployeeId
from Exam
where (DisciplineId between 1 and 3) and (EmployeeId = 1 or EmployeeId = 8)

--13
select Mark, DisciplineId, EmployeeId
from Exam
where (DisciplineId between 1 and 3) and (EmployeeId = 1 or EmployeeId = 8)

--14
select *
from Employee
where Surname like N'Пет%'

--15
SELECT * 
FROM Employee
WHERE Year(Birthday) = 1966

--16
select *
from Employee
where Birthday like '%-05-%'

--17
select *
from Employee
where Birthday like '%05%'

--18
select *
from Employee
where Birthday like '%-05-%' and Nadbavka >= 500

--19
select *
from Student
where Patronymic is not null and Stipendia != 500

--20
select *
from Student
where Patronymic is null

--21
select Surname, [Name], Patronymic, EmployeeId
from Employee
where DutiesId in (select DutiesId from Duties where PositionId = 3) and Patronymic is not null

--22
select distinct Surname, [Name], Patronymic 
from Employee
order by Surname, [Name], Patronymic 

--23
select distinct Stipendia
from Student
order by Stipendia desc

--24
select count(*)
from Student

--25
select count(Surname), count([Name]), count(Patronymic)
from Student

--26
select count([Name])
from Student

--27
select count(Surname), count([Name])
from Student

--28
select count(Patronymic)
from Student

--29
select count(*)
from Student
where Stipendia = 300

--30
select count(*), min(Oklad), max(Oklad), avg(Oklad)
from Employee

--31
select PositionId as N'Ідентифікатор', count(*) as N'Всього', min(Oklad) as N'Мінімум', max(Oklad) as N'Максимум', avg(Oklad) as N'Середнє'
from Employee 
join Duties on (Employee.DutiesId = Duties.DutiesId)
group by PositionId
order by PositionId

--32
select PositionId as N'Ідентифікатор', count(*) as N'Всього', min(Oklad) as N'Мінімум', max(Oklad) as N'Максимум', avg(Oklad) as N'Середнє'
from Employee 
join Duties on (Employee.DutiesId = Duties.DutiesId)
WHERE DATEDIFF(year, DataVuplatu, '1950') <= 20
group by PositionId
order by PositionId

--33
select *
from Duties
where PositionId != (select PositionId from Position where [Name] = N'Професор')

--34
select distinct count(Surname)
from Student

--35
select distinct count(Surname)
from Student
where [Name] like N'%К'

--36
select distinct DutiesId
from Employee
where Nadbavka + Oklad > 5000

--37
select BirthdayCity as N'Місто народження', count(EmployeeId) as N'Кількість робітників'
from Employee
group by BirthdayCity

--38
select Mark as N'Оцінка', count(StudentId) as N'Кількість студентів', count(DisciplineId) as N'Кількість дисциплін'
from Exam
group by Mark

--39
select [Name] as N'Кількість дисциплін', count(StudentId) as N'Кількість зарахованих студентів' 
from Exam, Discipline 
where Mark != 2 and Discipline.DisciplineId = Exam.DisciplineId 
group by [Name]

--40
select [Name] as N'Кількість дисциплін', count(StudentId) as N'Кількість зарахованих студентів' 
from Exam, Discipline 
Where Mark = 5 and Discipline.DisciplineId = Exam.DisciplineId 
Group by Name

--41
select DateExam, count(ExamId) as N'Кількість екзаменів' 
from Exam 
Group by DateExam 
Order by DateExam

--42
select DateExam, count(ExamId) as N'Кількість екзаменів' 
from Exam 
group by DateExam
having count(ExamId) > 5 
order by DateExam

--43
select * 
from Student 
where BirthdayCity = N'Київ' and Stipendia >=500

--44
select Surname +' '+e.[Name]+' ' + Patronymic, Birthday,Oklad,Nadbavka, p.[Name] 
from Employee as e, Duties as d,  Position as p
where e.DutiesId= d.DutiesId and d.PositionId = p.PositionId and Birthday between '1945-01-01' and '1965-12-31' and Oklad+Nadbavka >= 5000

--45
select p.[Name], avg(Oklad) as N'Середня виплата' 
from Employee as e, Duties as d,  Position as p
where (e.DutiesId= d.DutiesId and d.PositionId = p.PositionId) and e.Birthday between '1945-01-01' and '1965-12-31' 
group by p.[Name] 

--46
select count(Patronymic) from Student
select count(DISTINCT Patronymic) from Student
select count(*) from Student where Patronymic is null

--47
select avg(Oklad), SUM(Oklad)/count(Oklad) 
FROM Employee

--48
select max(Oklad) as N'Максимальний', min(Oklad) as N'Мінімальний', max(Oklad)+100 as N'Максимальний + 100 ', min(Oklad)+100 as N'Мінімальний + 100' 
FROM Employee

--49
select s.Surname +' '+s.[Name]+' ' + s.Patronymic as N'ФІО', avg(Mark) as N'Середня оцінка' 
from Exam as e, Student as s 
where e.StudentId = s.StudentId 
group by s.Surname +' '+s.[Name]+' ' + s.Patronymic 
having avg(Mark) >3

--50
select Nadbavka+Oklad as N'Виплати' 
from Employee 
where Nadbavka+Oklad>4300

--51
select pos.Name as N'Назва посади', 
avg(Oklad + isnull(Nadbavka, 35)) AS N'Середній оклад'
from Employee as emp
join Duties as dty on emp.DutiesId = dty.DutiesId
join Position as pos on dty.PositionId = pos.PositionId
group by pos.Name 
having avg(Oklad + isnull(Nadbavka, 35)) > 4500

--52
select Surname +' '+[Name]+' '+ Patronymic as FullName, BirthdayCity 
from Employee 
where (select (avg((Oklad) + isnull(Nadbavka, 0))) from Employee) = (select avg(Oklad) from Employee)