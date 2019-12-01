## 创建数据表
```
CREATE TABLE 表名(
列名1 数据类型1 [约束1]
)
```
- 记录：数据表中的每一行，描述实体中的具体数据
- 字段：数据表中的一列，用来保存数据表中某一条记录中的特定信息
- 主键：数据表中的唯一标示。列值唯一且不能为空值。  
注：主键并不一定只定义在一个列上。可以将数据表中的多列合在一起作为该表的主键。
- 外键：属性列F是关系A中的主键，且属性列F是关系B中的一个属性（并不是关系B的主键），则F是关系B的外键。关系A中的表被称为主表，关系B中的表被称为主表的从表。
- 索引：避免扫描全表，加快访问速度；但会占用硬盘空间，维护索引会耗费时间。建议：
```
- 在主键列中创建索引；
- 多表连接时，在经常使用的连接列上创建索引；
- 在经常使用WHERE子句查询的列上创建索引；
- 在经常进行分组GROUP BY和排序ORDER BY的列上创建索引。
CREATE [UNIQUE]|[CLUSTER] INDEX 索引名 ON 表名(列名 [排列方式])
UNIQUE是唯一索引，保证数据列的唯一性；
CLUSTER是聚簇索引，提高对数据表的查询效率。
```
- 约束：
  - 唯一约束（UNIQUE）：保证使用唯一约束的某一个列或组列没有相同的值，但允许插入空值。
  - 主键约束（PRIMARY KEY）：只能有唯一的值且不能包含空值。数据表中只能定义一个主键。
  - 外键约束（FOREIGN KEY）：保证表的参照完整性。确保对一个表的数据操作不会对与之关联的表造成不利的影响。
```
FOREIGN KEY[表名1](列名1) REFERENCES 表名2(列名2)
[ON UPDATE [CASCADE]|[SET NULL]|[RESTRICT]]
[ON DELETE [CASCADE]|[SET NULL]|[RESTRICT]]
以ON DELETE为例，当主表中的一条数据记录被删除时，那么从表中与之相对应的数据将：
CASCADE：被删除
SET NULL：被设置为空
RESTRICT：报错（不会删除）（默认是RESTRICT）
```
  - 检查约束（CHECK）：限制列的取值范围或取值条件。可以为一个列定义多个CHECK约束。
  - 非空约束（NOT NULL）：限制列不允许插入空值。

## 修改数据表结构
```
增加一列
ALTER TABLE 表名 ADD(列名 数据类型 [约束])
ALTER TABLE T_teacher ADD salary INT NOT NULL

增加一个约束条件
ALTER TABLE 表名 ADD 约束名(列名)
ALTER TABLE T_dept ADD PRIMARY KEY(deptID)
ALTER TABLE T_result ADD FOREIGN KEY(curID) REFERENCES T_curriculum(curID)

增加一个索引
ALTER TABLE 表名 ADD INDEX(列名1[,列名2])
ALTER TABLE T_curriculum ADD INDEX i_credit(credit)

修改某一列的数据类型、默认值等
ALTER TABLE 表名 MODIFY 列名 数据类型
ALTER TABLE T_student MODIFY sex CHAR(2)

删除一列
ALTER TABLE 表名 DROP 列名
ALTER TABLE T_teacher DROP salary

删除一个约束条件
ALTER TABLE 表名 DROP 约束名
ALTER TABLE T_dept DROP PRIMARY KEY

删除表(由此表建立的相应视图也对被删除)
DROP TABLE 表名 [CASCADE CONSTRAINTS]
DROP TABLE T_teacher
当要删除的表与其他表有外键约束是，需加CASCADE CONSTRAINTS
DROP TABLE T_curriculum CASCADE CONSTRAINTS
但其实我的程序没有成功，这样才成功了：
SET FOREIGN_KEY_CHECKS=0;-- 禁用外键约束
DROP TABLE T_curriculum;
SET FOREIGN_KEY_CHECKS=1;-- 启动外键约束

```

  [语法](./chapter4.sql)
  [语法new-做后续章节练习用](./chapter4new.sql)