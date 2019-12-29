## 1.向数据表中插入数据记录
- 插入单行数据记录
```
INSERT INTO 表名([列名1,列名2...]) VALUES (value1[,values...])

INSERT INTO t_student VALUES('s281234','王龙',20,'男','19890218')
INSERT INTO t_student (stuID,stuName,age,sex,birth) VALUES('s284321','李茜',20,'女','19890820')
```
- 向定义有外键约束的表中插入数据记录
  - 其插入的数据记录需要满足外键约束条件
  till here
## 2.向视图插入数据记录