create database kalyan;

use kalyan;

set hive.cli.print.current.db=true;
set hiive.cli.print.header=true;


CREATE TABLE IF NOT EXISTS student
( name string, id int , course string, year int ) STORED AS PARQUET
location '/task1';

select * from student;


CREATE TABLE IF NOT EXISTS kalyan.student_parquet
( name string, id int , course string, year int )
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS 
INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat';

INSERT OVERWRITE TABLE kalyan.student_parquet SELECT * from student;

select * from kalyan.student_parquet;
 
create table if not exists kalyan.student_parquet_op as select * from kalyan.student_parquet where id>2 and course='spark';
 
select * from kalyan.student_parquet_op;
