--����stuMsData���ݿ�
create database stuMsData
use stuMsData

--����stuInfo�������ֶ�stu_id(������ʶ���Զ�����),stu_name,stu_sex(bit),stu_age(int)
create table stuInfo(
	stu_id varchar(10),
	stu_name varchar(10),
	stu_sex bit,
	stu_age int
)
drop table stuInfo
--1.����subInfo�������ֶ�sub_id,sub;
create table subInfo(
	sub_id varchar(10),
	sub varchar(10)
)
--����scoreInfo��
--�����ֶ�sco_id(������ʶ��),sco,stu_id�������,sub_id(���)
create table scoreInfo(
	sco_id varchar(20),
	sco int,
	stu_id varchar(10),
	sub_id varchar(10)
)

--2.����5�����Ҳ�������

insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1001','��˹��','0','21')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1002','Ѫ����','1','22')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1003','�ü���','0','19')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1004','ɱɱɱ','1','18')
insert into stuInfo(stu_id,stu_name,stu_sex,stu_age)
values('1005','������','0','23')
 
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

--3.���ҳ�������ͬѧ����Ϣ
select * from stuInfo
where stu_sex='1'

--4.���ҳ�������ͬѧ�ĳɼ�
select * from scoreInfo
where stu_id in (select stu_id from stuInfo where stu_sex='1')

--5.���������20�����ϵ������ĳɼ�
select * from scoreInfo
where stu_id in (select stu_id from stuInfo where stu_sex='1' and 
stu_age>20
)

--6.�鴦�༶���ܳɼ���ƽ���ɼ�
select SUM(sco)�ܳɼ�,AVG(sco)ƽ���ɼ� from scoreInfo

--7.�������Ŀ��ƽ����
select sub_id ��Ŀ,AVG(sco)ƽ���� from scoreInfo
group by sub_id

select * from scoreInfo

--8.���δ���Ե�ѧ������Ϣ
select * from subInfo
where stu_id in (select stu_id from scoreInfo where sco is null)

--9.���������ѧ����Ϣ(ͬһ��ѧ����ͬһ�ſγɼ�������������)
select 
