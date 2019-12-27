## 1.字符函数
```
-- （1）字符长度
SELECT LENGTH('CREATE TABLE')
SELECT LENGTH('教师表')-- 一个汉字当做3个字符计算
SELECT CHAR_LENGTH('教师表')-- 一个汉字当做1个字符计算

-- （2）转为小写
SELECT LOWER('CREATE TABLE')

-- （3）转为大写
SELECT UPPER('create table')

-- （4）仅首字母转为大写
SELECT INITCAP('create table')-- MySQL不适用

-- （5）截取字符串
SUBSTR(string,start[,length])-- 从字符串string的start位置开始向后截取长度为length的子串。start为正则左起截取，负则右起截取
SELECT SUBSTR('structured query language',12,5)
SUBSTRING_INDEX(string,delim,count)-- 截取字符串string从开始到第count个位置开始出现的分隔符delim之前的子串。count为正则左起算起，为负则右起算起。
SELECT SUBSTRING_INDEX('structured:query:language',':',2)

-- （6）从左侧读取子串
SELECT LEFT('structured:query:language',10)

-- （7）从右侧读取子串
SELECT RIGHT('structured:query:language',8)

-- （8）去除左侧空格或字符（MySQL只能去空格）
SELECT LTRIM(' structured:query:language')

-- （9）去除右侧空格或字符（MySQL只能去空格）
SELECT RTRIM('structured:query:language ')

-- （10）去除两侧空格或字符
TRIM([[BOTH|LEADING|TRAILING][set][FROM] string])-- BOTH指两侧，LEADING指左侧，TRAILING指右侧；set指要去除的字符，默认为空格
SELECT TRIM(BOTH '.' FROM '.structured:query:language.')
SELECT TRIM(LEADING '.' FROM '.structured:query:language.')
SELECT TRIM(TRAILING '.' FROM '.structured:query:language.')

-- （11）左侧填充空格或字符
LPAD(string,length,padstring)-- 在string左侧填充字符padstring,使得总长度为length
SELECT LPAD('select',10,'SQL')

-- （12）右侧填充空格或字符RPAD(string,length,padstring)-- 在string右侧填充字符padstring,使得总长度为length
SELECT RPAD('select',10,'SQL')

-- （13）取得指定的子串在字符串中的位置
INSTR(string,substring)-- 子串substring在string中第一次出现的位置
SELECT INSTR('MySQL','SQL')
POSITION(string,substring)-- 子串substring在string中第一次出现的位置
SELECT POSITION('SQL' in 'MySQL')
LOCATE(substring,string,[start])-- 子串substring在string第start个位置开始查找第一次出现的位置
SELECT LOCATE('SQL', 'MySQL')

-- （14）颠倒字符串顺序
SELECT REVERSE('query')

-- （15）替换指定子串
REPLACE(string,search_string [,replace_string])-- 将string中的search_string替换为replace_string，若省略replace_string则默认替换为空（但MySQL不可省略）
SELECT REPLACE('structured query language','structured','SQL')

-- （16）字符替换
TRANSLATE(string,search_string,replace_string)-- 但MySQL不适用

-- （17）拼接字符串
CONCAT(string1,string2,string3,...)
SELECT CONCAT(stuName,":",age)
FROM t_student

-- （18）取得字符的ASCII码
ASCII(string)-- 取得string的第一个字符的ascii码
SELECT ASCII('A')
SELECT ASCII('ABC')

-- （19） 将ASCII码转换为相应的字符
SELECT CHAR(65)

-- （20） 匹配发音
SELECT SOUNDEX('hart')
SELECT SOUNDEX('heart')

-- （21）将字符串重复指定次数
REPEAT(string,count)-- 将string重复count次
SELECT REPEAT('SQL',2)
```
## 2.数值函数
```
-- （1）绝对值
SELECT abs(-3)
-- （2）平方
SELECT SQUARE(-3)-- Microsoft SQL server才有
SELECT POWER(-3,2)-- 负3的平方
-- （3）平方根
SELECT SQRT(9)
-- （4）对数
SELECT LOG(9)-- 9的自然对数
SELECT LOG10(10)-- 以10为底10的对数
SELECT LOG(10,100)--以10为底100的对数
-- （5）幂
SELECT EXP(2)-- e的2次幂
SELECT POWER(2,3)-- 2的3次幂
-- （6）四舍五入
ROUND(n[,m])-- 对n保留m位小数，m默认为0;当m为负数时表示四舍五入小数点左边的第m位
SELECT ROUND(0.1234,2)
-- （7）余数
SELECT MOD(13,5)-- 13除以5的余数
SELECT 13%5

-- （8）大于等于指定数的最小整数
SELECT CEIL(10.5)
SELECT CEILING(10.5)

-- （9）小于等于指定数的最大整数
SELECT FLOOR(10.5)

-- （10）正弦、余弦
SELECT SIN(PI()/2)
SELECT COS(PI()/3)

-- （11）正切、余切
SELECT TAN(PI()/4)
SELECT COT(PI()/4)

-- （12）反正弦、反余弦
SELECT ASIN(1)
SELECT ACOS(0.5)

-- （13）反正切
SELECT ATAN(2)
SELECT ATAN2(10,5)-- 10除以5的反正切

-- （14）弧度与角度互换
SELECT DEGREES(PI()/3)--弧度pi/3对应的角度
SELECT RADIANS(60)--60度角对应的弧度数

-- （15）正负符号检测
SELECT SIGN(-3),SIGN(4)

-- （16）截取
TRUNCATE(n,m)--m若为正整数表示截取n到小数点右侧第m位，m为0表示截掉n的小数部分，m为负整数表示截取n到小数点左侧第m位
SELECT TRUNCATE(1234.5678,2),TRUNCATE(1234.5678,0),TRUNCATE(1234.5678,-2)
```
## 3.日期时间函数

- 取得当前系统日期时间
```
SELECT NOW(), SYSDATE(), CURRENT_DATE(), CURRENT_TIME()
```
- 对日期时间进行加减运算
```
DATE_ADD(日期时间,INTERVAL 数值 type关键字)
SELECT NOW(), DATE_ADD(NOW(),INTERVAL 1 DAY)-- 加1天
SELECT NOW(), DATE_ADD(NOW(),INTERVAL 1 YEAR)-- 加1年
SELECT NOW(), DATE_ADD(NOW(),INTERVAL '01:10' DAY_MINUTE)

DATE_SUB(日期时间,INTERVAL 数值 type关键字)
SELECT NOW(), DATE_SUB(NOW(),INTERVAL 3 MONTH)-- 减3个月
```
type关键字|在DATE_ADD函数中的意义
----|----
YEAR|年数
MONTH|月数
QUARTER|季度
WEEK|周数
DAY|天数
HOUR|小时数
MINUTE|分钟数
SECOND|秒数
MICOSECOND|微秒数
YEAR_MONTH|年数和月数('yy-mm')
DAY_HOUR|小时数('hh')
DAY_MINUTE|小时数和分钟数('hh:mm')
DAY_SECOND|小时数、分钟数和秒数('hh:mm:ss')

- 指定工作日之后的日期
```
NEXT_DAY(date,n)-- date之后的下周日(n=1)、下周一(n=2)...
```

- 日期中的指定内容

函数|含义
--|--
DAYOFYEAR(date)|一年当中的某一天(1-366)
DAYOFMONTH(date)|一月当中的某一天(1-31)
DAYOFWEEK(date)|星期(周日为1，周一为2，...，周六是7)
WEEKOFYEAR(date)|一年当中的某一个星期(1-53)
DAYNAME(date)|天，如Monday、Tuesday等
MONTHNAME(date)|月份，如January、February等
YEAR(date)|年份(1000-9999)
MONTH(date)|月份(1-12)
WEEKDAY(date)|星期值(0-6)其中0代表星期一，6代表星期日
WEEK(date)|date在一年中是第几个星期，以周日为每个星期的第一天
WEEK(date,first)|date在一年中是第几个星期；first指定每一个星期的第一天是从周几开始的，0是周日，1是周一
HOUR(time)|小时(0-23)
MINUTE(time)|分钟(0-59)
SECOND(time)|秒(0-59)

```
SELECT NOW(),DAYOFYEAR(NOW()),DAYOFMONTH(NOW()),DAYOFWEEK(NOW()),WEEKOFYEAR(NOW())
SELECT NOW(),DAYNAME(NOW()),MONTHNAME(NOW())
SELECT NOW(),YEAR(NOW()),MONTH(NOW()),DAY(NOW()),WEEKDAY(NOW())
SELECT NOW(),WEEK(NOW()),WEEK(NOW(),1)
SELECT NOW(),HOUR(NOW()),MINUTE(NOW()),SECOND(NOW())
```
- 指定日期所在月的最后一天
```
SELECT NOW(),LAST_DAY(NOW())
```
- 两个月份的差
```
MONTHS_BETWEEN(date1,date2)-- MySQL不适用
```
- 对日期时间进行四舍五入
```
ROUND(date[,fmt])-- MySQL不适用
```
- 截断指定的日期时间
```
TRUNC(date[,fmt])-- MySQL不适用
```
## 4.类型转换函数
### (1)字符转换函数
```
CAST(expression AS datatype[length])
```
- expression为数字值或日期值
- datatype为要转换成的数据类型，可以是字符类型、数值类型、日期类型等等
- length为数据长度
```
SELECT teaID, teaName, CAST(salary as CHAR(5))
FROM t_teacher
```
### (2)日期转换函数
```
DATE_FORMAT(date,fmt)-- 将date按给定格式fmt转换
SELECT now(), DATE_FORMAT(NOW(),'%W %M %D %Y'), DATE_FORMAT(NOW(),'%H:%i:%s')
SELECT now(), TIME_FORMAT(NOW(),'%H:%i:%s')
```
[DATE_FORMAT参数符号含义](./DATE_FORMAT.jpg)
### (3)数值转换函数
```TO_NUMBER(char,[,fmt[,'nlsparams']])-- MySQL不适用```
## 5.比较函数
- 最小值
SELECT LEAST(10,15,6,20)
- 最大值
SELECT GREATEST(10,15,6,20)
- 比较两个字符串
```STRCMP(string1,string2)```
  - string1>string2则返回1
  - string1=string2则返回0
  - string1<string2则返回-1
```
SELECT STRCMP('mysql','my'),STRCMP('mysql','mySQL'),STRCMP('mysql','mysql2')
```
## 6.空值处理函数
till here
## 7.分支函数和条件表达式