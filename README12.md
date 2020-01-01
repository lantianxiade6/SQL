## 1.向数据表中插入数据记录
- 插入单行数据记录
```
INSERT INTO 表名([列名1,列名2...]) VALUES (value1[,values...])

INSERT INTO t_student VALUES('s281234','王龙',20,'男','19890218')
INSERT INTO t_student (stuID,stuName,age,sex,birth) VALUES('s284321','李茜',20,'女','19890820')
```
- 向定义有外键约束的表中插入数据记录
  - 其插入的数据记录需要满足外键约束条件（如果要插入的数据表带有外键，那么这个外键的值一定要在它的主表也有，否则要先在主表加入数据）
```
INSERT INTO t_result VALUES ('s111111','t321',75)-- 这个跑不通的
INSERT INTO t_result VALUES ('s281234','t321',75)
```
- 使用子查询插入多行数据实现表中数据的复制
```
INSERT INTO 表名[(列名1，列名2...)] 子查询

```
## 2.向视图插入数据记录