## 1.比较查询
### 1.1 算术比较运算符
等于|=|不等于|!=或<>
--|--|--|--
大于等于|>=|不大于|!>
小于等于|<=|不小于|!<
大于|>
小于|<
```
SELECT curName,credit FROM t_curriculum WHERE credit>=4
SELECT teaID,teaName,dept,profession FROM t_teacher WHERE profession!='教授'
```
### 1.2 BETWEEN...AND / NOT BETWEEN...AND
```
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE age BETWEEN 30 AND 50
```
### 1.3 IN 列表匹配 / NOT IN
```
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE dept IN ('计算机系','数学系')
-- 等同于
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE dept ='计算机系' OR dept='数学系'
```
### 1.4 字符串比较
- 使用比较运算符对字符串进行比较(MySQL不分大小写)
```
SELECT 'sql5.0'>'sql'-- 1
SELECT 'mysql'='MySQL'-- 1
SELECT UPPER('mysql')=UPPER('MySQL')-- 1
```
- 使用BINARY关键字对字符串进行二进制比较(分大小写的写法)
```
SELECT 'mysql'= BINARY 'MySQL'-- 0
```
### 1.5 日期比较
```
SELECT stuID,stuName,age,sex,birth FROM t_student WHERE birth>'19860101'
SELECT stuID,stuName,age,sex,birth FROM t_student WHERE birth BETWEEN '19860101' AND '19881212'
```
## 2.逻辑查询 AND/OR/NOT
优先级：算术运算符>NOT>AND>OR,使用括号可以改变优先级
```
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE age>45 AND profession='教授'
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE age>45 OR profession='教授'
SELECT teaID,teaName,age,sex,dept,profession FROM t_teacher WHERE dept NOT IN('计算机系','数学系')
SELECT teaID,teaName,age,sex,dept,profession,salary FROM t_teacher WHERE (dept ='计算机系' OR dept='数学系') AND salary>3000
```
## 3.空值查询 IS NULL/IS NOT NULL
```
SELECT teaID,teaName,profession,salary,pension FROM t_teacher WHERE pension IS NULL
SELECT teaID,teaName,profession,salary,pension FROM t_teacher WHERE pension IS NOT NULL
```
## 4.使用LIKE操作符实现模糊查询 LIKE/NOT LIKE
- 通配符_表示匹配单个字符
```
SELECT * FROM t_student WHERE stuID LIKE 's_____3'
SELECT * FROM t_student WHERE stuID NOT LIKE 's_____3'
```
- 通配符%表示匹配0个或者多个字符
```
SELECT * FROM t_student WHERE stuName LIKE '王%'
```
- 通配符[]表示查询某一个范围馁的所有单个字符，[^]表示那些不在某一个指定范围内的字符
- 使用ESCAPE关键字指定转义字符
```
SELECT deptID,deptName FROM t_dept WHERE deptID like '%$_%' ESCAPE '$'
```
## 5.使用REGEXP关键字进行模式匹配/NOT REGEXP
- ^：用来匹配字符串的开始
- $：用来匹配字符串的结尾
- []：在方括号中的任何字符都可以匹配
- -：连字符用来表示字符匹配的范围
- +：表示用于匹配的该字符在被匹配的字符串汇中出现至少一次或者多次
- *：表示用于匹配的该字符在被匹配的字符串中出现零次或者多次
- ()：在圆括号中的内容将被看做一个整体。
- {m}：整数m表示花括号前的字符串需要出现的次数
```
SELECT * FROM t_student WHERE stuName REGEXP '^王'
SELECT 'agf' REGEXP '[a-d]+', 'banana' REGEXP '(ana){2}'
```