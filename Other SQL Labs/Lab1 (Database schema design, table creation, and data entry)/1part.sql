CREATE DATABASE Education
	ON (NAME = Lab1_data, FILENAME = 'E:\KPI\5 semestr\ТРПЗ\Labs\Lab1\Lab1.1.mdf')
LOG 
	ON (NAME = Lab1_log, FILENAME = 'E:\KPI\5 semestr\ТРПЗ\Labs\Lab1\Lab1.1.mdf.ldf');

EXEC sp_helpdb Education;

/* SELECT
    name AS FileName,
    size * 8 / 1024 AS SizeMB
FROM 
    sys.master_files
WHERE 
    database_id = DB_ID('Education'); */

ALTER DATABASE Education MODIFY NAME = Education_Renamed;