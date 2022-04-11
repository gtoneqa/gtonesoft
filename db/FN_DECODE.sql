CREATE OR REPLACE FUNCTION FN_DECODE(
ENCPASSWORD 	IN USERS.ENCODED_PWD%TYPE )
RETURN VARCHAR2
AS
VPASSWORD	USERS.ENCODED_PWD%TYPE;
VENCPASSWORD USERS.ENCODED_PWD%TYPE := ENCPASSWORD;
BEGIN
	SELECT SUBSTR(VENCPASSWORD, 5, LENGTH(VENCPASSWORD)-8) INTO VPASSWORD
	FROM DUAL;
	RETURN VPASSWORD;
END;
/
