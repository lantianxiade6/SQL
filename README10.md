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
-- （1）
-- （2）
-- （3）
-- （4）
-- （5）
-- （6）
-- （7）
-- （8）
-- （9）
-- （10）
-- （11）
-- （12）
-- （13）
-- （14）
-- （15）
-- （16）

## 3.日期时间函数
## 4.类型转换函数
## 5.比较函数
## 6.空值处理函数
## 7.分支函数和条件表达式