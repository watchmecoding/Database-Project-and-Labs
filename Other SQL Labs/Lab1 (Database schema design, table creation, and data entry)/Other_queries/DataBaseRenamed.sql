ALTER DATABASE Education SET SINGLE_USER WITH ROLLBACK IMMEDIATE; /* forces the immediate termination of any existing connections and rolls back any in-progress transactions. */

ALTER DATABASE Education MODIFY NAME = Education_Renamed;

ALTER DATABASE Education_Renamed SET MULTI_USER;
