WHERE->GROUP BY->HAVING->ORDER BY
## 1.使用ORDER BY子句对数据记录进行排序
ORDER BY子句必须放在所有子句的最后
```
SELECT teaID,teaName,dept,profession,salary  FROM t_teacher ORDER BY salary ASC-- 升序
SELECT teaID,teaName,dept,profession,salary  FROM t_teacher ORDER BY salary DESC-- 降序
SELECT teaID,teaName,dept,profession,salary  FROM t_teacher ORDER BY 5 ASC-- 指定列的位置序号排序

SELECT teaID,teaName,dept,profession,salary
FROM t_teacher
WHERE dept='计算机系'
ORDER BY salary ASC

SELECT teaID,teaName,dept,profession,salary
FROM t_teacher
ORDER BY dept ASC, salary DESC-- 多列排序
```
## 2.常用的聚会函数
函数|功能
--|--
COUNT(列或表达式)|计算给定列或者表达式中非空行的行数
COUNT(*)|计算数据表的总行数，包括空值（NULL行）
MAX(列或表达式)|计算给定列或者表达式中的最大值
MIN(列或表达式)|计算给定列或者表达式中的最小值
SUM(列或表达式)|计算给定列或者表达式中所有值的总和
AVG(列或表达式)|计算给定列或者表达式中所有值的平均值
```
SELECT COUNT(*) FROM t_teacher
SELECT COUNT(pension) FROM t_teacher
SELECT COUNT(dept) FROM t_teacher
SELECT COUNT(DISTINCT dept) FROM t_teacher
SELECT MAX(salary),MIN(salary) FROM t_teacher
SELECT SUM(salary),COUNT(salary),AVG(salary) FROM t_teacher
```
## 3.使用GROUP BY子句对表中数据进行分组
```
SELECT dept,COUNT(profession) FROM t_teacher GROUP BY dept-- 单列分组
SELECT dept,profession,MAX(salary) FROM t_teacher GROUP BY dept,profession-- 多列分组
```
HAVING子句是对分组后的结果进行筛选，放在GROUP BY子句后面
```
SELECT dept,profession,MAX(salary)
FROM t_teacher
GROUP BY dept,profession
HAVING MAX(salary)>3000
```
WHERE->GROUP BY->HAVING->ORDER BY
WHERE子句是针对于SELECT语句的结果进行筛选，HAVING是针对GROUP BY子句的结果进行筛选。WHERE子句不允许使用聚合函数，而HAVING子句可以使用聚合函数。
```
SELECT profession,MAX(salary)
FROM t_teacher
WHERE age>=30
GROUP BY profession
HAVING MAX(salary)>3000
```
```
SELECT dept,profession,MAX(salary)
FROM t_teacher
GROUP BY dept,profession
ORDER BY MAX(salary) DESC
```
若GROUP BY的列含有NULL值，会将该列所有的NULL归为一组。
## 4.使用ROLLUP关键字统计数据
ROLLUP关键字的作用是对分组后的数据做阶段性的操作（相当于小计），并且可以对查询出来的所有记录的数据做一个最终操作（相当于总计）。小计和总计的运算结果会自动添加到分组后的数据列中以及查询结果的最后一行中。
```
SELECT dept,profession,SUM(salary)
FROM t_teacher
GROUP BY dept,profession WITH ROLLUP
```
## 5.限制结果集行数
LIMIT n,m从第n+1条数据开始，查看m条数据。如果只有1个参数，n默认为0
```
SELECT teaID,teaName,dept,profession
FROM t_teacher
ORDER BY teaID
LIMIT 3
```