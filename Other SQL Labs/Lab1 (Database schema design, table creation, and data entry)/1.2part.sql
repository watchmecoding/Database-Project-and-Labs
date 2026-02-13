USE Education_Renamed

CREATE TABLE Subdivision (
	SubdivisionId int Identity NOT NULL,
	[Name] nvarchar(250) NOT NULL,
	CONSTRAINT PK_SubdivisionId PRIMARY KEY (SubdivisionId));

CREATE TABLE Position (
	PositionId int Identity NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	CONSTRAINT PK_PositionId PRIMARY KEY (PositionId));

CREATE TABLE Discipline (
	DisciplineId int Identity NOT NULL,
	[Name] nvarchar(250) NOT NULL,
	CONSTRAINT PK_DisciplineId PRIMARY KEY (DisciplineId));

CREATE TABLE StudyGroup (
	StudyGroupId int Identity NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	SubdivisionId int NOT NULL,
	DataVstup date NULL,
	CONSTRAINT PK_StudyGroupId PRIMARY KEY (StudyGroupId),
	CONSTRAINT FK_StudyGroup_Subdivision FOREIGN KEY (SubdivisionId) REFERENCES Subdivision (SubdivisionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE );

CREATE TABLE Duties (
	DutiesId int Identity NOT NULL,
	PositionId int NOT NULL,
	SubdivisionId int,
	CONSTRAINT PK_DutiesId PRIMARY KEY (DutiesId),
	CONSTRAINT FK_Duties_Position FOREIGN KEY (PositionId) REFERENCES Position (PositionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Duties_Subdivision FOREIGN KEY (SubdivisionId) REFERENCES Subdivision (SubdivisionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE );

CREATE TABLE Employee (
	EmployeeId int Identity,
	Surname nvarchar(20) NOT NULL,
	[Name] nvarchar(15) NOT NULL,
	Patronymic nvarchar(20) NULL,
	DutiesId int,
	BirthdayCity nvarchar(10),
	Birthday date,
	Oklad money NOT NULL,
	Nadbavka money,
	DataVuplatu date,
	CONSTRAINT PK_EmployeeId PRIMARY KEY (EmployeeId),
	CONSTRAINT FK_Employee_Duties FOREIGN KEY (DutiesId) REFERENCES Duties (DutiesId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Student (
	StudentId int Identity NOT NULL,
	Surname nvarchar(20) NOT NULL,
	Name nvarchar(15) NOT NULL,
	Patronymic nvarchar(20) NULL,
	StudyGroupId int NOT NULL,
	RecordBook nvarchar(10) NOT NULL,
	BirthdayCity nvarchar(10),
	Birthday date NOT NULL,
	Stipendia money,
	CONSTRAINT PK_StudentId PRIMARY KEY (StudentId),
	CONSTRAINT FK_Student_StudyGroup FOREIGN KEY (StudyGroupId) REFERENCES StudyGroup (StudyGroupId)
		ON DELETE CASCADE
		ON UPDATE CASCADE );

CREATE TABLE Exam (
	ExamId int Identity NOT NULL,
	Mark int NOT NULL,
	DateExam date NOT NULL,
	StudentId int NOT NULL,
	DisciplineId int NOT NULL,
	EmployeeId int NOT NULL,
	CONSTRAINT PK_ExamId PRIMARY KEY (ExamId),
	CONSTRAINT FK_Exam_Discipline FOREIGN KEY (DisciplineId) REFERENCES Discipline (DisciplineId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Exam_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Exam_Student FOREIGN KEY (StudentId) REFERENCES Student (StudentId));

ALTER TABLE Discipline ADD Actuality BIT DEFAULT 1;

INSERT INTO Discipline ([Name]) VALUES 
									 (N'Математика'),
									 (N'Фізика'),
									 (N'Хімія'),
									 (N'Англійська'),
									 (N'Історія'),
									 (N'Право'),
									 (N'Економіка'),
									 (N'Французький');

INSERT INTO Position ([Name]) VALUES 
								   (N'Доцент'),
								   (N'Асистент'),
								   (N'Професор'),
								   (N'Методист'),
								   (N'Інспектор'),
								   (N'Начальник'),
								   (N'Лаборант'),
								   (N'Лаборант старший');

INSERT INTO Subdivision ([Name]) VALUES
							   (N'Кафедра 1'),
							   (N'Кафедра 2'),
							   (N'Управління 1'),
							   (N'Управління 2'),
							   (N'Сектор 1'),
							   (N'Сектор 2'),
							   (N'Департамент 1'),
							   (N'Відділ 1');

INSERT INTO StudyGroup ([Name], SubdivisionId) VALUES
						  (N'ІК-11', 1),
						  (N'ІК-12', 1),
						  (N'ІК-23', 2),
						  (N'ІК-24', 2);

INSERT INTO Duties (PositionId, SubdivisionId) VALUES
						  (1, 1),
						  (2, 1),
						  (3, 1),
						  (4, 8),
						  (5, 8),
						  (6, 7),
						  (7, 5),
						  (1, 2),
						  (2, 2),
						  (3, 2),
						  (8, 6);

INSERT INTO Employee (Surname, [Name], Patronymic, DutiesId, BirthdayCity, Birthday, Oklad, Nadbavka, DataVuplatu) VALUES
							(N'Петренко', N'Максим', N'Леонідович', 1, N'Київ', '1954-03-23', 4000.5666, 300.00, '1954-03-23'),
						    (N'Новіков', N'Степан', N'Федорович', 1, N'Київ', '1955-04-21', 1400.061, 256.00, '1955-04-21'),
						    (N'Бобков', N'Віктор', N'Борисович', 2, N'Львів', '1965-06-14', 4000.0598, 123.00, '1965-06-14'),
						    (N'Ванжула', N'Оксана', N'Петрівна', 2, N'Київ', '1945-02-12', 3200.4657, 456.00, '1945-02-12'),
										(N'Мацуки', N'Йоши', Null, 3, N'Кацапстан', '1978-07-07', 2000.00, 789.00, '1978-07-07'),
							(N'Петренко', N'Максим', N'Леонідович', 3,  N'Луцьк', '1980-03-12', 4800.00, 321.00, '1980-03-12'),
							(N'Петренко', N'Максим', N'Леонідович', 3, N'Київ', '1974-09-17', 7000.00, 654.00, '1974-09-17'),
							(N'Коваленко', N'Тетяна', N'Іванівна', 3, N'Ялта', '1966-11-23', 4000.00, 987.00, '1966-11-23'),
														('', '', Null, 8, N'Харків', '1968-10-27', 4532.11, 544.00, '1968-10-27'),
														('', '', Null, 8, N'Харків', '1963-05-22', 4364.63, 321.00, '1963-05-22'),
							(N'Петрунько', N'Максим', N'Семенович', 4, N'Київ', '1966-04-12', 1569.00, 147.00, '1966-04-12'),
							(N'Петрашин', N'Генадій', N'Борисович', 4, N'Київ', '1966-10-23', 3569.00, 258.00, '1966-10-23'),
										(N'Минако', N'Азар', Null, 5, N'Кацапстан', '1965-05-23', 3000.00, 550.00, '1965-05-23'),
							(N'Варламов', N'Генадій', N'Леонідович', 5, N'Кацапстан', '1963-05-03', 5000.00, 350.00, '1963-05-03'),
														('', '', Null, 3, N'Харків', '1973-09-19', 4743.00, 533.00, '1973-09-19'),
														('', '', Null, 3, N'Харків', '1955-03-18', 4855.00, 732.00, '1955-03-18'),
							(N'Бобков', N'Віктор', N'Борисович', 5, N'Кацапстан', '1978-07-07', 5698.265, 357.00, '1978-07-07'),
							(N'Петренко', N'Генадій', N'Ібрагимович', 6, N'Кацапстан', '1978-07-07', 3698.2569, 862.00, '1978-07-07'),
							(N'Варламов', N'Йоши', N'Федорович', 6, N'Луцьк', '1988-07-07', 2589.3214, 3579.00, '1988-07-07'),
							(N'Коваленко', N'Генадій', N'Ібрагимович', 8, N'Луцьк', '1956-05-11', 4569.2365, 501.00, '1956-05-11'),
										(N'Мухамед', N'Ібрагім', Null, 8, N'Луцьк', '1948-10-18', 1478.2365, 123.369, '1948-10-18'),
							(N'Варламов', N'Генадій', N'Ібрагимович', 9, N'Ялта', '1983-03-07', 2589.32, 321.963, '1983-03-07'),
							(N'Петренко', N'Віктор', N'Ібрагимович', 10, N'Ялта', '1948-07-12', 3698.3569, 569.569, '1948-07-12'),
							(N'Варламов', N'Степан', N'Ібрагимович', 11, N'Львів', '1968-01-07', 5698.321, 789.321, '1968-01-07'),
							(N'Новіков', N'Генадій', N'Ібрагимович', 11, N'Львів', '1905-12-07', 5478.53, 789.546, '1905-12-07');

INSERT INTO Student (Surname, [Name], Patronymic, StudyGroupId, RecordBook, BirthdayCity, Birthday, Stipendia) VALUES
						   (N'Стасюк', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Київ', '19891205', 100),
						   (N'Сиденко', N'Катя', N'Леонідівна', 1, N'ІК-11-02', N'Тернопіль', '19901106', 200),
						   (N'Сиденко', N'Катя', N'Леонідівна', 1, N'ІК-11-02', N'Київ', '19901007', NULL),
						   (N'Мельниченко', N'Максим', N'Леонідович', 2, N'ІК-12-01', N'Чернігів', '19900910', 300),
						   (N'Карнага', N'Ярослав', Null, 2, N'ІК-12-03', N'Київ', '19900714', 200),
						   (N'Карнага', N'Ярослава', N'Ігоревня', 2, N'ІК-12-03', N'Кацапстан', '19900714', NULL),
						   (N'Волокита', N'Артем', N'Миколайович', 3, N'ІК-23-01', N'Київ', '19920105', NULL),
						   (N'Саливоненко', N'Наталка', N'Анатоліївна', 3, N'ІК-23-02', N'Київ', '19910309', 300),
						   (N'Краснонос', N'Наталка', N'Іванівна', 4, N'ІК-24-01', N'Черкаси', '19910512', 741),
						   (N'Персиков', N'Іван', N'Петрович', 4, N'ІК-24-03', N'Київ', '19920723', 300),
						   (N'Перончиков', N'Михайло', Null, 4, N'ІК-24-04', N'Луцьк', '19940612', 598),
						   (N'Пасичников', N'Михайло', N'Петрович', 4, N'ІК-24-04', N'Луцьк', '19940612', 985),
						   (N'Масливець', N'Артем', N'Петрович', 4, N'ІК-24-04', N'Київ', '19940612', NULL),
						   (N'Карнага', N'Ярослав', N'Ігоревич', 2, N'ІК-12-12', N'Ялта', '19900714', 620),
						   (N'Карнага', N'Станіслав', N'Ігоревич', 2, N'ІК-12-12', N'Київ', '19900714', NULL),
						   (N'Карнага', N'Мирослав', Null, 4, N'ІК-12-12', N'Тертер', '19900714', NULL),
						   ('', '', Null, 2, N'ІК-12-14', N'Харків', '19790811', NULL),
						   ('', '', Null, 2, N'ІК-12-15', N'Харків', '19800128', NULL),
						   ('', '', Null, 2, N'ІК-12-16', N'Харків', '19810426', NULL),
						   ('', '', Null, 2, N'ІК-12-17', N'Харків', '19820223', NULL),
						   (N'Назаревич', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Київ', '19901205', 635),
						   (N'Паничев', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Ялта', '19871205', 300),
						   (N'Панкоат', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Київ', '19901205', 300),
						   (N'Панкоат', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Київ', '19901205', 500),
						   (N'Панкотов', N'Артем', Null, 1, N'ІК-11-01', N'Черкаси', '19901205', NULL),
						   (N'Панкоат', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Київ', '19901205', NULL),
						   (N'Панкотов', N'Сеня', Null, 1, N'ІК-11-01', N'Київ', '19901205', 500),
						   (N'Панко', N'Назар', N'Леонідович', 1, N'ІК-11-01', N'Ялта', '19901205', 620),
						   (N'Пароч', N'Сеня', Null, 1, N'ІК-11-01', N'Київ', '19901205', NULL),
						   (N'Стасюк', N'Назар', N'Леонідович', 1, N'ІК-11-56', N'Київ', '19891206', 130);

INSERT INTO Exam (Mark, DateExam, StudentId, DisciplineId, EmployeeId) VALUES
						(5, '20130601', 1, 1, 1),
						(4, '20130601', 2, 1, 1),
						(3, '20130601', 3, 1, 2),
						(2, '20130601', 4, 1, 3),
						(5, '20130601', 17, 1, 3),
						(4, '20130601', 6, 1, 1),
						(3, '20130605', 1, 2, 2),
						(2, '20130605', 2, 2, 2),
						(4, '20130605', 3, 2, 20),
						(4, '20130605', 4, 2, 9),
						(3, '20130605', 17, 2, 1),
						(5, '20130605', 6, 2, 22),
						(3, '20130607', 1, 3, 3),
						(4, '20130607', 2, 3, 23),
						(4, '20130607', 3, 3, 23),
						(5, '20130607', 4, 3, 8),
						(4, '20130607', 17, 3, 8),
						(3, '20130607', 6, 3, 3),
						(4, '20130609', 1, 1, 4),
						(5, '20130609', 2, 4, 20),
						(3, '20130609', 3, 4, 8),
						(4, '20130609', 4, 4, 8),
						(3, '20130609', 17, 4, 9),
						(5, '20130609', 6, 4, 22),
						(5, '20130602', 7, 5, 8),
						(4, '20130602', 8, 5, 23),
						(3, '20130602', 9, 5, 1),
						(2, '20130602', 10, 5, 4),
						(3, '20130606', 7, 6, 15),
						(2, '20130606', 8, 6, 15),
						(4, '20130606', 9, 6, 6),
						(4, '20130606', 10, 6, 6),
						(3, '20130610', 7, 7, 7),
						(4, '20130610', 8, 7, 7),
						(4, '20130610', 9, 7, 7),
						(5, '20130601', 10, 7, 7),
						(4, '20130610', 7, 4, 4),
						(5, '20130610', 8, 4, 4),
						(3, '20130610', 9, 4, 4),
						(4, '20130610', 10, 4, 4),
						(5, '20130612', 7, 1, 8),
						(4, '20130612', 8, 1, 8),
						(3, '20130612', 9, 1, 8),
						(2, '20130612', 10, 1, 8),
						(4, '20130614', 7, 8, 4),
						(3, '20130614', 8, 8, 4),
						(5, '20130614', 9, 8, 4);