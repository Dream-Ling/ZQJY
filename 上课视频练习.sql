--日期函数
select getdate()

--获取八百天之前所对应日期
select DATEADD(dd,-8000,GETDATE())

--计算两个日期之间的天数差值
select DATEDIFF(DD,'1995-9-5',GETDATE())

--已知日期计算年龄大于20岁的信息
use stuMs
select * ,datediff(yy,stu_birth,getdate()) age
from stuInfo
where datediff(yy,stu_birth,getdate())>20

--1999年10月10日 12点24分  1999-10-10 12:24
select convert(varchar(4),'1999')

select datepart(yy,'1999-10-10 12:24')

select convert(varchar(4),datepart(yy,'1995-3-24 12:24'))+'年'
+convert(varchar(4),datepart(mm,'1995-3-24 12:24'))+'月'
+convert(varchar(4),datepart(dd,'1995-3-24 12:24'))+'日'
+convert(varchar(4),datepart(hh,'1995-3-24 12:24'))+'时'
+convert(varchar(4),datepart(n,'1995-3-24 12:24'))+'分'

--创建表的时候，一定要注意，当前操作的数据库
create table subInfo(
	sub_id varchar(20) primary key,
	sub_name varchar(20)
)

insert into subInfo(sub_id,sub_name) values('km_01','html')
insert into subInfo(sub_id,sub_name) values('km_02','html')

--创建成绩表
create table scoreInfo(
	sco_id varchar(20),
	stu_num varchar(20),
	sub_id varchar(20),
	score int
)

select * from stuInfo
select * from subInfo
select * from scoreInfo

--添加测试数据成绩表
insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0001','111','km_01','59')

insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0002','111','km_01','99')

insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0003','111','km_02','79')
insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0004','112','km_01','89')
insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0005','112','km_02','79')
insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0006','113','km_01','99')
insert into scoreInfo
(sco_id,stu_num,sub_id,score)values
('sco_0007','113','km_02','89')

--问题1.查询男生的成绩
select * from scoreInfo
where stu_num in (select stu_id from stuInfo where stu_sex='1')

--问题2.查询html的成绩
select score from scoreInfo
where sub_id in(select sub_id from subInfo where sub_name='html')

--问题3.查询来自江苏的成绩
select * from scoreInfo
where stu_num in(select stu_id from stuInfo where stu_addr like '江苏%')

--问题4.查询不及格的学生信息
select * from stuInfo
where stu_id in(select stu_num from scoreInfo where score<60)

--问题5.查询 及格的学生信息
select * from stuInfo
where stu_id in(select stu_num from scoreInfo)
and stu_id not in(select stu_num form scoreInfo where score<60)

--问题6.查询2-4条数据
select top 3 * form stuInfo
where stu_id not in (select top 1 stu_id from stuInfo)
order by stu_id













