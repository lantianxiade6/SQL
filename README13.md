## 在数据表中修改数据记录
- 修改单行数据记录
```
UPDATE 表名
SET 列1=值1[,列2=值2]
WHERE 条件

UPDATE t_student
SET age=age+1
WHERE stuID='s281234'

UPDATE t_result
SET result=result+10
WHERE stuID='s102203'
AND curId='t333'

UPDATE t_curriculum
SET learntime=80,credit=4
WHERE curName='操作系统'
```
- 在定义有外键约束的表中修改数据记录
如果设置了ON UPDATE RESTRICT就不允许修改该外键，需要先到主表里面修改（如果设的是ON UPDATE CASCADE，需先改为RESTRICT(暂时不知道怎么改)）
```
UPDATE t_student
SET stuID='s111111'
WHERE stuID='s281234'

UPDATE t_result
SET stuID='s111111'
WHERE stuID='s281234'
```

- 修改多行记录
till here
- 使用子查询修改数据记录
- 使用CASE条件表达式修改多行记录
## 在视图中修改数据记录