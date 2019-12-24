## 1.单行子查询
如果明确知道SQL语句中使用的子查询返回的结果是一行数据，即子查询中返回的结果是一个值时，就可以使用算术比较运算符进行子查询的操作。
```
-- 查询比赵伟工资高的教师信息
SELECT teaID, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE salary>
(SELECT salary
FROM t_teacher
WHERE teaName='赵伟')
ORDER BY salary ASC
```
## 2.多行子查询
所谓多行子查询，是指子查询中返回的结果集中含有多行数据
- 使用IN运算符的子查询、NOT IN  
将满足列表中满足指定表达式的任何一个值都查询
```
-- 查询与毛翠在同一个系的教师信息
SELECT teaId, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE dept IN
(SELECT dept
FROM t_teacher
WHERE teaName='毛翠')
ORDER BY salary ASC
```
- 使用ANY运算符的子查询  
只有与子查询中的任何一个结果值匹配，其值都会被返回（下表中的任何应该是任意的意思）  

ANY与比较运算符结合|意义
--|--
=ANY|等于查询结果中的任何一个值。相当于IN运算符
>ANY|大于查询结果中的任何一个值。即大于查询结果中最小的值
<ANY|小于查询结果中的任何一个值。即小于查询结果中最大的值
>=ANY|大于等于查询结果中的任何一个值。即大于等于查询结果中最小的值
<=ANY|小于等于查询结果中的任何一个值。即小于等于查询结果中最大的值
<>ANY或!=ANY|不等于查询结果中的任何一个值

```
-- 查询其他院系的教师中工资比任意一个数学系教师高的教师信息
SELECT teaId, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE salary >ANY
(SELECT salary
FROM t_teacher
WHERE dept='数学系')
AND dept !='数学系'
ORDER BY salary ASC
```

- 使用ALL运算符的子查询  

ALL与比较运算符结合|意义
--|--
=ALL|等于查询结果中的所有的值。相当于IN运算符
>ALL|大于查询结果中的所有的值。即大于查询结果中最大的值
<ALL|小于查询结果中的所有的值。即小于查询结果中最小的值
>=ALL|大于等于查询结果中的所有的值。即大于等于查询结果中最大的值
<=ALL|小于等于查询结果中的所有的值。即小于等于查询结果中最小的值
<>ALL或!=ALL|不等于查询结果中的所有的值，相当于NOT IN运算符

```
-- 查询其他院系中的教师中比物理系工资最少的老师还低的教师信息
SELECT teaID, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE salary <ALL
(SELECT salary
FROM t_teacher
WHERE dept='物理系')
AND dept!='物理系'
ORDER BY salary
```
## 3.多列子查询
多列子查询，是指子查询的语句会返回多个数据列的子查询语句。  
在多列子查询中，WHERE子句需要使用括号将多个属性括在一起，多个属性之间需要用逗号分开。   
  - 外层查询的WHERE子句中数据列属性的数据类型要和子查询中返回的查询结果的数据列的数据类型必须是同时匹配的 
  - 如果多列子查询中返回的数据行是单行的，即返回的结果值只有一个，则可以使用算术比较运算符
  - 如果多列子查询中返回的数据行是多行的，即返回的结果值不止一个，则可以使用IN、ANY、ALL运算符
```
-- 查询院系和职称都与教师编号为t103265的教师相同的教师信息
SELECT teaID, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE (dept, profession)=
(SELECT dept, profession
FROM t_teacher
WHERE teaID='t103265')
```
## 4.相关子查询
在相关子查询中，子查询需要重复执行，每处理一行外部的查询语句，子查询都会被执行一次。
- 带有EXISTS关键字的相关子查询
  - 对于每一行外部查询的数据结构：
  - 相关子查询只返回逻辑值TRUE或者FALSE，而不会返回任何数据
  - 若返回TRUE，则外层查询的WHERE子句就返回TRUE，则该结果就会作为最终查询的结果显示出来
  - 若返回FALSE，则外层查询的WHERE子句就返回FALSE。
  - 这个过程会反复执行，直到将外层查询的数据全部检查完毕为止。

```
-- 查询选修课程编号为t105的学生信息
SELECT S.stuID, S.stuName, S.age, S.sex
FROM t_student S
WHERE EXISTS
(SELECT *
FROM t_result T
WHERE
S.stuID=T.stuID
AND T.curID='t105')
-- 相关子查询里面用SELECT *即可，因为不管查询哪个字段，都是只返回TRUE或FALSE而已
```
- 带有NOT EXISTS关键字的相关子查询
  - 若返回TRUE，则外层查询的WHERE子句就返回FALSE
  - 若返回FALSE，则外层查询的WHERE子句就返回TRUE
```
-- 查询没有选修课程编号为t105的学生信息
SELECT S.stuID, S.stuName, S.age, S.sex
FROM t_student S
WHERE NOT EXISTS
(SELECT *
FROM t_result T
WHERE
S.stuID=T.stuID
AND T.curID='t105')
```
## 5.在SQL语句中使用子查询
- 在SELECT子句中使用子查询
  - 该子查询查询出来的结果应该是一个具体的值
```
SELECT R.stuID,
(SELECT stuName
FROM t_student
WHERE stuID=R.stuID) AS stuName, R.result, R.curID
FROM t_result R
WHERE R.stuID='s102203'
ORDER BY R.result ASC
```
- 在FROM子句中实现子查询
  - 该子查询查询出来的结果集组成一个临时的数据表
```
SELECT R.stuID, C.curID, C.curName, R.result
FROM t_curriculum C,
(SELECT curID, stuID, result
FROM t_result) R
WHERE R.curID=C.curID
AND R.stuID='s102203'
ORDER BY R.result ASC
-- FROM子句中使用子查询时，必须指定子查询的别名
```
- 在HAVING字句中实现子查询
  - 该子查询查询出来的结果集组成一个临时的数据表
```
-- 查询学生编号以s2开头的学生的平均成绩
SELECT R.stuID, AVG(R.result)
FROM t_result R, t_curriculum C
WHERE R.curID=C.curID
GROUP BY R.stuID
HAVING R.stuID IN
(SELECT stuID
FROM t_student
WHERE stuID LIKE 's2%')
ORDER BY R.stuID
```
## 6.多重子查询
- 查询条件中有多个子查询语句
```
-- 查询院系和职称都与教师编号t103265相同的教师信息
SELECT teaID, teaName, age, sex, dept, profession
FROM t_teacher
WHERE dept=
(SELECT dept FROM t_teacher WHERE teaID='t103265')
AND profession=
(SELECT profession FROM t_teacher WHERE teaID='t103265')

-- 查询职称与教师编号为t181585相同但工资更高的教师信息
SELECT teaID, teaName, age, sex, dept, profession, salary
FROM t_teacher
WHERE profession=
(SELECT profession FROM t_teacher WHERE teaID='t181585')
AND salary>
(SELECT salary FROM t_teacher WHERE teaID='t181585')
```
## 7.在CREATE TABLE语句中使用子查询实现数据表的复制
- 新创建的数据表不能继承原数据表的主键、约束条件等信息
```
CREATE TABLE 表名
AS
SELECT语句

CREATE TABLE T2_student
AS 
SELECT stuID, stuName, age, sex, birth
FROM t_student
```