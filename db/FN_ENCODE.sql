CREATE OR REPLACE FUNCTION FN_ENCODE(
PASSWORD 	IN USERS.ENCODED_PWD%TYPE )
RETURN VARCHAR2
AS
VPASSWORD	USERS.ENCODED_PWD%TYPE := PASSWORD;
VENCPASSWORD USERS.ENCODED_PWD%TYPE;
BEGIN
	SELECT '0000'||VPASSWORD||'0000' INTO VENCPASSWORD
	FROM DUAL;
	RETURN VENCPASSWORD;
END;
/
