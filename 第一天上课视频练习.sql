--创建stuMs数据库
create database stuMs 

--删除stuMs数据库
drop database stuMs

--在stums数据库中创建stuInfo表
use stums
create table stuInfo(
 stu_id varchar(20),
 stu_name varchar(20),
 stu_sex bit,
 stu_birth datetime,
 stu_addr varchar(20)
)

--在stums数据库中删除stuInfo表
use stums
drop table stuInfo

--在stums数据库中查询stuInfo表，*仅用于测试使用
--实际开发中需要列出所有 字段
use stums
select * from stuInfo

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1001','张三','1','1990-10-10','安徽省芜湖市')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1002','李三','0','1992-12-10','安徽省合肥市')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1003','李二','1','1996-8-18','安徽省六安市')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1004','赵三','0','1993-10-17','安徽省芜湖市')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1005','陶三','1','1997-10-13','安徽省合肥市')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1006','钱三','0','1995-10-14','安徽省芜湖市')



--修改表中数据
update stuInfo set stu_addr='高老庄'
where stu_id='1004'

--删除表中数据
delete stuInfo where stu_id='1006'

use stums
select * from stuInfo

--1.查询所有学生信息
--在stums数据库中查询stuInfo表，*仅用于测试使用
--实际开发中需要列出所有 字段
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo

--2.查询学生姓名，地址,学号
select stu_name,stu_addr,stu_id
from stuInfo

--3.查询所有男生的信息
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_sex='1'

--4.查询所有女生的信息
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_sex<>'1'

--5.查询所有没有地址的学生
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr is null

--6.查询所有有地址的学生
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr is not null

--7.查询来自合肥的学生信息
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%合肥%'

--8.查询来自合肥的张姓学生信息
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%合肥%' and stu_name like '李%'

--9.查询合肥的两个字的学生信息
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%合肥%' and len(stu_name)=2

--10.查询学号前三个学生信息
select top 3 stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_id asc

--10.查询学号后三个学生信息
select top 3 stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_id desc

--11.先按照总分（以stu_sex模拟）降序，再按单科成绩升序(以stu_id模拟)
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_sex desc,stu_id asc

--12.查询学生信息 并显示中文 列名
select stu_id as 学号,stu_name 姓名,stu_sex,stu_birth,stu_addr
from stuInfo

--13.为地址前面加一个国家
select stu_id as 学号,stu_name 姓名,stu_sex,stu_birth,'中国'+stu_addr stu_addr
from stuInfo

--14.添加 民族 列 只用于显示
select stu_id as 学号,stu_name 姓名,stu_sex,stu_birth,'中国'+stu_addr stu_addr,'汉族' 民族
from stuInfo

--15.性别显示 男女
select stu_id as 学号,stu_name 姓名,

case
	when stu_sex='1' then '男'
				else      '女'	
end
stu_sex,stu_birth,'中国'+stu_addr stu_addr,'汉族' 民族
from stuInfo

--16.将学号与姓名链接 作为工号
select stu_id +'-'+stu_name 工号,
case
	when stu_sex='1' then '男'
				else      '女'	
end
stu_sex,stu_birth,'中国'+stu_addr stu_addr,'汉族' 民族
from stuInfo