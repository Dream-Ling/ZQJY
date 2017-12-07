--创建专业表
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
	stu_place varchar(20),		--籍贯
	stu_class varchar(20),
	stu_remark varchar(20),		--备注
	spec_id varchar(20),		--专业
	stu_age varchar(20)	 
)

--创建课程表class（课程号，课程名称，教师编号）--
use studentms
create table class(
	class_id varchar(20),
	class_name varchar(20)
)

--创建选课表xuanke（学号，课程号，成绩）
create table xuanke(
	stu_id varchar(20),
	class_id varchar(20),

)


use studentms

--a)查询第3到第8条学生信息
select top 3 * from stuInfo 
where stu_id  not in(select top 2 * from stuInfo)

--b)查询所有学生及所属专业（注：有尚未分配专业的学生）
select stu.stu_id,spe.spe_id
from stuInfo stu right join specialty spe
on stu.spec.id=spe.spec.id

--c)查询各专业学生数量（注：有未招生专业）
SELECT spec_id,COUNT(*) rs from stuInfo
group by stu_id

--d)查询学生数超过3人的专业
SELECT spec_id,COUNT(*) rs from stuInfo
group by stu_id
having COUNT(*)>3

--e)查询所有学生的选课信息
select stu_id,class_id from xuanke

--f)查询选择了高等数学的学生
select stu_id from xuanke
where class_id in(select class_id from class where class_name='高等数学')

--g)查询学生高明选择的课程
select class_id from xuanke
where stu_id in (select stu_id from stuInfo where stu_name='高明')

--h)查询选择了三门课以上的学生 
select stu_id ,COUNT(*)rs from xuanke
group by stu_id
having COUNT(*)>3
--i)查询选择了大学语文而没有选择线性代数的学生
select stu_id from stuInfo
where stu_id in(select stu_id from xuanke where class_id in(select class_id from class where class_name='大学语文'))
	and	stu_id not in(select stu_id from xuanke where class_id in(select class_id from class where class_name='线性代数'))

--j)查询班级名称（要求每个班级显示一次，不重复显示）
select distinct(banji_name) 班级名称 from banji

create table banji(
	banji_name varchar(20),
	banji_id varchar(20)
)

--编写一条sql语句将学生表的班名替换为班级编号


