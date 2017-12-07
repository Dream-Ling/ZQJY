create database Employee
--���� Employee��
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
values('em_001','��˹��','1990-1-2','1','1965-3-6','emt_01','1200.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_002','���г�','1991-2-3','0','1950-4-5','emt_01','2300.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_003','������','1992-3-4','1','1997-5-4','emt_02','5300.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_004','�滮��','1993-4-5','0','1996-6-3','emt_02','5200.00')
insert into Employee(emp_id,emp_name,emp_birthday,emp_sex,emp_date,emp_type,emp_salary)
values('em_005','���ǲ�','1994-5-6','1','1995-7-2','emt_02','5500.00')

--����Emp_type��
create table Emp_type(
	emp_id varchar(10),
	typ_id varchar(20),
	typ_name varchar(30)
)
drop table Emp_type
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_001','et01','����Ա')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_002','et02','����')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_003','et02','����')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_004','et02','����')
insert into Emp_type(emp_id,typ_id,typ_name)
values('em_005','et03','רҵ����')

drop table  Employee
--����һ
--Ա������ Ա������ ƽ������ ƽ������
select emp_type Ա������,COUNT(*) Ա������,AVG(emp_salary)ƽ������,
		AVG(datediff(yy,emp_birthday,getdate()))ƽ������
from Employee
group by emp_type

--�����
--Ա������ Ա������ 30������Ա������ 30-50��Ա������ 50������Ա������

-----------111-------���ܶ԰����ۺϻ��Ӳ�ѯ�ı��ʽִ�оۺϺ���-----------------------------

select emp_type Ա������,COUNT(*) Ա������,COUNT(*)'30������Ա������',
			COUNT(*)'30-50��Ա������', COUNT(*)'50������Ա������'
from Employee
group by emp_type,emp_id in
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())<30),
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>30
		and datediff(yy,emp_birthday,getdate())<50
	),
	(select emp_id from Employee where datediff(yy,emp_birthday,getdate())>50)


-----------222-------���ܶ԰����ۺϻ��Ӳ�ѯ�ı��ʽִ�оۺϺ���-----------------------------
select

from
(((select emp_type Ա������,COUNT(*) Ա������
from Employee
group by emp_type) e join

(select COUNT(*)'30������Ա������' from Employee
where datediff(yy,emp_birthday,getdate())<30
group by emp_type)ee
on e.emp_type=ee.emp_type))eee join

((select COUNT(*)'30-50��Ա������' from Employee
where datediff(yy,emp_birthday,getdate())>30
		and datediff(yy,emp_birthday,getdate())<50
group by emp_type) a join
(select COUNT(*)'50������Ա������' from Employee
where datediff(yy,emp_birthday,getdate())>50
group by emp_type) aa
on a.emp_type=aa.emp_type))aaa
on eee.emp_type=aaa.emp_type)bbb

-----------333-------���Ӳ�ѯ-----------------------------

select aa.emp_type Ա������,aa.rs Ա������,aa.rsth '30������Ա������',
		bb.ttf '30-50��Ա������',bb.fif '50������Ա������'
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

--������
--�Ա� Ա�������� ������Ա���� �������� רҵ������Ա����
select aa.emp_sex �Ա�,aa.rs Ա��������,
		aa.gly  ������Ա����,bb.gr ��������,bb.js רҵ������Ա����
from
(select a.emp_sex,a.rs,b.gly
from

(select emp_sex,count(*)rs
from Employee
group by emp_sex)a join

(select emp_sex,count(*)gly
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='����Ա')
group by emp_sex)b

on a.emp_sex=b.emp_sex)aa join 

(select c.emp_sex,c.gr,d.js
from

(select emp_sex,count(*)gr
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='����')
group by emp_sex)c join

(select emp_sex,count(*)js
from Employee 
where emp_id in(select emp_id from Emp_type where typ_name='רҵ����')
group by emp_sex)d

on c.emp_sex=d.emp_sex) bb

on aa.emp_sex=bb.emp_sex
