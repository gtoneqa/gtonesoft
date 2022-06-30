CREATE USER DHTESTDB IDENTIFIED BY "dhtestdb"
	DEFAULT TABLESPACE CM_DATA
	TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO DHTESTDB ;
GRANT RESOURCE TO DHTESTDB ;
GRANT CREATE VIEW TO DHTESTDB;
GRANT SELECT ANY DICTIONARY TO DHTESTDB;