USE Education_Renamed;

CREATE TABLE Subdivision (
	SubdivisionId int primary key NOT NULL,
	Name nvarchar(250) NOT NULL,
	CONSTRAINT PK_SubdivisionId PRIMARY KEY (SubdivisionId));

CREATE TABLE Position (
	PositionId int primary key NOT NULL,
	Name nvarchar(50) NOT NULL,
	CONSTRAINT PK_PositionId PRIMARY KEY (PositionId));

CREATE TABLE Discipline (
	DisciplineId int primary key NOT NULL,
	Name nvarchar(250) NOT NULL,
	CONSTRAINT PK_DisciplineId PRIMARY KEY (DisciplineId));

CREATE TABLE StudyGroup (
	StudyGroupId int primary key NOT NULL,
	Name nvarchar(100) NOT NULL,
	SubdivisionId int foreign key references Subdivision(SubdivisionId) NOT NULL,
	DataVstup date,
	CONSTRAINT PK_StudyGroupId PRIMARY KEY (StudyGroupId),
	CONSTRAINT FK_StudyGroup_Subdivision FOREIGN KEY (SubdivisionId) REFERENCES Subdivision (SubdivisionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Student (
	StudentId int primary key NOT NULL,
	Surname nvarchar(20) NOT NULL,
	Name nvarchar(15) NOT NULL,
	Patronymic nvarchar(20),
	StudyGroupId int foreign key references StudyGroup(StudyGroupId) NOT NULL,
	RecordBook nvarchar(10) NOT NULL,
	BirthdayCity nvarchar(10),
	Birthday date NOT NULL,
	Stipendia money,
	CONSTRAINT PK_StudentId PRIMARY KEY (StudentId),
	CONSTRAINT FK_Student_StudyGroup FOREIGN KEY (StudyGroupId) REFERENCES StudyGroup (StudyGroupId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Duties (
	DutiesId int primary key NOT NULL,
	PositionId int foreign key references Position(PositionId) NOT NULL,
	SubdivisionId int foreign key references Subdivision(SubdivisionId),
	CONSTRAINT PK_DutiesId PRIMARY KEY (DutiesId),
	CONSTRAINT FK_Duties_Position FOREIGN KEY (PositionId) REFERENCES Position (PositionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Duties_Subdivision FOREIGN KEY (SubdivisionId) REFERENCES Subdivision (SubdivisionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Employee (
	EmployeeId int primary key,
	Surname nvarchar(20) NOT NULL,
	Name nvarchar(15) NOT NULL,
	Patronymic nvarchar(20),
	DutiesId int foreign key references Duties(DutiesId),
	BirthdayCity nvarchar(10),
	Birthday date,
	Oklad money NOT NULL,
	Nadbavka money,
	DataVuplatu date,
	CONSTRAINT PK_EmployeeId PRIMARY KEY (EmployeeId),
	CONSTRAINT FK_Employee_Duties FOREIGN KEY (DutiesId) REFERENCES Duties (DutiesId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Exam (
	ExamId int primary key NOT NULL,
	Mark int NOT NULL,
	DateExam date NOT NULL,
	StudentId int foreign key references Student(StudentId) NOT NULL,
	DisciplineId int foreign key references Discipline(DisciplineId) NOT NULL,
	EmployeeId int foreign key references Employee(EmployeeId) NOT NULL);

CREATE TABLE Subdivision (
	SubdivisionId int primary key NOT NULL,
	Name nvarchar(250) NOT NULL);

CREATE TABLE Position (
	PositionId int primary key NOT NULL,
	Name nvarchar(50) NOT NULL);

CREATE TABLE Discipline (
	DisciplineId int primary key NOT NULL,
	Name nvarchar(250) NOT NULL);

CREATE TABLE StudyGroup (
	StudyGroupId int primary key NOT NULL,
	Name nvarchar(100) NOT NULL,
	SubdivisionId int foreign key references Subdivision(SubdivisionId) NOT NULL,
	DataVstup date,
	CONSTRAINT PK_StudyGroupId PRIMARY KEY (StudyGroupId),
	CONSTRAINT FK_StudyGroup_Subdivision FOREIGN KEY (SubdivisionId) REFERENCES Subdivision (SubdivisionId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Student (
	StudentId int primary key NOT NULL,
	Surname nvarchar(20) NOT NULL,
	Name nvarchar(15) NOT NULL,
	Patronymic nvarchar(20),
	StudyGroupId int foreign key references StudyGroup(StudyGroupId) NOT NULL,
	RecordBook nvarchar(10) NOT NULL,
	BirthdayCity nvarchar(10),
	Birthday date NOT NULL,
	Stipendia money,
	CONSTRAINT PK_StudentId PRIMARY KEY (StudentId),
	CONSTRAINT FK_Student_StudyGroup FOREIGN KEY (StudyGroupId) REFERENCES StudyGroup (StudyGroupId)
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Duties (
	DutiesId int primary key NOT NULL,
	PositionId int foreign key references Position(PositionId) NOT NULL,
	SubdivisionId int foreign key references Subdivision(SubdivisionId));

CREATE TABLE Employee (
	EmployeeId int primary key,
	Surname nvarchar(20) NOT NULL,
	Name nvarchar(15) NOT NULL,
	Patronymic nvarchar(20),
	DutiesId int foreign key references Duties(DutiesId),
	BirthdayCity nvarchar(10),
	Birthday date,
	Oklad money NOT NULL,
	Nadbavka money,
	DataVuplatu date);

CREATE TABLE Exam (
	ExamId int primary key NOT NULL,
	Mark int NOT NULL,
	DateExam date NOT NULL,
	StudentId int foreign key references Student(StudentId) NOT NULL,
	DisciplineId int foreign key references Discipline(DisciplineId) NOT NULL,
	EmployeeId int foreign key references Employee(EmployeeId) NOT NULL);
	CONSTRAINT PK_ExamId PRIMARY KEY (ExamId),
	CONSTRAINT FK_Exam_Discipline FOREIGN KEY (DisciplineId) REFERENCES Discipline (DisciplineId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Exam_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Exam_Student FOREIGN KEY (StudentId) REFERENCES Student (StudentId)