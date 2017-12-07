--创建stuMsData数据库
create database stuMsData
use stuMsData

--创建stuInfo表，包含字段stu_id(主键标识列自动增长),stu_name,stu_sex(bit),stu_age(int)
create table stuInfo(
	stu_id varchar(10),
	stu_name varchar(10),
	stu_sex bit,
	stu_age int
)
drop table stuInfo
--1.创建subInfo表，包含字段sub_id,sub;
create table subInfo(
	sub_id varchar(10),
	sub varchar(10)
)
--创建scoreInfo，
--包含字段sco_id(主键标识列),sco,stu_id（外键）,sub_id(外键)
create table scoreInfo(
	sco_id varchar(20),
	sco int,
	stu_id varchar(10),
	sub_id varchar(10)
)

--2.加入5条左右测试数据

insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1001','阿斯顿','0','21')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1002','血常规','1','22')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1003','好几个','0','19')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1004','杀杀杀','1','18')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1005','急急急','0','23')
 
 select * from stuInfo
 
 insert into subInfo(sub_id,sub)
values('km_01','html')
 insert into subInfo(sub_id,sub)
values('km_02','sql')
 insert into subInfo(sub_id,sub)
values('km_03','java')
 insert into subInfo(sub_id,sub)
values('km_04','php')
 insert into subInfo(sub_id,sub)
values('km_05','python')

 select * from subInfo
 
  insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_001','66','1001','km_01')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_002','67','1001','km_02')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_003','68','1001','km_03')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_004','69','1002','km_01')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_005','70','1002','km_02')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_006','71','1002','km_03')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_007','72','1003','km_01')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_008','73','1003','km_02')
 insert into scoreInfo(sco_id,sco,stu_id,sub_id)
values('cj_009','74','1003','km_03')
 
 select * from scoreInfo

--3.查找出所有男同学的信息
select * from stuInfo
where stu_sex='1'

--4.查找出所有男同学的成绩
select * from scoreInfo
where stu_id in (select stu_id from stuInfo where stu_sex='1')

--5.查出年龄在20岁以上的男生的成绩
select * from scoreInfo
where stu_id in (select stu_id from stuInfo where stu_sex='1' and 
stu_age>20
)

--6.查处班级的总成绩、平均成绩
select SUM(sco)总成绩,AVG(sco)平均成绩 from scoreInfo

--7.查出各科目的平均分
select sub_id 科目,AVG(sco)平均分 from scoreInfo
group by sub_id

select * from scoreInfo

--8.查出未考试的学生的信息
select * from subInfo
where stu_id in (select stu_id from scoreInfo where sco is null)

--9.查出补考的学生信息(同一个学生，同一门课成绩出现两个以上)
select 
