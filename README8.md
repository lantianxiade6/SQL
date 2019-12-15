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
till here


- 使用ON子句建立相等连接
- 使用USING子句建立相等连接
## 2.交叉连接
## 3.自连接查询
## 4.外连接查询
- 左外连接
- 右外连接
- 全外连接
## 5.集合查询
- 并操作
- 交操作
- 差操作