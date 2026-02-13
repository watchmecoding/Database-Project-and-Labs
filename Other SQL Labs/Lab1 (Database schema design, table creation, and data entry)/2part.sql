Create database Musical_Store

--	ON (NAME = Lab1_data, FILENAME = 'E:\KPI\5 semestr\ТРПЗ\Labs\Lab1\Lab1.2.mdf')
--LOG 
--	ON (NAME = Lab1_log, FILENAME = 'E:\KPI\5 semestr\ТРПЗ\Labs\Lab1\Lab1.2.mdf.ldf');

--EXEC sp_helpdb Musical_Store;

ALTER DATABASE Musical_Store MODIFY NAME = Music_Store;

