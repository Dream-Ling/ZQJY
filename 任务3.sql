create database Employee
--创建 Employee表
use Employee
create table Employee(
	emp_id varchar(10),
	emp_name varchar(30),
	emp_birthday datetime,
	emp_sex bit,
	emp_date datetime,
	emp_type varchar(20),
	emp_salary decimal(7,2)
)
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_001','阿斯顿','1990-1-2','1','1965-3-6','emt_01','1200.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_002','自行车','1991-2-3','0','1950-4-5','emt_01','2300.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_003','驱蚊器','1992-3-4','1','1997-5-4','emt_02','5300.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_004','规划局','1993-4-5','0','1996-6-3','emt_02','5200.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_005','从是不','1994-5-6','1','1995-7-2','emt_02','5500.00')

--创建Emp_type表
create table Emp_type(
	emp_id varchar(10),
	typ_id varchar(20),
	typ_name varchar(30)
)
drop table Emp_type
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_001','et01','管理员')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_002','et02','工人')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_003','et02','工人')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_004','et02','工人')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_005','et03','专业技术')

drop table  Employee
--报表一
--员工类型 员工人数 平均工资 平均年龄
select emp_type 员工类型,COUNT(*) 员工人数,AVG(emp_salary)平均工资,
		AVG(datediff(yy,emp_birthday,getdate()))平均年龄
from Employee
group by emp_type

--报表二
--员工类型 员工人数 30岁以下员工人数 30-50岁员工人数 50岁以上员工人数

-----------111-------不能对包含聚合或子查询的表达式执行聚合函数-----------------------------

select emp_type 员工类型,COUNT(*) 员工人数,COUNT(*)'30岁以下员工人数',
			COUNT(*)'30-50岁员工人数', COUNT(*)'50岁以上员工人数'
from Employee
group by emp_type,emp_id in
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())<30),
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>30
		and datediff(yy,emp_birthday,getdate())<50
	),
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>50)


-----------222-------不能对包含聚合或子查询的表达式执行聚合函数-----------------------------
select

from
(((select emp_type 员工类型,COUNT(*) 员工人数
from Employee
group by emp_type) e join

(select COUNT(*)'30岁以下员工人数' from Employee
where datediff(yy,emp_birthday,getdate())<30
group by emp_type)ee
on e.emp_type=ee.emp_type))eee join

((select COUNT(*)'30-50岁员工人数' from Employee
where datediff(yy,emp_birthday,getdate())>30
		and datediff(yy,emp_birthday,getdate())<50
group by emp_type) a join
(select COUNT(*)'50岁以上员工人数' from Employee
where datediff(yy,emp_birthday,getdate())>50
group by emp_type) aa
on a.emp_type=aa.emp_type))aaa
on eee.emp_type=aaa.emp_type)bbb

-----------333-------连接查询-----------------------------

select aa.emp_type 员工类型,aa.rs 员工人数,aa.rsth '30岁以下员工人数',
		bb.ttf '30-50岁员工人数',bb.fif '50岁以上员工人数'
from
(select a.emp_type,a.rs,b.rsth
from
(select emp_type,COUNT(*)rs
from Employee
group by emp_type)a join

(select emp_type,COUNT(*)rsth
from Employee where emp_id in 
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())<30)
group by emp_type)b
on a.emp_type=b.emp_type)aa join

(select c.emp_type,c.ttf,d.fif
from
(select emp_type,COUNT(*)ttf
from Employee where emp_id in 
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>30
		and datediff(yy,emp_birthday,getdate())<50)
group by emp_type)c join

(select emp_type,COUNT(*)fif
from Employee where emp_id in 
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>30)
group by emp_type)d
on c.emp_type=d.emp_type)bb
on aa.emp_type = bb.emp_type

--报表三
--性别 员工总数量 管理人员数量 工人数量 专业技术人员数量
select aa.emp_sex 性别,aa.rs 员工总数量,
		aa.gly  管理人员数量,bb.gr 工人数量,bb.js 专业技术人员数量
from
(select a.emp_sex,a.rs,b.gly
from

(select emp_sex,count(*)rs
from Employee
group by emp_sex)a join

(select emp_sex,count(*)gly
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='管理员')
group by emp_sex)b

on a.emp_sex=b.emp_sex)aa join 

(select c.emp_sex,c.gr,d.js
from

(select emp_sex,count(*)gr
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='工人')
group by emp_sex)c join

(select emp_sex,count(*)js
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='专业技术')
group by emp_sex)d

on c.emp_sex=d.emp_sex) bb

on aa.emp_sex=bb.emp_sex
