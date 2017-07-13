CREATE OR REPLACE PACKAGE package_variables
IS

  PROCEDURE set(value VARCHAR2);
  
  FUNCTION get RETURN VARCHAR2;

END package_variables;
/