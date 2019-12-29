- 视图的作用
  - 提高数据访问的安全性
  - 方便查询操作
- 视图的创建
  - 基于单表创建视图
    ```
    CREATE VIEW 视图名[视图列名1,,...] AS 子查询

    CREATE VIEW V_teacher-- 创建视图
    AS
    SELECT teaID,teaName,age,sex,dept,profession
    FROM t_teacher

    SELECT * FROM V_teacher-- 查询视图

    -- 指定视图的列名
    CREATE VIEW V_teacher2(V_teaID,V_teaName,V_age,V_sex,V_dept,V_profession)
    AS
    SELECT teaID,teaName,age,sex,dept,profession
    FROM t_teacher
    ```

  - 基于多表连接创建视图
    ```
    CREATE VIEW v_result
    AS
    SELECT R.stuID,C.curID,C.curName,R.result
    FROM t_result R,t_curriculum C
    WHERE R.curID=C.curID
    AND R.result>=60

    SELECT * FROM v_result
    ```
  - 基于函数、分组数据创建视图
    ```
    CREATE VIEW v_teacher_salary
    AS
    SELECT dept,profession,MAX(salary) AS maxSalary
    FROM t_teacher
    GROUP BY dept,profession
    HAVING MAx(salary)>3000

    SELECT * FROM v_teacher_salary
    ```
  - 为视图添加CHECK约束
    - 插入、修改和删除的数据必须满足视图定义中的查询表达式中的查询条件
    ```
    CREATE VIEW 视图名[视图列名1,,...] AS 子查询 WITH CHECK OPTION

    CREATE VIEW v_teacher_dept
    AS
    SELECT teaID,teaName,age,sex,deptID,dept,profession
    FROM t_teacher
    WHERE deptID='t_10'-- 插入、修改和删除时必须满足deptID=t_10
    WITH CHECK OPTION

    SELECT * FROM v_teacher_dept
    ```
  - 基于一个已有视图创建新的视图
    ```
    CREATE VIEW v_result2
    AS
    SELECT stuID,MAX(result)
    FROM v_result
    GROUP BY stuID
    HAVING MAX(result)>=80

    SELECT * FROM v_result2
    ```
  - 创建只读视图
    ```CREATE VIEW 视图名[视图列名1,,...] AS 子查询 WITH READ ONLY-- MySQL不适用```
- 视图的删除
  ```DROP VIEW v_result2```