USE Music_Store;

CREATE TABLE Class (
	ClassID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	[Description] nvarchar(250));

CREATE TABLE Mark (
	MarkID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	ProducerCountry nvarchar(250),
	[Description] nvarchar(250));

CREATE TABLE [Provider] (
	ProviderID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(250) NOT NULL,
	[Address] nvarchar(250),
	Number nvarchar(12));

CREATE TABLE Instrument (
	InstrumentID int Identity PRIMARY KEY NOT NULL, 
	MarkID int FOREIGN KEY REFERENCES Mark(MarkID),
	ManufactureYear int,
	ClassID int FOREIGN KEY REFERENCES Class(ClassID),
	[Name] nvarchar(250) NOT NULL,
	Characteristics nvarchar(250),
	Price decimal NOT NULL,
	ProviderID int FOREIGN KEY REFERENCES [Provider](ProviderID));

CREATE TABLE Cheque (
	ChequeID int Identity PRIMARY KEY NOT NULL, 
	InstrumentID int FOREIGN KEY REFERENCES Instrument(InstrumentID),
	Amount int,
	SellDate date);

CREATE TABLE Buyer (
	BuyerID int Identity PRIMARY KEY NOT NULL, 
	[Name] nvarchar(100),
	Surname nvarchar(100),
	Patronymic nvarchar(100),
	Number nvarchar(100));

CREATE TABLE Guarantee (
	GuaranteeID int Identity PRIMARY KEY NOT NULL, 
	BuyerID int FOREIGN KEY REFERENCES Buyer(BuyerID),
	ChequeID int FOREIGN KEY REFERENCES Cheque(ChequeID),
	[Start] date,
	[End] date,
	[Description] nvarchar(250));

alter table Guarantee add Validity AS DATEDIFF(day, [Start], [End]);

INSERT INTO Class VALUES
	(N'10/10', N'Найвища якість'),
	(N'9/10', N'Висока якість'),
	(N'8/10', N'Висока якість'),
	(N'7/10', N'Вище середнього'),
	(N'6/10', N'Вище середнього'),
	(N'5/10', N'Середня якість'),
	(N'4/10', N'Нижче середнього'),
	(N'3/10', N'Погана якість'),
	(N'2/10', N'Погана якість'),
	(N'1/10', N'Гірше не буває');

INSERT INTO Mark VALUES
	(N'Yamaha', N'Japan', N'Моделі на будь-який бюджет'),
	(N'Takamine', N'USA', N'Оптимальна ціна/якість'),
	(N'Fender', N'Japan', N'Моделі на будь-який бюджет'),
	(N'Gibson', N'Usa', N'Люксові моделі'),
	(N'Ibanez', N'Japan', N'Середній ціновий сегмент'),
	(N'Taylor', N'USA', N'Середній ціновий сегмент'),
	(N'Martin', N'USA', N'Бюджетні моделі'),
	(N'Crafter', N'Korea', N'Бюджетні моделі'),
	(N'Martinez', N'China', N'Надбюджетні моделі'),
	(N'Epiphone', N'USA', N'Бюджетні варіанти топових моделей');

INSERT INTO [Provider] VALUES
	(N'YamahaPR', N'вул. Шевченка, 59', '5692345'),
	(N'TakaminePR', N'вул .Тростянецька, 98', '0716361'),
	(N'FenderPR', N'вул. Каштанова, 09', '2747592'),
	(N'GibsonPR', N'вул. Бальзака, 12', '8316634'),
	(N'IbanezPR', N'вул. Лесі Українки, 14', '5555789'),
	(N'TaylorPR', N'вул. Саксаганського, 03', '9764368'),
	(N'MartinPR', N'просп. Драйзера, 21', '1821019'),
	(N'CrafterPR', N'вул. Воскресенська, 72', '9081735'),
	(N'MartinezPR', N'вул. Гагаріна, 09', '7648323'),
	(N'EpiphonePR', N'просп. Григоренка, 84', '9021653');

INSERT INTO Instrument VALUES
	(1, 2024, 1, N'Гітара', N'Бас шестиструнний', 12500.0, 1),
	(2, 2024, 2, N'Гітара', N'Акустика', 50500.0, 2),
	(3, 2024, 3, N'Піаніно', N'Електронне', 12000.0, 3),
	(4, 2023, 4, N'Саксофон', N'Базовий', 15000.0, 4),
	(5, 2022, 5, N'Фортепіано', N'Базове', 34000.0, 5),
	(6, 2024, 6, N'Скрипка', N'Антикваріатна', 12500.50, 6),
	(7, 2024, 7, N'Гітара', N'Електро', 87600.0, 7),
	(8, 2015, 8, N'Барабани', N'Великі', 90800.0, 8),
	(9, 2000, 9, N'Гітара', N'Акустика', 43200.0, 9),
	(10,2020, 10, N'Скрипка', N'Базова', 39700.0, 10),
	(1, 2024, 5, N'Фортепіано', N'Електронне', 34000.0, 5),
	(2, 2020, 6, N'Саксофон', N'Подовжений', 50500.0, 6),
	(3, 2019, 7, N'Барабани', N'Середні', 87600.0, 7),
	(4, 2018, 8, N'Піаніно', N'Електронне', 90800.0, 8),
	(5, 2020, 9, N'Саксофон', N'Базовий', 43200.0, 9);

INSERT INTO Cheque VALUES
	(1, 15, '2024-08-15'),
	(2, 3, '2024-08-08'),
	(3, 7, '2024-09-07'),
	(4, 8, '2024-10-15'),
	(5, 10, '2024-06-04'),
	(6, 3, '2024-07-07'),
	(7, 10, '2024-08-22'),
	(8, 13, '2024-07-30'),
	(9, 16, '2024-04-17'),
	(10, 20, '2024-03-14'),
	(11, 2, '2024-03-19'),
	(12,18, '2024-03-16'),
	(13, 14, '2024-08-09'),
	(14, 17, '2024-10-04'),
	(15, 6, '2024-11-15');

INSERT INTO Buyer VALUES
	(N'Владислав', N'Філімоненко', N'Олексійович', '11111111'),
	(N'Максим', N'Новицький', N'Сергiйович', '222222222'),
	(N'Лiя', N'Павленко', N'Олегівна', '333333333'),
	(N'Олександр', N'Черненко', N'Євгенович', '44444444'),
	(N'Анастасiя', N'Лінчук', N'Вадимiвна', '55555555'),
	(N'Олександр', N'Ворона', N'Дмитрович', '666666666'),
	(N'Надiя', N'Булботка', N'Вікторівна', '77777777'),
	(N'Денис', N'Хропост', N'Сергійович', '88888888'),
	(N'Орест', N'Главацький', N'Сергiйович', '99999999'),
	(N'Лев', N'Лашин', N'Олексiйович', '00000000');


INSERT INTO Guarantee(BuyerID, ChequeID, [Start], [End], [Description]) VALUES
	(1, 1,'2024-08-15', '2025-08-15', N'К-сть днів гарантії >>>'),
	(1, 2,'2024-08-08', '2025-08-08', N'К-сть днів гарантії >>>'),
	(2, 3, '2024-09-07', '2025-09-07', N'К-сть днів гарантії >>>'),
	(2, 4, '2024-10-15','2025-10-15', N'К-сть днів гарантії >>>'),
	(3, 5, '2024-06-04', '2025-06-04', N'К-сть днів гарантії >>>'),
	(3, 6, '2024-07-07', '2025-07-07', N'К-сть днів гарантії >>>'),
	(4, 7, '2024-07-09', '2025-07-09', N'К-сть днів гарантії >>>'),
	(4, 8, '2024-07-30', '2025-07-30', N'К-сть днів гарантії >>>'),
	(5, 9, '2024-04-17', '2025-04-17', N'К-сть днів гарантії >>>'),
	(5, 10, '2024-03-14', '2025-03-14', N'К-сть днів гарантії >>>'),
	(6, 11, '2024-03-19', '2025-03-19', N'К-сть днів гарантії >>>'),
	(7, 12, '2024-03-16', '2025-03-16', N'К-сть днів гарантії >>>'),
	(8, 13, '2024-08-09', '2025-08-09', N'К-сть днів гарантії >>>'),
	(9, 14, '2024-10-04', '2025-10-04', N'К-сть днів гарантії >>>'),
	(10, 15, '2024-11-15', '2025-11-15', N'К-сть днів гарантії >>>');