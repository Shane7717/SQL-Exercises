# Q1. 查询课程编号为“01”的课程比“02”的课程成绩高的所有学生的学号（重点）
-- 若部分问题答案有问题 欢迎交流指证

# My Original Answer:
select S1.s_id from Score S1, Score S2
where S1.s_id = S2.s_id
and S1.c_id = 01
and S2.c_id = 02
and S1.s_score > S2.s_score;

-- 不太推荐子查询

# 如果光学号不够, 还需要学生相关信息的话
select S.s_id '学生id', S.s_name '学生姓名', S1.s_score '01课程分数', S2.s_score '02课程分数'
from Score S1, Score S2, Student S
where S1.s_id = S2.s_id
and S.s_id = S1.s_id
and S1.c_id = 01
and S2.c_id = 02
and S1.s_score > S2.s_score;
