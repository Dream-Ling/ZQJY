--���ں���
select getdate()

--��ȡ�˰���֮ǰ����Ӧ����
select DATEADD(dd,-8000,GETDATE())

--������������֮���������ֵ
select DATEDIFF(DD,'1995-9-5',GETDATE())

--��֪���ڼ����������20�����Ϣ
use stuMs
select * ,datediff(yy,stu_birth,getdate()) age
from stuInfo
where datediff(yy,stu_birth,getdate())>20

--1999��10��10�� 12��24��  1999-10-10 12:24
select convert(varchar(4),'1999')

select datepart(yy,'1999-10-10 12:24')

select convert(varchar(4),datepart(yy,'1995-3-24 12:24'))+'��'
+convert(varchar(4),datepart(mm,'1995-3-24 12:24'))+'��'
+convert(varchar(4),datepart(dd,'1995-3-24 12:24'))+'��'
+convert(varchar(4),datepart(hh,'1995-3-24 12:24'))+'ʱ'
+convert(varchar(4),datepart(n,'1995-3-24 12:24'))+'��'

--�������ʱ��һ��Ҫע�⣬��ǰ���������ݿ�
create table subInfo(
	sub_id varchar(20) primary key,
	sub_name varchar(20)
)

insert into subInfo(sub_id,sub_name) values('km_01','html')
insert into subInfo(sub_id,sub_name) values('km_02','html')

--�����ɼ���
create table scoreInfo(
	sco_id varchar(20),
	stu_num varchar(20),
	sub_id varchar(20),
	score int
)

select * from stuInfo
select * from subInfo
select * from scoreInfo

--��Ӳ������ݳɼ���
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

--����1.��ѯ�����ĳɼ�
select * from scoreInfo
where stu_num in (select stu_id from stuInfo where stu_sex='1')

--����2.��ѯhtml�ĳɼ�
select score from scoreInfo
where sub_id in(select sub_id from subInfo where sub_name='html')

--����3.��ѯ���Խ��յĳɼ�
select * from scoreInfo
where stu_num in(select stu_id from stuInfo where stu_addr like '����%')

--����4.��ѯ�������ѧ����Ϣ
select * from stuInfo
where stu_id in(select stu_num from scoreInfo where score<60)

--����5.��ѯ �����ѧ����Ϣ
select * from stuInfo
where stu_id in(select stu_num from scoreInfo)
and stu_id not in(select stu_num form scoreInfo where score<60)

--����6.��ѯ2-4������
select top 3 * form stuInfo
where stu_id not in (select top 1 stu_id from stuInfo)
order by stu_id













