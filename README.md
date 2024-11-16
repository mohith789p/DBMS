# SQL Queries Repository

This repository contains SQL queries related to employee and department management in a database. Below is a summary of the schema, data insertion, and SQL queries.

---

### Schema

```sql
CREATE TABLE dept (
    deptno NUMBER(2),
    dname VARCHAR2(20),
    loc VARCHAR2(15),
    CONSTRAINT pk_dept PRIMARY KEY (deptno)
);

CREATE TABLE emp (
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2),
    CONSTRAINT pk_emp PRIMARY KEY (empno),
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
```
