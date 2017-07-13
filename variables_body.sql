
CREATE OR REPLACE PACKAGE BODY package_variables IS

  variable VARCHAR2(20) := 'Initial Value';
  
  function get RETURN varchar2 IS
  BEGIN
      return variable;
  END get;
  
  PROCEDURE set(value VARCHAR2) IS
  BEGIN
      variable := value;
  END set;

END package_variables;
/