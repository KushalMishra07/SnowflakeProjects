
INSERT into TEST_DB1.EMPLOYEE.EMPLOYEEDETAILS values (1,'Kushal','Mishra');

Select * from EMPLOYEEDETAILS;

Select * from TEST_DB1.EMPLOYEE.EMPLOYEEDETAILS;

Show databases
Use DATABASE TEST_DB1;
Show schemas

SELECT current_role(),CURRENT_DATABASE(),current_schema();
Show tables in schema employee;
Desc table TEST_DB1.EMPLOYEE.EMPLOYEEDETAILS;

TEST_DB1.EMPLOYEE.MYSTG

TEST_DB1.EMPLOYEE.MYSTG;

CREATE or replace file format myformat type = 'csv' field_delimiter = ',';
Select t.$1,	t.$2,	t.$3,	t.$4,	t.$5,	t.$6,	t.$7,	t.$8,	t.$9,	t.$10,	t.$11,	t.$12,	t.$13,	t.$14,	t.$15,	t.$16,	t.$17,	t.$18,	t.$19,	t.$20,	t.$21,	t.$22,	t.$23,	t.$24,	t.$25,	t.$26,	t.$27,	t.$28,	t.$29,	t.$30,	t.$31,	t.$32,	t.$33,	t.$34,	t.$35,	t.$36,	t.$37,	t.$38,	t.$39,	t.$40,	t.$41,	t.$42,	t.$43,	t.$44,	t.$45,	t.$46,	t.$47,	t.$48,	t.$49,	t.$50,	t.$51,	t.$52,	t.$53,	t.$54,	t.$55,	t.$56,	t.$57,	t.$58,	t.$59,	t.$60,	t.$61,	t.$62,	t.$63,	t.$64,	t.$65,	t.$66,	t.$67,	t.$68,	t.$69,	t.$70,	t.$71,	t.$72,	t.$73,	t.$74,	t.$75,	t.$76,	t.$77,	t.$78,	t.$79,	t.$80,	t.$81

from @MYSTG(file_format => 'myformat') t;


Create table mystgtable (
t1    varchar,
t2    varchar,
t3    varchar,
t4    varchar,
t5    varchar,
t6    varchar,
t7    varchar,
t8    varchar,
t9    varchar,
t10    varchar,
t11    varchar,
t12    varchar,
t13    varchar,
t14    varchar,
t15    varchar,
t16    varchar,
t17    varchar,
t18    varchar,
t19    varchar,
t20    varchar,
t21    varchar,
t22    varchar,
t23    varchar,
t24    varchar,
t25    varchar,
t26    varchar,
t27    varchar,
t28    varchar,
t29    varchar,
t30    varchar,
t31    varchar,
t32    varchar,
t33    varchar,
t34    varchar,
t35    varchar,
t36    varchar,
t37    varchar,
t38    varchar,
t39    varchar,
t40    varchar,
t41    varchar,
t42    varchar,
t43    varchar,
t44    varchar,
t45    varchar,
t46    varchar,
t47    varchar,
t48    varchar,
t49    varchar,
t50    varchar,
t51    varchar,
t52    varchar,
t53    varchar,
t54    varchar,
t55    varchar,
t56    varchar,
t57    varchar,
t58    varchar,
t59    varchar,
t60    varchar,
t61    varchar,
t62    varchar,
t63    varchar,
t64    varchar,
t65    varchar,
t66    varchar,
t67    varchar,
t68    varchar,
t69    varchar,
t70    varchar,
t71    varchar,
t72    varchar,
t73    varchar,
t74    varchar,
t75    varchar,
t76    varchar,
t77    varchar,
t78    varchar,
t79    varchar,
t80    varchar,
t81    varchar


)
copy into mystgtable from @mystg;

Select * from mystgtable;

Create or replace Task my_task
warehouse = compute_wh
as 
select current_date();

list @~;

Select * from EMPLOYEEDETAILS;
ALTER table EMPLOYEEDETAILS SET VERSIONING = ON;
ALTER TABLE EMPLOYEEDETAILS ADD mytimestampcol TIMESTAMP DEFAULT CURRENT_TIMESTAMP();

create or replace table Emp (ID int, t timestamp default current_timestamp());

Insert into Emp (ID) values (3);

Select * from Emp BEFORE( STATEMENT => '01b10cba-3200-f72d-0007-34020001962a' )
UnDrop table Emp;

SELECT * from EMP;

delete from emp where id = 3;
CREATE table empclone clone emp;
Select * from 'TEST_DB1'.'EMPLOYEE'.'TABLES'
SELECT * from "SNOWFLAKE"."ACCOUNT_USAGE"."TABLE_STORAGE_METRICS" WHERE UPPER(TABLE_NAME) LIKE '%EMP%'
SELECT * FROM EMPCLONE;

CREATE SEQUENCE S1
START 2
INCREMENT 2
COMMENT = "BOL"

CREATE TABLE EMPSEQ (
ID NUMBER DEFAULT S1.nextval,
ordername varchar
)

insert into EMPSEQ(ordername) values(
'MAY'


)

//Testing Snowflake Clone feature

Select * from EMPSEQ;

Select * from EMPSEQCLONE;

CREATE table EMPSEQCLONE clone EMPSEQ;

Select * from EMPSEQCLONE;
//Creating Table Simple_Order 
CREATE or REPLACE table simple_order (
orderkey number(38,0),
custkey number(38,0),
orderstatus varchar(1),
totalprice number(12,2),
orderdate date,
orderpriority varchar(15)
);

Desc Table Test_DB1.Employee.simple_order;
Desc Table Test_DB1.Employee.MYSTGTABLE;
Select * from Test_DB1.Employee.MYSTGTABLE;;


insert into simple_order(orderkey,custkey,orderstatus,totalprice,orderdate,orderpriority) 
Select T2,T2,T42,CONCAT(T38,T39) as T3839, current_date as date,T52
from Test_DB1.Employee.MYSTGTABLE where T2 not like '%MSSubClass%';
;

Select * from simple_order;
//To Check the time travel feature in cloned table 
Delete from simple_order where orderkey = 60 and TOTALPRICE = 150856.00;
//Query ID = 01b11631-3200-f770-0007-34020001b0d6

CREATE table simple_order_clone clone simple_order;

Select count(*) from simple_order;
select count(*) from simple_order_clone;

//Information Schema consist details about the table creation deletioon like Stream data 
Select * from "TEST_DB1"."INFORMATION_SCHEMA"."TABLES" where TABLE_NAME like '%SIMPLE_ORDER%';

use role accountadmin;

Select * from "SNOWFLAKE"."ACCOUNT_USAGE"."TABLE_STORAGE_METRICS"
where upper(TABLE_NAME) like '%SIMPLE_ORDER%'
; -----Check it's not correct maybe ?


insert into simple_order(orderkey,custkey,orderstatus,totalprice,orderdate,orderpriority) 
Select T2,T2,T42,CONCAT(T38,T39) as T3839, current_date as date,T52
from Test_DB1.Employee.MYSTGTABLE where T2 not like '%MSSubClass%';
;

Select count(*) from simple_order;

select * from simple_order_clone;

UPDATE simple_order_clone set orderkey = 40 where orderkey = 20 and custkey = 20 and Totalprice = 2841262.00;

Select * from simple_order_clone where orderkey = 40 and custkey = 20 and Totalprice = 2841262.00;

select count(*) from simple_order
union
select count(*) from simple_order_clone;

//Any Clone table after getting change will get it's own partition and storage. Active bytes would also change. 

CREATE or replace transient table simple_ordertr(
id number(38,0),
name varchar()
)

insert into simple_ordertr values(
2,'Mishra'

)

select * from simple_ordertr;

CREATE table simple_ordertr_clone clone simple_ordertr;

//If you run the following query you will get the following output:
//002120 (0A000): SQL compilation error: Transient object cannot be cloned to a permanent object.
//You can't clone a transient table into a permanent table
//only the following cloning is possible - 
// Permanent --> Permanent
//Transient --> Transient
//Temporary --> Temporary
// Transient --> Temporary 
//Transient --> permanent 
//Temporary --> permanent


CREATE or replace transient table simple_ordertr_clone clone simple_ordertr;
CREATE or replace temporary table simple_ordertr_clone clone simple_ordertr;
CREATE or replace Transient table simple_ordertrans clone simple_order;
CREATE or replace Temporary table simple_ordertrans clone simple_order;

create or Replace SEQUENCE Seqeven
start 2
increment 2
comment = 'Creating an even sequence';

Create or Replace table sequencetesting (

id number(38) default seqeven.nextval,
nextvl varchar 
)

insert into sequencetesting (nextvl) values (
'Test3'
)

select * from sequencetesting;

CREATE or REPLACE table sequencetesting_clone clone sequencetesting;

Select * from sequencetesting_clone;

Select get_ddl('table','sequencetesting_clone');

create or replace TABLE SEQUENCETESTING_CLONE 
( ID NUMBER(38,0) DEFAULT TEST_DB1.EMPLOYEE.SEQEVEN.NEXTVAL, 
NEXTVL VARCHAR(16777216) );

Insert into SEQUENCETESTING_CLONE (nextvl) values (
'Test6'

)

Select * from SEQUENCETESTING_CLONE;

Select * from SEQUENCETESTING;

-- //Testing the stag table for checking clone on stag

-- LIST @MYSTG;

-- Create file format csv_ff
--     type = 'csv'
--     compression = 'auto'
--     field_delimiter = ','
--     record_delimiter = '\n'
--     skip_header = 0
--     field_optionally_enclosed_by = '\042'
--     trim_space = false
--     error_on_column_count_mismatch = true
--     escape = 'none'
--     escape_unenclosed_field = '\134'
--     date_format = 'auto'
--     timestamp_format = 'auto' null_if = ('\\n')

-- Create or Replace  Table customer (
-- ID varchar AS (value:c1::varchar),
-- MSSubclass varchar AS (value:c1::varchar),
-- MSZoning varchar AS (value:c1::varchar),
-- LotFrontage varchar AS (value:c1::varchar),
-- Street varchar AS (value:c1::varchar),
-- Alley varchar AS (value:c2::varchar),
-- LotShape varchar AS (value:c3::varchar),
-- LandContour varchar AS (value:c4::varchar),
-- Utilities varchar AS (value:c5::varchar),
-- LotConfig varchar AS (value:c6::varchar),
-- LandSlope varchar AS (value:c7::varchar),
-- Neighborhood varchar AS (value:c8::varchar),
-- Condition1 varchar AS (value:c9::varchar),
-- Condition2 varchar AS (value:c10::varchar),
-- BldgType varchar AS (value:c11::varchar),
-- OverallQual varchar AS (value:c12::varchar),
-- OverallCond varchar AS (value:c13::varchar),
-- YearBuilt varchar AS (value:c14::varchar)
-- )
-- with location = @MYSTG
-- file_format = (format_name = csv_ff)

-- select * from MYSTGTABLE

Create or replace stage MYSTG2 clone MYSTG;
//000002 (0A000): Unsupported feature 'Cloning internal and temporary stages'.

Show File Formats;

Desc file format MYFORMAT;
Create or replace file format csv_ff_clone clone csv_ff;
//File format CSV_FF_CLONE successfully created.

//Creating a file format clone is allowed

Show SEQUENCES;

CREATE or REPLACE SEQUENCE SEQEVEN_CLONE clone SEQEVEN;
Alter sequence seqeven_clone set increment = 3;

select SEQEVEN.nextval,SEQEVEN_CLONE.nextval;

//While cloning the sequence, when you alter the Sequence, Next val will only change after the second runtime. Because in any
//sequence nextval is already stored for next iteration. change will only take place in next to next iteration. 
//Sequence object already hold the next value
Create or REPLACE DATABASE TEST_DB2 clone TEST_DB1

CREATE or REPLACE SCHEMA EMPLOYEE2 clone Employee;

select * from Employee.EMPLOYEEDETAILS;
create or replace stream stream1 on table employeedetails;
INSERT into employeedetails values(3,'Romit','Singh')
Delete from employeedetails where employeeid = 2;



Select * from stream1;
Select * from streamview;
CREATE or replace view streamview as 

Select * from stream1;

select * from stream1;

SELECT * from emp;
CREATE or replace view emp as 
Select * from emp;

//Creating a Stream

Select * from SIMPLE_ORDER;
CREATE or Replace stream Simple_order on table SIMPLE_ORDER;
//Error Object 'SIMPLE_ORDER' already exists as TABLE
CREATE or Replace stream Simple_order_Stream on table SIMPLE_ORDER;
select * from  Simple_order_Stream;

//20	20	Y	2841262.00	2023-12-18	3
INSERT into simple_order  
Select * from simple_order where orderkey = 70 and totalprice = 540756.00;


select * from  Simple_order_Stream;

Delete from simple_order where orderkey = 70 and totalprice = 540756.00;

select * from  Simple_order_Stream 540756.00;

//Storing Customer stream data
Create or REPLACE table CDC_CHANGES as Select * from Simple_order_Stream;
Select current_database(),current_schema();

Show Streams;


desc stream Simple_order_Stream;

Select get_ddl('stream','Simple_order_Stream');

//We can alter the stream object as well

//For example:

alter stream Simple_order_stream set comment = 'This is my new comment';

desc stream Simple_order_Stream;

Create or Replace stream append_only_stream on table simple_order
append_only = True;
