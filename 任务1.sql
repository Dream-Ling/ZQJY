--创建studentMS数据库--
use master
create database studentms

--创建学生表student（学号，姓名，年龄，性别，所在系，地址，出生日期）--
use studentms
create table student(
	stu_id varchar(20),
	stu_name varchar(20),
	stu_age int,
	stu_sex bit,
	stu_xi varchar(20),
	stu_addr varchar(20),
	stu_birth datetime	
)
--创建选课表xuanxiu（学号，课程号，成绩）
use studentms
create table xuanxiu(
	stu_id varchar(20),
	class_id varchar(20),
	score varchar(20)
)

--创建课程表class（课程号，课程名称，教师编号）--
use studentms
create table class(
	class_id varchar(20),
	class_name varchar(20),
	teach_id varchar(20)
)

--创建教师表 teacher （教师编号，教师名，教师年级）--
use studentms
create table teacher(
	teach_id varchar(20),
	teach_name varchar(20),
	teach_grade varchar(20),
	teach_birth datetime
)
--1.从teacher表中找出李老师所教的课程号、课程名称。
use studentms
select class_id,class_name 
from class 
where teach_id in(
	select teach_id from teacher where teach_name like '李%')

--2.从teacher表中找出年龄大于28岁的老师的教师号和姓名。
select teach_id,teach_name from teacher
where DATEDIFF(YY,teach_birth,GETDATE())>28

--3.从xuanxiu表中“李小波”所选修的全部课程代号。
select class_id from xuanxiu
where stu_id in(
	select stu_id from student where stu_name='李小波'
)

--4.从xuanxiu表中找出成绩都在80分以上的学生姓名及所在系。
select stu_name,stu_xi from student
where stu_id in(
	select stu_id from xuanxiu where convert(int,score)>80
)

--5.从student表中找出成绩大于100分的前十个学生的信息。
select top 10 * from student
where stu_id in(select stu_id from xuanxiu where score>100 order by score desc)


--6.为student表中的stu_name、stu_id添加列描述‘姓名’、‘学号’
select stu_name 姓名, stu_id 学号 from student

--select * from stuInfo where stu_id in 
--(select stu_id from stuInfo where stu_sex='1')

--7.从student表中找出成绩大于100小于200的所有学生信息。
select * from student
where stu_id in(select stu_id from xuanxiu where score>100 and score<200)

--8.从student表中找出生日为空的所有学生。
select * from student
where stu_birth is null

--9.从student表中找出08E03班中的所有甘肃学生。
select * from student
where stu_xi='08E03' and stu_addr like '%甘肃%'

--10.从student表中找出所有影视动漫班的学生信息。
select * from student
where stu_id in(select stu_id from xuanxiu where
class_id in(select class_id from class where class_name='%影视动漫%')
)

--11.从student表中找出年龄小于等于25所的所有学生。
select * from student
where stu_age='25' and stu_age<'25'
	
--12.把student表中的学生信息按成绩的降序排列。
select * from student
where stu_id in(select stu_id from xuanxiu order by score desc)

