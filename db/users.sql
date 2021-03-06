CREATE TABLE "USERS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(20), 
	"ENCODED_PWD" VARCHAR2(512), 
	"OPERATION_BY" VARCHAR2(64), 
	"OPERATION_AT" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
;