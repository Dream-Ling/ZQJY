--����stuMs���ݿ�
create database stuMs 

--ɾ��stuMs���ݿ�
drop database stuMs

--��stums���ݿ��д���stuInfo��
use stums
create table stuInfo(
 stu_id varchar(20),
 stu_name varchar(20),
 stu_sex bit,
 stu_birth datetime,
 stu_addr varchar(20)
)

--��stums���ݿ���ɾ��stuInfo��
use stums
drop table stuInfo

--��stums���ݿ��в�ѯstuInfo��*�����ڲ���ʹ��
--ʵ�ʿ�������Ҫ�г����� �ֶ�
use stums
select * from stuInfo

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1001','����','1','1990-10-10','����ʡ�ߺ���')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1002','����','0','1992-12-10','����ʡ�Ϸ���')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1003','���','1','1996-8-18','����ʡ������')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1004','����','0','1993-10-17','����ʡ�ߺ���')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1005','����','1','1997-10-13','����ʡ�Ϸ���')

insert into stuInfo
(stu_id,stu_name,stu_sex,stu_birth,stu_addr)
values('1006','Ǯ��','0','1995-10-14','����ʡ�ߺ���')



--�޸ı�������
update stuInfo set stu_addr='����ׯ'
where stu_id='1004'

--ɾ����������
delete stuInfo where stu_id='1006'

use stums
select * from stuInfo

--1.��ѯ����ѧ����Ϣ
--��stums���ݿ��в�ѯstuInfo��*�����ڲ���ʹ��
--ʵ�ʿ�������Ҫ�г����� �ֶ�
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo

--2.��ѯѧ����������ַ,ѧ��
select stu_name,stu_addr,stu_id
from stuInfo

--3.��ѯ������������Ϣ
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_sex='1'

--4.��ѯ����Ů������Ϣ
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_sex<>'1'

--5.��ѯ����û�е�ַ��ѧ��
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr is null

--6.��ѯ�����е�ַ��ѧ��
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr is not null

--7.��ѯ���ԺϷʵ�ѧ����Ϣ
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%�Ϸ�%'

--8.��ѯ���ԺϷʵ�����ѧ����Ϣ
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%�Ϸ�%' and stu_name like '��%'

--9.��ѯ�Ϸʵ������ֵ�ѧ����Ϣ
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo
where stu_addr like '%�Ϸ�%' and len(stu_name)=2

--10.��ѯѧ��ǰ����ѧ����Ϣ
select top 3 stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_id asc

--10.��ѯѧ�ź�����ѧ����Ϣ
select top 3 stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_id desc

--11.�Ȱ����ܷ֣���stu_sexģ�⣩�����ٰ����Ƴɼ�����(��stu_idģ��)
select stu_id,stu_name,stu_sex,stu_birth,stu_addr
from stuInfo order by stu_sex desc,stu_id asc

--12.��ѯѧ����Ϣ ����ʾ���� ����
select stu_id as ѧ��,stu_name ����,stu_sex,stu_birth,stu_addr
from stuInfo

--13.Ϊ��ַǰ���һ������
select stu_id as ѧ��,stu_name ����,stu_sex,stu_birth,'�й�'+stu_addr stu_addr
from stuInfo

--14.��� ���� �� ֻ������ʾ
select stu_id as ѧ��,stu_name ����,stu_sex,stu_birth,'�й�'+stu_addr stu_addr,'����' ����
from stuInfo

--15.�Ա���ʾ ��Ů
select stu_id as ѧ��,stu_name ����,

case
	when stu_sex='1' then '��'
				else      'Ů'	
end
stu_sex,stu_birth,'�й�'+stu_addr stu_addr,'����' ����
from stuInfo

--16.��ѧ������������ ��Ϊ����
select stu_id +'-'+stu_name ����,
case
	when stu_sex='1' then '��'
				else      'Ů'	
end
stu_sex,stu_birth,'�й�'+stu_addr stu_addr,'����' ����
from stuInfo