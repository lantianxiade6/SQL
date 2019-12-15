# SQL

## 常见的关系数据库
- Oracle数据库
- Microsoft SQL Server数据库
- MySQL数据库
- PostgreSQL数据库
- DB2
- Microsoft Access

## SQL语言
SQL是关系数据库中操作的标准语言，例如查询、增加、修改、删除数据，创建和删除数据库对象，修改表结构等。
- 数据定义语言DDL：用于创建CREATE、修改ALERT和删除DROP数据库对象（数据表TABLE、视图VIEW、索引INDEX等）
- 数据查询语言DQL：SELECT和子句FROM、WHERE、GROUP BY、HAVING、WITH
- 数据操作语言DML：更新数据库里数据表中是数据，插入INSERT、修改UPDATE、删除DELETE
- 数据控制语言DCL：授予GRANT和回收REVOKE访问数据库的某种权限
- 事务控制语言：用于数据库对事务的控制，保证数据库中数据的一致性，包括事务的提交COMMIT和回滚ROLLBACK

## 数据类型
- 整数 INT
- 浮点数 FLOAT(m,n)或DOUBLE(m,n)，其中m是数字总位数，n是小数点后的数字个数
- 字符数据 CHAR(n)或VARCHAR(n)，n是指定长度
- 日期和时间类型 DATE、TIME、DATETIME，其中DATETIME的默认格式为YYYY-MM-DD HH:MM:SS，而DATE和TIME分别是YYYY-MM-DD和HH:MM:SS

## 书写规范
- SQL语言不区分关键字的大小写，但规范是用大写
- SQL语言不区分列名和对象名的大小写
- SQL语言对数据库中的数据是大小写敏感的(MySQL不敏感)
- 单行注释用“-- 注释内容”
- 多行注释用“/*注释内容*/”
- SQL语句可以写在一行也可以写在多行上
- SQL语句多句运行时记得有;号间隔

## 开启mysql
开启mysql:用管理员身份打开cmd,net start mysql-回车-回车
关闭: net stop mysql-回车-回车

## 注：
- 这个不是错误，当没看到
[Err] 1055 - Expression #1 of ORDER BY clause is not in GROUP BY clause and contains nonaggregated column 'information_schema.PROFILING.SEQ' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by