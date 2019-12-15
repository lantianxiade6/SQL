- 查询全部列的记录
```
SELECT * FROM 表名或试图名[,表名2或试图名2]
SELECT * FROM T_student
```
- 查询表中指定的列
```
SELECT 列名[,列名2] FROM 表名或试图名[,表名2或试图名2]
SELECT stuID,stuName FROM T_student
```
- 查询表中不重复的列
```
SELECT DISTINCT 列名[,列名2] FROM 表名或试图名[,表名2或试图名2]
SELECT DISTINCT stuID FROM T_result
```
- 使用列别名查询
```
SELECT 列名 [AS] 列别名[,列名2 [AS] 列别名2] FROM 表名或试图名[,表名2或试图名2]
SELECT stuID AS 学生编号, stuName AS 学生姓名, age AS 年龄, sex AS 性别, birth AS 出生日期 FROM T_student
如果别名带有空格或特殊符号.,;:需要用单引号或双引号
SELECT stuID AS '学生 编号' FROM T_student
```
- 对查询的记录进行算术运算(+-*/)
```
SELECT teaID AS 教师编号, teaName AS 教师姓名, salary*12 AS 年收入 FROM T_teacher
```
- 使用连接符||连接字段
```
SELECT stuID, stuName||sex FROM T_student-- 这个在MySQL是不行的。
SELECT stuID, CONCAT(stuName,sex) FROM T_student-- 这个在MySQL是可以的
```
