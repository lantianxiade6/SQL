## 1.内连接查询
- 等值连接
```
SELECT 表名1.字段,表名2.字段
FROM 表名1,表名2
WHERE 表名1.字段1=表名2.字段2
```
```
SELECT t_result.stuID,t_curriculum.curID,t_curriculum.curName,t_result.result
FROM t_result,t_curriculum
WHERE t_result.curID=t_curriculum.curID
ORDER BY t_result.stuID ASC
```
使用别名
```
SELECT A.字段,B.字段
FROM 表名1 A,表名2 B
WHERE A.字段1=B.字段2

SELECT R.stuID,C.curID,C.curName,R.result
FROM t_result R,t_curriculum C
WHERE R.curID=C.curID
ORDER BY R.stuID ASC

带条件：
SELECT R.stuID,C.curID,C.curName,R.result
FROM t_result R,t_curriculum C
WHERE R.curID=C.curID
AND R.stuID='s102203'

三表连接：
SELECT R.stuID,S.stuName,C.curID,C.curName,R.result
FROM t_result R,t_curriculum C, t_student S
WHERE R.curID=C.curID
AND R.stuID=S.stuID
And S.stuName='赵亮'
```
使用INNER JOIN...ON
```
SELECT R.stuID,C.curID,C.curName,R.result
FROM t_result R INNER JOIN t_curriculum C
ON R.curID=C.curID
ORDER BY R.stuID ASC
```
- 非等值连接
非等值连接是指使用除了等号运算符以外的其他运算符将指定条件连接起来而执行的查询操作。一般情况下，需要和等值连接等其他查询放在一起使用
```
SELECT R.stuID, C.curID, C.curName, R.result
FROM t_result R, t_curriculum C
WHERE R.curID=C.curID
AND R.result>80
```
- 使用ON子句建立相等连接
```
SELECT 表名1.字段, 表名2.字段
FROM 表名1 JOIN 表名2
ON 表名1.字段1=表名2.字段

SELECT R.stuID, C.curID, C.curName, R.result
FROM t_result R JOIN t_curriculum C
ON R.curID=C.curID
WHERE R.stuID='s102203'
```
- 使用USING子句建立相等连接
```
SELECT 表名1.字段, 表名2.字段
FROM 表名1 JOIN 表名2
USING (字段)

SELECT R.stuID, C.curID, C.curName, R.result
FROM t_result R JOIN t_curriculum C
USING (curID)
ORDER BY R.stuID
```
## 2.交叉连接
交叉连接返回的结果是一个笛卡尔积。
所谓笛卡尔积，实际就是两个集合相乘的结果。假设集合A中有n个元素，集合B中有m个元素，如果最后返回的结果是n*m，那么这个结果就是集合A和集合的笛卡尔积。
```
如果表与表之间进行连接查询时没有在WHERE子句中指定查询条件，
那么这两个表做的就是一个交叉连接，
经过交叉连接返回的结果集的行数实际是两个表行数的乘积。
SELECT R.stuID, C.curID
FROM t_result R, t_curriculum C

使用CROSS JOIN关键字也可以建立交叉连接
SELECT R.stuID, C.curID, C.curName, R.result
FROM t_result R CROSS JOIN t_curriculum C
```
一般情况下，不会使用交叉连接进行数据查询
## 3.自连接查询
所谓自连接，就是指一个数据表与其自身进行连接
```
SELECT A.字段1, A字段2
WHERE 表名1 A, 表名1 B
WHERE A.字段=B.字段

在课程信息表中选择学分数比操作系统的学分多的课程信息
SELECT C2.curID, C2.curName, C2.credit
FROM t_curriculum C1, t_curriculum C2
WHERE C1.curName='操作系统'
AND C1.credit<C2.credit
```
## 4.外连接查询
外连接查询不仅可以返回满足连接条件的记录，对于一个数据表中在另一个数据表中不匹配的记录也可以返回。
- 左外连接
不仅显示满足条件的记录，左侧表中不满足查询条件的记录也可以返回
```
SELECT 表名1.字段, 表名2.字段
FROM 表名1 LEFT JOIN 表名2
ON 表名1.字段1=表名2.字段2

SELECT R.stuID, R.curID,C.curName
FROM t_result R LEFT JOIN t_curriculum C
ON R.curID=C.curID

#USING可以达到相同效果
SELECT R.stuID, R.curID,C.curName
FROM t_result R LEFT JOIN t_curriculum C
USING(curID)
```
- 右外连接
不仅显示满足条件的记录，右侧表中不满足查询条件的记录也可以返回
```
SELECT 表名1.字段, 表名2.字段
FROM 表名1 RIGHT JOIN 表名2
ON 表名1.字段1=表名2.字段2

SELECT R.stuID, R.curID,C.curName
FROM t_result R RIGHT JOIN t_curriculum C
ON R.curID=C.curID

#USING可以达到相同效果
SELECT R.stuID, R.curID,C.curName
FROM t_result R RIGHT JOIN t_curriculum C
USING(curID)
```
- 全外连接
MySQL并不支持全外连接，Oracle就有

## 5.集合查询
- 并操作
返回两个查询语句中查询出来所有不同的行，不包含重复行。但两个查询语句查询出来的列数必须相同，而且对应的列的数据类型必须一致。若要保留重复行，可以使用UNION ALL关键字。
```
SELECT 语句1
UNION
SELECT 语句2

-- 这个操作等同于全外连接
SELECT R.stuID, R.curID, C.curName
FROM t_result R LEFT JOIN t_curriculum C
on R.curID=C.curID
UNION
SELECT R.stuID, R.curID, C.curName
FROM t_result R RIGHT JOIN t_curriculum C
on R.curID=C.curID
```
- 交操作
交操作返回的结果集包括了连接查询结果的公共行。但两个查询语句查询出来的列数必须相同，而且对应的列的数据类型必须一致。
```
SELECT 语句1
INTERSECT
SELECT 语句2

-- 但MySQL不支持INTERSECT关键字，Oracle和Microsoft SQL Server才支持
(SELECT teaID, teaName, dept, profession
FROM t_teacher)
INTERSECT
(SELECT teaID, teaName, dept, profession
FROM t_CSteacher)
```
- 差操作
差操作返回的记录结果集只在第一个SELECT语句总出现，但不存在于第二个SELECT语句的查询结果中。但两个查询语句查询出来的列数必须相同，而且对应的列的数据类型必须一致。
```
SELECT 语句1
MINUS
SELECT 语句2

-- Oracle可以使用MINUS关键字完成差操作；
-- Microsoft SQL Server可以使用EXCEPT关键字完成差操作。
-- 但MySQL不支持MINUS和EXCEPT关键字。
(SELECT teaID, teaName, dept, profession
FROM t_teacher)
MINUS
(SELECT teaID, teaName, dept, profession
FROM t_CSteacher)
```