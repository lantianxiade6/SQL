-- CREATE DATABASE 数据库名
CREATE DATABASE test_STInfo

-- 学生信息表(学生编号#、名称、年龄、性别、生日)
CREATE TABLE T_student(
stuID VARCHAR(15) PRIMARY KEY,
stuName VARCHAR(10) NOT NULL,
age INT(2) NOT NULL,
sex CHAR(2) NOT NULL,
birth DATETIME(6) NOT NULL
);
-- 课程信息表(课程编号#、名称、学分、学时、老师)
CREATE TABLE T_curriculum(
curID VARCHAR(15) PRIMARY KEY,
curName VARCHAR(10) NOT NULL,
credit INT(2) NOT NULL,
learntime INT(2) NOT NULL,
teachername VARCHAR(10) NOT NULL,
CHECK(credit BETWEEN 3 AND 8)
);
-- 成绩信息表(学生编号#、课程编号、成绩)
CREATE TABLE T_result(
stuID VARCHAR(15),
curID VARCHAR(15),
result DOUBLE,
FOREIGN KEY(stuID) REFERENCES T_student(stuID) ON DELETE CASCADE,
PRIMARY KEY(stuID, curID)
);
-- 教师信息表(教师编号#、名称、年龄、性别、院系编号#、院系、职称、工资、津贴)
CREATE TABLE T_teacher(
teaID VARCHAR(15) PRIMARY KEY,
teaName VARCHAR(10) NOT NULL,
age INT(2) NOT NULL,
sex CHAR(2) NOT NULL,
deptID VARCHAR(15) NOT NULL,
dept VARCHAR(20) NOT NULL,
profession VARCHAR(10),
salary INT(5) NOT NULL,
pension DOUBLE
);
-- 院系信息表(院系编号#、名称)
CREATE TABLE T_dept(
deptID VARCHAR(15) PRIMARY KEY,
deptName VARCHAR(10) NOT NULL
);
-- 计算机系教授信息表
CREATE TABLE T_CSteacher(
teaID VARCHAR(15) PRIMARY KEY,
teaName VARCHAR(10) NOT NULL,
age INT NOT NULL,
sex CHAR(2) NOT NULL,
deptID VARCHAR(15) NOT NULL,
dept VARCHAR(20) NOT NULL,
profession VARCHAR(10),
salary INT(5) NOT NULL,
pension DOUBLE
);

-- T_student（完整）
INSERT INTO T_student VALUES ('s102203', '赵亮', 23, '男', '19860516');
INSERT INTO T_student VALUES ('s112303', '郑茹', 21, '女', '19880125');
INSERT INTO T_student VALUES ('s115263', '王海', 23, '男', '19860802');
INSERT INTO T_student VALUES ('s206363', '张明', 22, '男', '19870423');
INSERT INTO T_student VALUES ('s221256', '王昌鹤', 24, '男', '19850318');
INSERT INTO T_student VALUES ('s231456', '王玉梅', 22, '女', '19870328');
INSERT INTO T_student VALUES ('s232516', '李玉峰', 24, '女', '19850816');
INSERT INTO T_student VALUES ('s253263', '李凤', 24, '女', '19850606');

-- T_result（完整）
INSERT INTO T_result VALUES ('s102203', 't232', 75);
INSERT INTO T_result VALUES ('s102203', 't105', 85);
INSERT INTO T_result VALUES ('s102203', 't333', 60);
INSERT INTO T_result VALUES ('s102203', 't321', 90);
INSERT INTO T_result VALUES ('s112303', 't333', 75);
INSERT INTO T_result VALUES ('s112303', 't321', 65);
INSERT INTO T_result VALUES ('s206363', 't105', 80);
INSERT INTO T_result VALUES ('s206363', 't333', 55);
INSERT INTO T_result VALUES ('s221256', 't232', 60);
INSERT INTO T_result VALUES ('s253263', 't321', 90);
INSERT INTO T_result VALUES ('s253263', 't333', 53);
INSERT INTO T_result VALUES ('s253263', 't105', 50);

-- T_teacher（完整）
INSERT INTO T_teacher VALUES ('t102225', '赵伟', 38, '男', 't_10','计算机系','副教授',3000,260.5);-- 
INSERT INTO T_teacher VALUES ('t103265', '张昌', 43, '男', 't_10','计算机系','教授',3800,300);-- 
INSERT INTO T_teacher(teaID,teaName,age,sex,deptID,dept,profession,salary) VALUES ('t105320', '于波', 28, '男', 't_10','计算机系','讲师',2800);-- 
INSERT INTO T_teacher VALUES ('t106358', '毛翠', 50, '女', 't_10','计算机系','教授',4000,289.3);--  
INSERT INTO T_teacher(teaID,teaName,age,sex,deptID,dept,profession,salary) VALUES ('t156354', '王新', 33, '女', 't_15','数学系','讲师',2500);-- 
INSERT INTO T_teacher VALUES ('t156355', '李中', 55, '女', 't_15','数学系','教授',4200,310.2);--  
INSERT INTO T_teacher VALUES ('t181585', '李慧', 40, '女', 't_18','物理系','教授',3500,278);--  
INSERT INTO T_teacher(teaID,teaName,age,sex,deptID,dept,profession,salary) VALUES ('t186585', '孙立', 48, '男', 't_18','物理系','讲师',3200);-- 

-- T_curriculum（课程编号、课程名称、学时）
INSERT INTO T_curriculum VALUES('t105','计算机系统结构',4,50,'赵伟');
INSERT INTO T_curriculum VALUES('t232','数据库基础',5,50,'赵伟');
INSERT INTO T_curriculum VALUES('t321','C语言',6,50,'赵伟');
INSERT INTO T_curriculum VALUES('t333','高等数学',4,50,'赵伟');

-- T_dept（行不完整）
INSERT INTO T_dept VALUES('t_10','计算机系');
INSERT INTO T_dept VALUES('t_15','数学系');
INSERT INTO T_dept VALUES('t_18','物理系');