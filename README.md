# sqlworkshop
Sql Workshop

Oracle Data Pump Tutorial

https://oracle-base.com/articles/10g/oracle-data-pump-10g

-- run in sql developer as sys admin.

CREATE OR REPLACE DIRECTORY test_dir AS 'c:/app/datapump/';
GRANT READ, WRITE ON DIRECTORY test_dir TO hr;


-- run from command prompt or terminal window

expdp hr/hr@localhost schemas=hr directory=TEST_DIR dumpfile=hr2.dmp logfile=expdpHR.log
