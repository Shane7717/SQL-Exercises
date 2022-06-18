## :pencil2: SQL-Exercises. :pen: ##

* This repositoroy is used to record some SQL exercises which I think are good ones.
* The exercises may come from different sources such as LeetCode and college courses etc. 
<br><br>

Some Notes: <br>
* Common table expressions (CTEs) are a great way to break up complex queries. MySQL started supporting this in version 8.
* 其中有一系列练习是针对于下面四张表的，附有相关的建表语句。<br/><br/>

学生表：student(学号,学生姓名,出生年月,性别)

CREATE TABLE `Student`(
`s_id` VARCHAR(20),
`s_name` VARCHAR(20) NOT NULL DEFAULT '',
`s_birth` VARCHAR(20) NOT NULL DEFAULT '',
`s_sex` VARCHAR(10) NOT NULL DEFAULT '',
PRIMARY KEY(`s_id`)
);<br/><br/>

课程表：course(课程号,课程名称,教师号)

CREATE TABLE `Course`(
`c_id` VARCHAR(20),
`c_name` VARCHAR(20) NOT NULL DEFAULT '',
`t_id` VARCHAR(20) NOT NULL,
PRIMARY KEY(`c_id`)
);<br/><br/>


教师表：teacher(教师号,教师姓名)

CREATE TABLE `Teacher`(
`t_id` VARCHAR(20),
`t_name` VARCHAR(20) NOT NULL DEFAULT '',
PRIMARY KEY(`t_id`)
);<br/><br/>

成绩表：score(学号,课程号,成绩)

CREATE TABLE `Score`(
`s_id` VARCHAR(20),
`c_id` VARCHAR(20),
`s_score` INT(3),
PRIMARY KEY(`s_id`,`c_id`)
);
