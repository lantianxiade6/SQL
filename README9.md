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
只有与子查询中的任何一个结果值匹配，其值都会被返回  

ANY与比较运算符结合|意义
--|--
=ANY|等于查询结果中的任何一个值。相当于IN运算符
>ANY|大于查询结果中的任何一个值。即大于查询结果中最小的值
<ANY|小于查询结果中的任何一个值。即小于查询结果中最大的值
>=ANY|大于等于查询结果中的任何一个值。即大于等于查询结果中最小的值
<=ANY|小于等于查询结果中的任何一个值。即小于等于查询结果中最大的值
<>ANY或!ANY|不等于查询结果中的任何一个值

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
till here
## 3.多列子查询
## 4.相关子查询
- 带有EXISTS关键字的相关子查询
- 带有NOT EXISTS关键字的相关子查询
## 5.在SQL语句中使用子查询
- 在SELECT字句中使用子查询
- 在FROM字句中实现子查询
- 在HAVING字句中实现子查询
## 6.多重子查询
## 7.在CREATE TABLE语句中使用子查询实现数据表的复制