--����רҵ��
create table specialty(	
	spec_id varchar(20),
	spec_name varchar(20)
)
create table stuInfo(
	stu_id varchar(20),
	stu_name varchar(20),
	stu_sex bit,
	stu_birth varchar(20),
	stu_score varchar(20),
	stu_place varchar(20),		--����
	stu_class varchar(20),
	stu_remark varchar(20),		--��ע
	spec_id varchar(20),		--רҵ
	stu_age varchar(20)	 
)

--�����γ̱�class���γ̺ţ��γ����ƣ���ʦ��ţ�--
use studentms
create table class(
	class_id varchar(20),
	class_name varchar(20)
)

--����ѡ�α�xuanke��ѧ�ţ��γ̺ţ��ɼ���
create table xuanke(
	stu_id varchar(20),
	class_id varchar(20),

)


use studentms

--a)��ѯ��3����8��ѧ����Ϣ
select top 3 * from stuInfo 
where stu_id  not in(select top 2 * from stuInfo)

--b)��ѯ����ѧ��������רҵ��ע������δ����רҵ��ѧ����
select stu.stu_id,spe.spe_id
from stuInfo stu right join specialty spe
on stu.spec.id=spe.spec.id

--c)��ѯ��רҵѧ��������ע����δ����רҵ��
SELECT spec_id,COUNT(*) rs from stuInfo
group by stu_id

--d)��ѯѧ��������3�˵�רҵ
SELECT spec_id,COUNT(*) rs from stuInfo
group by stu_id
having COUNT(*)>3

--e)��ѯ����ѧ����ѡ����Ϣ
select stu_id,class_id from xuanke

--f)��ѯѡ���˸ߵ���ѧ��ѧ��
select stu_id from xuanke
where class_id in(select class_id from class where class_name='�ߵ���ѧ')

--g)��ѯѧ������ѡ��Ŀγ�
select class_id from xuanke
where stu_id in (select stu_id from stuInfo where stu_name='����')

--h)��ѯѡ�������ſ����ϵ�ѧ�� 
select stu_id ,COUNT(*)rs from xuanke
group by stu_id
having COUNT(*)>3
--i)��ѯѡ���˴�ѧ���Ķ�û��ѡ�����Դ�����ѧ��
select stu_id from stuInfo
where stu_id in(select stu_id from xuanke where class_id in(select class_id from class where class_name='��ѧ����'))
	and	stu_id not in(select stu_id from xuanke where class_id in(select class_id from class where class_name='���Դ���'))

--j)��ѯ�༶���ƣ�Ҫ��ÿ���༶��ʾһ�Σ����ظ���ʾ��
select distinct(banji_name) �༶���� from banji

create table banji(
	banji_name varchar(20),
	banji_id varchar(20)
)

--��дһ��sql��佫ѧ����İ����滻Ϊ�༶���


