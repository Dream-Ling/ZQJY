--����studentMS���ݿ�--
use master
create database studentms

--����ѧ����student��ѧ�ţ����������䣬�Ա�����ϵ����ַ���������ڣ�--
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
--����ѡ�α�xuanxiu��ѧ�ţ��γ̺ţ��ɼ���
use studentms
create table xuanxiu(
	stu_id varchar(20),
	class_id varchar(20),
	score varchar(20)
)

--�����γ̱�class���γ̺ţ��γ����ƣ���ʦ��ţ�--
use studentms
create table class(
	class_id varchar(20),
	class_name varchar(20),
	teach_id varchar(20)
)

--������ʦ�� teacher ����ʦ��ţ���ʦ������ʦ�꼶��--
use studentms
create table teacher(
	teach_id varchar(20),
	teach_name varchar(20),
	teach_grade varchar(20),
	teach_birth datetime
)
--1.��teacher�����ҳ�����ʦ���̵Ŀγ̺š��γ����ơ�
use studentms
select class_id,class_name 
from class 
where teach_id in(
	select teach_id from teacher where teach_name like '��%')

--2.��teacher�����ҳ��������28�����ʦ�Ľ�ʦ�ź�������
select teach_id,teach_name from teacher
where DATEDIFF(YY,teach_birth,GETDATE())>28

--3.��xuanxiu���С���С������ѡ�޵�ȫ���γ̴��š�
select class_id from xuanxiu
where stu_id in(
	select stu_id from student where stu_name='��С��'
)

--4.��xuanxiu�����ҳ��ɼ�����80�����ϵ�ѧ������������ϵ��
select stu_name,stu_xi from student
where stu_id in(
	select stu_id from xuanxiu where convert(int,score)>80
)

--5.��student�����ҳ��ɼ�����100�ֵ�ǰʮ��ѧ������Ϣ��
select top 10 * from student
where stu_id in(select stu_id from xuanxiu where score>100 order by score desc)


--6.Ϊstudent���е�stu_name��stu_id���������������������ѧ�š�
select stu_name ����, stu_id ѧ�� from student

--select * from stuInfo where stu_id in 
--(select stu_id from stuInfo where stu_sex='1')

--7.��student�����ҳ��ɼ�����100С��200������ѧ����Ϣ��
select * from student
where stu_id in(select stu_id from xuanxiu where score>100 and score<200)

--8.��student�����ҳ�����Ϊ�յ�����ѧ����
select * from student
where stu_birth is null

--9.��student�����ҳ�08E03���е����и���ѧ����
select * from student
where stu_xi='08E03' and stu_addr like '%����%'

--10.��student�����ҳ�����Ӱ�Ӷ������ѧ����Ϣ��
select * from student
where stu_id in(select stu_id from xuanxiu where
class_id in(select class_id from class where class_name='%Ӱ�Ӷ���%')
)

--11.��student�����ҳ�����С�ڵ���25��������ѧ����
select * from student
where stu_age='25' and stu_age<'25'
	
--12.��student���е�ѧ����Ϣ���ɼ��Ľ������С�
select * from student
where stu_id in(select stu_id from xuanxiu order by score desc)

