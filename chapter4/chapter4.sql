-- 创建数据表与约束
-- 学生信息表(学生编号#、名称、年龄、性别、生日)
CREATE TABLE T_student(
stuID VARCHAR(15) PRIMARY KEY,
stuName VARCHAR(10) NOT NULL,
age INT NOT NULL,
sex VARCHAR(2) NOT NULL,
birth DATETIME NOT NULL
)
-- 院系信息表(院系编号#、名称)
CREATE TABLE T_dept(
deptID VARCHAR(15) UNIQUE,
deptName VARCHAR(10)
)
-- 成绩信息表(学生编号#、课程编号、成绩)
CREATE TABLE T_result(
stuID VARCHAR(15),
curID VARCHAR(15),
result DOUBLE,
FOREIGN KEY(stuID) REFERENCES T_student(stuID) ON DELETE CASCADE,
PRIMARY KEY(stuID, curID)
)
-- 课程信息表(课程编号#、名称、学分)
CREATE TABLE T_curriculum(
curID VARCHAR(15) PRIMARY KEY,
curName VARCHAR(10),
credit INT,
CHECK(credit BETWEEN 3 AND 8)
)
-- 教师信息表(教师编号#、名称、年龄、性别、院系编号#、院系、职称)
CREATE TABLE T_teacher(
teaID VARCHAR(15) PRIMARY KEY,
teaName VARCHAR(10) NOT NULL,
age INT NOT NULL,
sex VARCHAR(2) NOT NULL,
deptID VARCHAR(15),
dept VARCHAR(20) NOT NULL,
profession VARCHAR(10)
)

-- 索引的创建与删除
-- 单列索引
CREATE INDEX i_profession ON T_teacher(profession)
CREATE INDEX i_profession_asc ON T_teacher(profession ASC)
-- 复合索引
CREATE INDEX i_dept_profession ON T_teacher(dept,profession)
-- 删除索引
DROP INDEX i_profession_asc ON T_teacher


